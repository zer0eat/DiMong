import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../local_storage/secure_storage.dart';
import 'package:dimong/ui/screens/login/data/data.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final SecureStorage _secureStorage = SecureStorage();

  //late UserProfile _userProfile;
  late User _user;
  bool _loggedIn = false;

  AuthProvider() {
    _firebaseAuth.authStateChanges().listen((User? user) {
      _user = user!;
      _loggedIn = user != null;
      notifyListeners();
    });
  }

  bool get isSignedIn => _loggedIn;

  User get user => _user;

  Future<void> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential authResult = await _firebaseAuth.signInWithCredential(credential);
      if (authResult != null){
        final User? user = authResult.user;
        // update accessToken
        await _secureStorage.setAccessToken(credential.accessToken);

        final bool isNewUser = authResult.additionalUserInfo!.isNewUser;
        if (isNewUser) {
          await _createUserInFirestore(user);
        }
        await _updateTokens(authResult);
      }
      else{
        print('111111111111111111111111');
        _loginNewTokens();
      }

    } catch (error) {
      print(error);
      rethrow;
    }
  }

  Future<void> logout() async {
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
    await _secureStorage.deleteRefreshToken();
  }

  Future<void> _createUserInFirestore(User? user) async {
    try {
      final CollectionReference users = _firestore.collection('users');

      final Map<String, dynamic> data = {
        'email': user!.email,
        'displayName': user!.displayName,
        'photoUrl': user!.photoURL,
        'createdAt': FieldValue.serverTimestamp(),
      };

      await users.doc(user.uid).set(data);
    } catch (error) {
      print(error);
      rethrow;
    }
  }
  Future<void> _loginNewTokens() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;
      final String idToken = googleSignInAuthentication.idToken!;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: idToken,
      );
      final UserCredential authResult = await _firebaseAuth.signInWithCredential(credential);
      if (authResult != null){
        final User? user = authResult.user;
        // update accessToken
        await _secureStorage.setAccessToken(credential.accessToken);
        /*_userProfile = UserProfile(email: user!.email!, fullName: user.displayName!, profileImageUrl: user.photoURL!, uId: user.uid!);
        UserProfile? isLogged = await _sharedRepository.getUserProfile();
        // 로그인 기록이 없으면 라이브러리에 정보를 저장한다.
        if (isLogged==null)
        {
          _sharedRepository.saveUserProfile(_userProfile);
          final res = await _loginApiClient.sendId(credential.accessToken!);
          _sharedRepository.saveUserId(res.userId!);
        }*/
        final bool isNewUser = authResult.additionalUserInfo!.isNewUser;
        if (isNewUser) {
          await _createUserInFirestore(user);
        }
        await _updateTokens(authResult);
      }
    } catch (error) {
      print(error);
      rethrow;
    }
  }
  Future<void> _updateTokens(UserCredential authResult) async {
    try {
      final String? idToken = await authResult.user!.getIdToken();
      final String? refreshToken = authResult.user!.refreshToken;
      await _secureStorage.setIdToken(idToken);
      await _secureStorage.setRefreshToken(refreshToken);
    } catch (error) {
      print(error);
      rethrow;
    }
  }
  Future<String?> getIdToken() async {
    return await _secureStorage.getIdToken();
  }
  Future<void> setIdToken(String? idToken) async {
    await _secureStorage.setIdToken(idToken);
  }
  Future<String?> getAccessToken() async {
    return await _secureStorage.getAccessToken();
  }
  Future<void> setAccessToken(String? accessToken) async {
    return await _secureStorage.setAccessToken(accessToken);
  }
  Future<String?> getRefreshToken() async {
    return await _secureStorage.getRefreshToken();
  }
  Future<void> setRefreshToken(String? refreshToken) async {
    return await _secureStorage.setRefreshToken(refreshToken);
  }
}