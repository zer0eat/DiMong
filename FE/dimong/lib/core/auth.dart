import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:secret_app/model/user.dart';
import 'package:secret_app/util/api_routes.dart';
import 'package:secret_app/util/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

// https://velog.io/@kw2577/Flutter-%EC%8A%A4%EB%82%98%EC%9D%B4%ED%8D%BC%ED%8C%A9%ED%86%A0%EB%A6%AC-7%EC%A3%BC%EC%B0%A8-%EC%A3%BC%EA%B0%84%ED%8F%89%EA%B0%80-%EB%B9%84%EB%B0%80%EB%93%A3%EB%8A%94-%EA%B3%A0%EC%96%91%EC%9D%B4-%EC%97%85%EB%8D%B0%EC%9D%B4%ED%8A%B8
class AuthController extends GetxController {
  final Rxn<User> _user = Rxn(); //유저 정보
  String? _token; //토큰 값
  final Dio dio = Dio(BaseOptions(
      baseUrl: 'http://52.79.115.43:8090/')); //dio 객체

  User? get user => _user.value; //user 정보 읽기

  //로그인
  login(String id, String pw, bool isLoginInfoSave) async {
    try {
      var res = await dio.post(
        ApiRoutes.authWithPassword,
        data: {
          'identity': id,
          'password': pw,
        },
      );

      if (res.statusCode == 200) {
        //토큰 값 저장
        if (isLoginInfoSave) {
          _token = res.data['token'];
          final prefs = await SharedPreferences.getInstance();
          prefs.setString('token', _token!); //로컬에 토큰 값 저장
        }
        var user = User.fromMap(res.data['record']);
        _user(user); //유저 정보 저장
      }
    } on DioError catch (e) {
      print(e.message);
    }
  }

  //로그 아웃
  logout() async {
    _user.value = null; //유저 정보 삭제
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token'); //자동 로그인 토큰 삭제
  }

  //회원 가입
  signup(
      String email,
      String password,
      String passwordConfirm,
      String username,
      ) async {
    try {
      await dio.post(
        ApiRoutes.signup,
        data: {
          'email': email,
          'password': password,
          'passwordConfirm': passwordConfirm,
          'username': username,
        },
      );
    } on DioError catch (e) {
      print(e);
    }
  }

  //유저 정보에 따른 페이지 이동
  _handleAuthChanged(User? data) {
    //유저 정보가 있으면 메인페이지로 이동
    if (data != null) {
      Get.offNamed(AppRoutes.main);
      return;
    }
    //유저 정보가 없으면 로그인 페이지로 이동
    Get.offAllNamed(AppRoutes.login);
    return;
  }

  //로컬에 저장된 토큰을 가져옴
  _autoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token'); //로컬의 토큰 값을 가져와 저장

    //토큰이 있는 경우
    if (_token != null) {
      try {
        //로그인 요청
        var res = await dio.post(
          ApiRoutes.authRefresh,
          options: Options(headers: {"Authorization": 'Bearer $_token'}),
        );

        if (res.statusCode == 200) {
          var user = User.fromMap(res.data['record']);
          _user(user); //유저 정보 저장
        }
      } on DioError catch (e) {
        print(e.message);
      }
    } else {
      //토큰이 없으면 로그인 페이지로 이동
      Get.offNamed(AppRoutes.login);
    }
  }

  @override
  void onInit() {
    super.onInit();
    //splash 화면을 2초동안 보여줌
    Future.delayed(const Duration(seconds: 2), () {
      _autoLogin();
    });
    //유저 정보를 관찰하여 변경된 경우 실행
    ever(_user, _handleAuthChanged);
  }
}