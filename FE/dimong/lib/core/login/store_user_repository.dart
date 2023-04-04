import 'package:shared_preferences/shared_preferences.dart';
import './user_repository.dart';
import './user_profile.dart';

class SharedPreferencesUserRepository implements UserRepository {
  static const _keyEmail = 'user.email';
  static const _keyFullName = 'user.fullName';
  static const _keyProfileImageUrl = 'user.profileImageUrl';

  @override
  Future<void> saveUserProfile(UserProfile userProfile) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyEmail, userProfile.email);
    await prefs.setString(_keyFullName, userProfile.fullName);
    await prefs.setString(_keyProfileImageUrl, userProfile.profileImageUrl);
  }

  @override
  Future<UserProfile?> getUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString(_keyEmail);
    final fullName = prefs.getString(_keyFullName);
    final profileImageUrl = prefs.getString(_keyProfileImageUrl);

    if (email != null && fullName != null && profileImageUrl != null) {
      return UserProfile(email: email, fullName: fullName, profileImageUrl: profileImageUrl);
    } else {
      return null;
    }
  }
}
