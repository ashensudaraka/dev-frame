import 'package:dev_frame/models/tenant.dart';
import 'package:dev_frame/networking/api_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:async';

class TenantRepository {
  ApiProvider _provider = ApiProvider();
  var inputBody, requestHeaders;

  Future<List<Tenant>> getTenantData() async {

    //Initialize shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //Getting access token from shared preferences
    String accessToken = (prefs.getString('token'));

    //Creating tenant GET call headers
    requestHeaders = <String, String>{
      'Content-Type': 'Application/json',
      'Authorization': 'Bearer ' + accessToken
    };

    //Getting tenant response from api_provider
    final response = await _provider.get("api/tenants", requestHeaders);

    //Creating tenant response as a list
    var list = response as List;
    List<Tenant> tenants = list.map((obj) => Tenant.fromJson(obj)).toList();

    return tenants;
  }

  Future<Tenant> addTenantData(name, customerName, adminName, adminEmail, adminUsername, adminPassword, status, expiryDate) async {
    
    //Initialize shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //Getting access token from shared preferences
    String accessToken = (prefs.getString('token'));

    //Creating tenant POST call headers
    requestHeaders = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + accessToken
    };

    //Creating tenant POST call body
    var inputJson = <String, String>{
      'name': name,
      'customerName': customerName,
      'adminName': adminName,
      'adminEmail': adminEmail,
      'adminUsername': adminUsername,
      'adminPassword': adminPassword,
      'status': status,
      'expiryDate': expiryDate
    };

    //Getting tenant response from api_provider
    final response = await _provider.post("api/tenants", requestHeaders, jsonEncode(inputJson));
    return Tenant.fromJson(response);
  }

  Future<Tenant> editTenantData(id, name, customerName, adminName, adminEmail, adminUsername, adminPassword, status, expiryDate) async {
    
    //Initialize shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    //Getting access token from shared preferences
    String accessToken = (prefs.getString('token'));

    //Creating tenant PUT call headers
    requestHeaders = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + accessToken
    };

    //Creating tenant PUT call body
    var inputJson = <String, String>{
      'id': id,
      'name': name,
      'customerName': customerName,
      'adminName': adminName,
      'adminEmail': adminEmail,
      'adminUsername': adminUsername,
      'adminPassword': adminPassword,
      'status': status,
      'expiryDate': expiryDate
    };

    //Getting tenant response from api_provider
    final response = await _provider.put("api/tenants/" + id.toString(), requestHeaders, jsonEncode(inputJson));
    return Tenant.fromJson(response);
  }
}
