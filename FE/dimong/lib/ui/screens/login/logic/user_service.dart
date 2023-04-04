import '../../ui/screens/login/domain/user_profile.dart';
import './user_repository.dart';

class UserService {
  final UserRepository _userRepository;

  UserService({required UserRepository userRepository})
      : _userRepository = userRepository;

  Future<void> saveUserProfile(UserProfile userProfile) async {
    await _userRepository.saveUserProfile(userProfile);
  }

  Future<UserProfile?> getUserProfile() async {
    return await _userRepository.getUserProfile();
  }
}