import 'dart:async';
import 'package:dev_frame/networking/response.dart';
import 'package:dev_frame/repository/tenant_repository.dart';
import 'package:dev_frame/models/tenant.dart';

class TenantBloc {
  TenantRepository _tenantRepository;
  StreamController _tenantController, _tenantListController;

  StreamSink<Response<Tenant>> get tenantSink => _tenantController.sink;
  Stream<Response<Tenant>> get tenantStream => _tenantController.stream;

  StreamSink<ResponseList<Tenant>> get tenantListSink =>
      _tenantListController.sink;
  Stream<ResponseList<Tenant>> get tenantListStream =>
      _tenantListController.stream;

  TenantBloc() {
    _tenantListController = StreamController<ResponseList<Tenant>>();
    _tenantController = StreamController<Response<Tenant>>.broadcast();
    _tenantRepository = TenantRepository();
  }

  //Getting tenants details from repository
  getTenantDetails() async {
    tenantListSink.add(ResponseList.loading('Getting Tenant List'));
    try {
      List<Tenant> res = await _tenantRepository.getTenantData();
      tenantListSink.add(ResponseList.completed(res));
      print("TENANT VIEW SUCCESS");
    } catch (e) {
      tenantListSink.add(ResponseList.error(e.toString()));
      print("TENANT VIEW ERROR");
    }
  }

  //Getting tenant add response from repository
  addTenantDetail(name, customerName, adminName, adminEmail, adminUsername,
      adminPassword, status, expiryDate) async {
    tenantSink.add(Response.loading(''));
    try {
      Tenant res = await _tenantRepository.addTenantData(
          name,
          customerName,
          adminName,
          adminEmail,
          adminUsername,
          adminPassword,
          status,
          expiryDate);

      tenantSink.add(Response.completed(res));
      print("TENANT ADD SUCCESS");
    } catch (e) {
      tenantSink.add(Response.error(e.toString()));
      print("TENANT ADD ERROR");
    }
  }

  //Getting tenant edit response from repository
  editTenantDetail(id, name, customerName, adminName, adminEmail, adminUsername,
      adminPassword, status, expiryDate) async {
    tenantSink.add(Response.loading(''));
    try {
      //Getting tenant PUT call response from repository
      Tenant res = await _tenantRepository.editTenantData(
          id,
          name,
          customerName,
          adminName,
          adminEmail,
          adminUsername,
          adminPassword,
          status,
          expiryDate);
      tenantSink.add(Response.completed(res));
      print("TENANT EDIT SUCCESS");
    } catch (e) {
      tenantSink.add(Response.error(e.toString()));
      print("TENANT EDIT ERROR");
    }
  }

  dispose() {
    _tenantController?.close();
    _tenantListController?.close();
  }
}
