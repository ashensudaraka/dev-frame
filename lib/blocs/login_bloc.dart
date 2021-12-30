import 'dart:async';
import 'package:dev_frame/models/login.dart';
import 'package:dev_frame/networking/response.dart';
import 'package:dev_frame/repository/login_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBloc {
  LoginRepository _loginRepository;
  StreamController _loginController;

  StreamSink<Response<Login>> get loginSink => _loginController.sink;
  Stream<Response<Login>> get loginStream => _loginController.stream;

  LoginBloc() {
    _loginController = StreamController<Response<Login>>.broadcast();
    _loginRepository = LoginRepository();
  }

  getLoginData(String username, String password) async {
    loginSink.add(Response.loading(''));
    try {
      Login res = await _loginRepository.getLoginData(username, password);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', res.accessToken.toString());
      loginSink.add(Response.completed(res));
      print("LOGIN SUCCESS");
    } catch (e) {
      loginSink.add(Response.error(e.toString()));
      print("LOGIN ERROR");
    }
  }

  dispose() {
    _loginController?.close();
  }
}
