import 'dart:convert';

import 'package:dev_frame/models/user_details.dart';
import 'package:dev_frame/networking/api_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class UserDetailsRepository {
  ApiProvider _provider = ApiProvider();
  var inputBody, requestHeaders;

  Future<UserDetails> getUserDetails() async {
    
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = (prefs.getString('token'));

    requestHeaders = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + accessToken
    };

    var inputJson = <String, String>{
      'sessionId': accessToken,  
    };

    final response = await _provider.post("api/user_details", requestHeaders, jsonEncode(inputJson));

    return UserDetails.fromJson(response);
  }
}
