// Import necessary dependencies
import 'package:electronicsshop_app/cores/app_exports.dart';
import '../../cores/app_exports.dart' as http;

// Provider for managing authentication repository
final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
      client: Client(),// HTTP client for making network requests
      googleSignIn: GoogleSignIn(),
      localStorageRepository:
          LocalStorageRepository()), // Handles local storage
);

// Provides a state management variable to store user data
final userProvider = StateProvider<UserModel?>((ref) => null);

class AuthRepository {
  final Client _client;
  final GoogleSignIn _googleSignIn;
  final LocalStorageRepository _localStorageRepository;

// Constructor to initialize the authentication repository
  AuthRepository({
    required Client client,
    required GoogleSignIn googleSignIn,
    required LocalStorageRepository localStorageRepository,
  })  : _client = client,
        _googleSignIn = googleSignIn,
        _localStorageRepository = localStorageRepository;

  Future<ErrorModel> loginUser({
    required String email,
    required String password,
  }) async {
    // Default error response
    ErrorModel error =
        ErrorModel(error: 'An unexpected error occurred', data: null);

    try {
      // Making a POST request to the authentication endpoint
      final response = await _client.post(
        Uri.parse('$host/auth'), // Ensure `$host` is correctly set
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );
      // Handling different response statuses
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final user =
            UserModel.fromJson(responseData['user']); // Deserialize user data
        final token = responseData['accessToken'];
        final refreshToken = responseData['refreshToken'];
        // Store token locally for future authentication
        _localStorageRepository.setToken(token);
        _localStorageRepository.setRefreshToken(refreshToken);
        error = ErrorModel(error: null, data: user);
      } else if (response.statusCode == 400) {
        error = ErrorModel(error: 'All fields are required', data: null);
      } else if (response.statusCode == 401) {
        error =
            ErrorModel(error: 'Unauthorized - Invalid credentials', data: null);
      } else {
        error = ErrorModel(error: 'Error logging in', data: null);
      }
    } catch (e) {
      error = ErrorModel(error: e.toString(), data: null);
    }
    return error;
  }

  Future<ErrorModel> signInWithGoogle() async {
    ErrorModel error =
    ErrorModel(error: 'An unexpected error occured', data: null);

    try {
      final user = await _googleSignIn.signIn();

      if (user != null) {
        final userAcc = UserModel(
            username: user.displayName ?? '',
            email: user.email,
            profilePic: user.photoUrl ?? '',
            uid: '',
        );
    print(userAcc.toJson());
        final res = await _client.post(Uri.parse('$host/googleSignIn'),
            body: jsonEncode(userAcc.toJson()),
            headers: {
              'Content-Type': 'application/json',
            });

        if (res.statusCode == 201) {
          final responseData = jsonDecode(res.body);
          final user =
          UserModel.fromJson(responseData['user']); // Deserialize user data
          final token = responseData['accessToken'];
          final refreshToken = responseData['refreshToken'];
          // Store token locally for future authentication
          _localStorageRepository.setToken(token);
          _localStorageRepository.setRefreshToken(refreshToken);
          error = ErrorModel(error: null, data: user);
        } else {
          // Handle non-200 status codes here, if needed
          error = ErrorModel(error: 'Failed to create user', data: null);
        }
      }
    } catch (e) {
      error = ErrorModel(error: "Unstable connection please try again no vex 🙏", data: null);
    }

    return error;
  }


// Method to create a new user
  Future<ErrorModel> createUser({
    required String username,
    required String email,
    required String password,
    List<String>? roles, // Optional roles field
  }) async {
    ErrorModel error =
        ErrorModel(error: 'An unexpected error occurred', data: null);

    try {
      final response = await _client.post(
        Uri.parse('$host/users'), // API endpoint to create a user
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "username": username,
          "email": email,
          "password": password,
          "roles": roles ?? [],
        }),
      );
      // Handling different response statuses
      if (response.statusCode == 201) {
        error = ErrorModel(error: null, data: "User created successfully");
      } else if (response.statusCode == 400) {
        error = ErrorModel(error: 'All fields are required', data: null);
      } else if (response.statusCode == 409) {
        error =
            ErrorModel(error: 'Username and Email have been taken', data: null);
      } else {
        error = ErrorModel(error: 'Error creating user', data: null);
      }
    } catch (e) {
      error = ErrorModel(error: e.toString(), data: null);
    }
    return error;
  }

  // Method to get the currently logged-in user data
  Future<ErrorModel> getUserData() async {
    ErrorModel error =
        ErrorModel(error: 'An unexpected error occurred', data: null);

    try {
      String? token = await _localStorageRepository.getToken();
      if (token != '') {
        var res = await _client.get(
          Uri.parse('$host/users/user'), // API endpoint to get user details
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token', // Pass token for authentication
          },
        );
        // Handling different response statuses
        if (res.statusCode == 200) {
          final newUser = UserModel.fromJson(jsonDecode(res.body)['user']);
          error = ErrorModel(error: null, data: newUser);
        } else if (res.statusCode == 401) {
          // Token expired, try refreshing
          bool refreshSuccess = await _refreshToken();
          if (refreshSuccess) {
            return getUserData(); // Retry request after refreshing token
          } else {
            error = ErrorModel(
                error: 'Session expired. Please log in again.', data: null);
          }
        } else {
          error = ErrorModel(error: 'Error fetching user data', data: null);
        }
      } else {
        error = ErrorModel(error: 'No token found', data: null);
      }
    } catch (e) {
      error = ErrorModel(error: e.toString(), data: null);
    }
    return error;
  }

// Method to refresh access token
  Future<bool> _refreshToken() async {
    try {
      String? refreshToken = await _localStorageRepository
          .getRefreshToken(); // Retrieve refresh token

      if (refreshToken == null) {
        return false; // No refresh token available, force logout
      }

      var res = await _client.post(
        Uri.parse('$host/auth/refresh'), // API endpoint to refresh token
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"refreshToken": refreshToken}),
      );

      if (res.statusCode == 200) {
        final responseData = jsonDecode(res.body);
        final newAccessToken = responseData['accessToken'];

        _localStorageRepository
            .setToken(newAccessToken); // Store new access token
        return true; // Successfully refreshed token
      } else {
        return false; // Refresh token is invalid/expired
      }
    } catch (e) {
      return false;
    }
  }


  Future<ErrorModel> updateProfilePic({required XFile imageFile}) async {
    ErrorModel error = ErrorModel(error: 'An unexpected error occurred', data: null);

    try {
      String? token = await _localStorageRepository.getToken();
      if (token == null || token.isEmpty) {
        return ErrorModel(error: 'Unauthorized: No token found', data: null);
      }

      var request = http.MultipartRequest(
        'PATCH',
        Uri.parse('$host/users/upload'),
      );

      request.headers['Authorization'] = 'Bearer $token';

      // Use `fromPath` to upload the file directly
      request.files.add(
        await http.MultipartFile.fromPath(
          'profilePic',
          imageFile.path,
        ),
      );

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        error = ErrorModel(error: null, data: responseData['message']);
      } else {
        error = ErrorModel(error: 'Failed to update profile picture', data: null);
      }
    } catch (e) {
      error = ErrorModel(error: e.toString(), data: null);
    }

    return error;
  }

  // Method to update user details
  Future<ErrorModel> updateUser({
    required String username,
    required String email,
  }) async {
    ErrorModel error =
    ErrorModel(error: 'An unexpected error occurred', data: null);

    try {
      // Retrieve the stored access token
      String? token = await _localStorageRepository.getToken();

      if (token == null) {
        error = ErrorModel(error: 'No authentication token found', data: null);
      }

      final response = await _client.patch(
        Uri.parse('$host/users/update'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          "username": username,
          "email": email,
        }),
      );

      // Handling different response statuses
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        error = ErrorModel(error: null, data: responseData['message']);
      } else {
        error = ErrorModel(
          error: jsonDecode(response.body)['message'] ?? 'Failed to update user',
          data: null,
        );
      }
    } catch (e) {
      error = ErrorModel(error: e.toString(), data: null);
    }
    return error;
  }
// Method to sign out user and clear stored tokens
  void signOut(WidgetRef ref) async {
    _localStorageRepository.setToken(''); // Clear token
    _localStorageRepository.setRefreshToken(''); // Clear refresh token
    ref.invalidate(userProvider); // Reset User state
    // ignore: avoid_print
    print("UserProvider invalidated."); // Print Debugging message
  }



}



