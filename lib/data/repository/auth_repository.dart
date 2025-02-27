

import 'package:electronicsshop_app/cores/app_exports.dart';



final authRepositoryProvider = Provider(
      (ref) => AuthRepository(
      client: Client(),
      localStorageRepository: LocalStorageRepository()),
);

final userProvider = StateProvider<UserModel?>((ref) => null);

class AuthRepository {
  final Client _client;
  final LocalStorageRepository _localStorageRepository;

  AuthRepository({
    required Client client,
    required LocalStorageRepository localStorageRepository,
  })  :  _client = client,
        _localStorageRepository = localStorageRepository;

  Future<ErrorModel> loginUser({
    required String email,
    required String password,
  }) async {
    ErrorModel error = ErrorModel(error: 'An unexpected error occurred', data: null);

    try {
      final response = await _client.post(
        Uri.parse('$host/auth'), // Ensure `$host` is correctly set
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final user = UserModel.fromJson(responseData['user']); // Deserialize user data
        final token = responseData['accessToken'];
        final refreshToken = responseData['refreshToken'];
        // Store token locally
        _localStorageRepository.setToken(token);
        _localStorageRepository.setRefreshToken(refreshToken);
        error = ErrorModel(error: null, data: user);
      } else if (response.statusCode == 400) {
        error =  ErrorModel(error: 'All fields are required', data: null);
      } else if (response.statusCode == 401) {
        error =  ErrorModel(error: 'Unauthorized - Invalid credentials', data: null);
      } else {
        error = ErrorModel(error: 'Error logging in', data: null);
      }
    } catch (e) {
      error = ErrorModel(error: e.toString(), data: null);
    }
    return error;
  }


  Future<ErrorModel> createUser({
    required String username,
    required String email,
    required String password,
    List<String>? roles, // Optional roles field
  }) async {
    ErrorModel error = ErrorModel(error: 'An unexpected error occurred', data: null);

    try {
      final response = await _client.post(
        Uri.parse('$host/users'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "username": username,
          "email": email,
          "password": password,
          "roles": roles ?? [],
        }),
      );

      if (response.statusCode == 201) {
        error = ErrorModel(error: null, data: "User created successfully");
      } else if (response.statusCode == 400) {
        error = ErrorModel(error: 'All fields are required', data: null);
      } else if (response.statusCode == 409) {
        error = ErrorModel(error: 'Username and Email have been taken', data: null);
      } else {
        error = ErrorModel(error: 'Error creating user', data: null);
      }
    } catch (e) {
      error = ErrorModel(error: e.toString(), data: null);
    }
    return error;
  }


  // getting logged in user data
  Future<ErrorModel> getUserData() async {
    ErrorModel error = ErrorModel(error: 'An unexpected error occurred', data: null);

    try {
      String? token = await _localStorageRepository.getToken();

      if (token != null) {
        var res = await _client.get(
          Uri.parse('$host/users/user'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        );

        if (res.statusCode == 200) {
          final newUser = UserModel.fromJson(jsonDecode(res.body)['user']);
          error = ErrorModel(error: null, data: newUser);
        } else if (res.statusCode == 401) {
          // Token expired, try refreshing
          bool refreshSuccess = await _refreshToken();
          if (refreshSuccess) {
            return getUserData(); // Retry request after refreshing token
          } else {
            error = ErrorModel(error: 'Session expired. Please log in again.', data: null);
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



  Future<bool> _refreshToken() async {
    try {
      String? refreshToken = await _localStorageRepository.getRefreshToken();

      if (refreshToken == null) {
        return false; // No refresh token available, force logout
      }

      var res = await _client.post(
        Uri.parse('$host/auth/refresh'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"refreshToken": refreshToken}),
      );

      if (res.statusCode == 200) {
        final responseData = jsonDecode(res.body);
        final newAccessToken = responseData['accessToken'];

        _localStorageRepository.setToken(newAccessToken);
        return true; // Successfully refreshed token
      } else {
        return false; // Refresh token is invalid/expired
      }
    } catch (e) {
      return false;
    }
  }


  void signOut(WidgetRef ref) async {
    _localStorageRepository.setToken('');
    _localStorageRepository.setRefreshToken('');
    ref.invalidate(userProvider);
    print("UserProvider invalidated.");
  }

}