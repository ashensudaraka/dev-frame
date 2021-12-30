import 'package:dev_frame/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'custom_exception.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';

class ApiProvider {
  String baseUrl;
  //"http://52.66.208.223:5300/";

  getServerIp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String serverIp = (prefs.getString('serverIp'));
    serverIp = "http://" + serverIp + "/";
    return serverIp;
  }

  Future<dynamic> get(String url, requestHeaders) async {
    baseUrl = await getServerIp();
    var responseJson;
    try {
      final response =
          await http.get(Uri.parse(baseUrl + url), headers: requestHeaders);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException(DevFrameLocalization.current.networkError);
    }
    return responseJson;
  }

  Future<dynamic> post(String url, requestHeaders, inputBody) async {
    baseUrl = await getServerIp();
    var responseJson;

    try {
      final response = await http.post(
        Uri.parse(baseUrl + url),
        headers: requestHeaders,
        body: inputBody,
      );
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException(DevFrameLocalization.current.networkError);
    }
    return responseJson;
  }

  Future<dynamic> put(String url, inputHeaders, inputBody) async {
    baseUrl = await getServerIp();
    var responseJson;
    try {
      final response = await http.put(
        Uri.parse(baseUrl + url),
        headers: inputHeaders,
        body: inputBody,
      );
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException(DevFrameLocalization.current.networkError);
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
   
    switch (response.statusCode) {
      case 200:
        try {
          var responseJson = json.decode(response.body.toString());
          return responseJson;
        } catch (error) {
          throw InvalidCredentials('');
        }
        break;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
        throw UndefinedException('');
      default:
        throw FetchDataException(
            DevFrameLocalization.current.status502ErrorDesc +
                response.statusCode.toString());
    }
  }
}
