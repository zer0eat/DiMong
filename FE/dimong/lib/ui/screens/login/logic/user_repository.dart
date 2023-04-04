import '../../ui/screens/login/domain/user_profile.dart';
import './store_user_repository.dart';

abstract class UserRepository {
  final SharedPreferencesUserRepository _sharedPreferencesUserRepository = SharedPreferencesUserRepository();

  Future<void> saveUserProfile(UserProfile userProfile) async {
    await _sharedPreferencesUserRepository.saveUserProfile(userProfile);
  }

  Future<UserProfile?> getUserProfile() async {
    return await _sharedPreferencesUserRepository.getUserProfile();
  }
}