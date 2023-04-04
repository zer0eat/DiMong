import 'package:shared_preferences/shared_preferences.dart';
import './user_repository.dart';
import '../../ui/screens/login/domain/user_profile.dart';

class SharedPreferencesUserRepository implements UserRepository {
  static const _keyEmail = 'user.email';
  static const _keyFullName = 'user.fullName';
  static const _keyProfileImageUrl = 'user.profileImageUrl';
  static const _keyUId = 'user.uId';

  @override
  Future<void> saveUserProfile(UserProfile userProfile) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyEmail, userProfile.email);
    await prefs.setString(_keyFullName, userProfile.fullName);
    await prefs.setString(_keyProfileImageUrl, userProfile.profileImageUrl);
    await prefs.setString(_keyUId, userProfile.uId);
  }

  @override
  Future<UserProfile?> getUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString(_keyEmail);
    final fullName = prefs.getString(_keyFullName);
    final profileImageUrl = prefs.getString(_keyProfileImageUrl);
    final uId = prefs.getString(_keyUId);

    if (email != null && fullName != null && profileImageUrl != null) {
      return UserProfile(email: email, fullName: fullName, profileImageUrl: profileImageUrl, uId: uId!);
    } else {
      return null;
    }
  }
}
