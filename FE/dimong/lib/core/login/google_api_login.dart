import 'package:dimong/core/auth/auth_provider.dart';

class Auth {
  AuthProvider authProvider = AuthProvider();

  Future<void> login() async {
    await authProvider.loginWithGoogle();
  }

  Future<void> logOut() async {
    await authProvider.logout();
  }

}