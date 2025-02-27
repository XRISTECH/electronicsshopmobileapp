import 'package:electronicsshop_app/cores/app_exports.dart';


class LocalStorageRepository {

void setToken(String token) async {
try {
SharedPreferences preferences = await SharedPreferences.getInstance();
preferences.setString('x-auth-token', token);
} catch (e) {
print('Error setting token: $e');
// Handle the error as needed, e.g., show a message to the user
}
}

Future<String?> getToken() async {
try {
SharedPreferences preferences = await SharedPreferences.getInstance();
String? token = preferences.getString('x-auth-token');
return token;
} catch (e) {
print('Error getting token: $e');
// Handle the error as needed, e.g., return a default value
return null;
}
}

void setRefreshToken(String token) async {
  try {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('refresh-token', token);
  } catch (e) {
    print('Error setting token: $e');
// Handle the error as needed, e.g., show a message to the user
  }
}

Future<String?> getRefreshToken() async {
  try {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString('refresh-token');
    return token;
  } catch (e) {
    print('Error getting token: $e');
// Handle the error as needed, e.g., return a default value
    return null;
  }
}

}