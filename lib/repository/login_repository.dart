import 'package:dev_frame/models/login.dart';
import 'package:dev_frame/networking/api_provider.dart';
import 'dart:async';

class LoginRepository {
  ApiProvider _provider = ApiProvider();
  //String accessToken;
  var inputBody, inputHeaders;
 
  Future<Login> getLoginData(String username, String password) async {

    //Creating login POST call headers
    inputHeaders = <String, String>{
      'Content-Type':'application/x-www-form-urlencoded',
    };

    //Creating login POST call body
    inputBody = <String, String>{
      'username': username,
      'password': password,
      'grant_type': 'password',
      'client_id': 'null',
      'client_secret': 'null'
    };

    //Getting login response from api_provider
    final response = await _provider.post("api/login", inputHeaders, inputBody);

    return Login.fromJson(response);
  }
}
