import 'dart:async';
import 'package:dev_frame/models/user_details.dart';
import 'package:dev_frame/networking/response.dart';
import 'package:dev_frame/repository/user_details_repository.dart';

class UserDetailsBloc {
  UserDetailsRepository _userDetailsRepository;
  StreamController _userDetailsController;

  StreamSink<Response<UserDetails>> get userDetailsSink =>
      _userDetailsController.sink;
  Stream<Response<UserDetails>> get userDetailsStream =>
      _userDetailsController.stream;

  UserDetailsBloc() {
    _userDetailsController = StreamController<Response<UserDetails>>();
    _userDetailsRepository = UserDetailsRepository();
  }

  //Getting logged username from repository
  getUserDetails() async {
    try {
      UserDetails res = await _userDetailsRepository.getUserDetails();
      userDetailsSink.add(Response.completed(res));
      print("USER DETAILS VIEW SUCCESS");
    } catch (e) {
      userDetailsSink.add(Response.error(e.toString()));
      print("USER DETAILS VIEW ERROR");
    }
  }

  dispose() {
    _userDetailsController?.close();
  }
}
