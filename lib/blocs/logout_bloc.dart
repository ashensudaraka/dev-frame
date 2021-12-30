import 'dart:async';
import 'package:dev_frame/models/logout.dart';
import 'package:dev_frame/networking/response.dart';
import 'package:dev_frame/repository/logout_repository.dart';

class LogoutBloc {
  LogoutRepository _logoutRepository;
  StreamController _logoutController;

  StreamSink<Response<Logout>> get logoutSink => _logoutController.sink;
  Stream<Response<Logout>> get logoutStream => _logoutController.stream;

  LogoutBloc() {
    _logoutController = StreamController<Response<Logout>>();
    _logoutRepository = LogoutRepository();
  }

  //Getting logout response from repository
  getLogoutData() async {
    try {
      Logout res = await _logoutRepository.getLogout();
      logoutSink.add(Response.completed(res));
      print("LOGOUT VIEW SUCCESS");
    } catch (e) {
      logoutSink.add(Response.error(e.toString()));
      print("LOGOUT VIEW ERROR");
    }
  }

  dispose() {
    _logoutController?.close();
  }
}
