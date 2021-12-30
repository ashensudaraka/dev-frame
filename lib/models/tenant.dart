import 'dart:convert';

List<Tenant> tenantFromJson(String str) => List<Tenant>.from(json.decode(str).map((x) => Tenant.fromJson(x)));

String tenantToJson(List<Tenant> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tenant {
    Tenant({
      this.id,
      this.name,
      this.customerName,
      this.noOfConnectedUsers,
      this.noOfTotalUsers,
      this.adminName,
      this.adminEmail,
      this.adminUsername,
      this.adminPassword,
      this.status,
      this.expiryDate,
    });

    int id;
    String name;
    String customerName;
    int noOfConnectedUsers;
    int noOfTotalUsers;
    String adminName;
    String adminEmail;
    String adminUsername;
    dynamic adminPassword;
    String status;
    DateTime expiryDate;

    factory Tenant.fromJson(Map<String, dynamic> json) => Tenant(
      id: json["id"],
      name: json["name"],
      customerName: json["customerName"],
      noOfConnectedUsers: json["noOfConnectedUsers"] == null ? null : json["noOfConnectedUsers"],
      noOfTotalUsers: json["noOfTotalUsers"] == null ? null : json["noOfTotalUsers"],
      adminName: json["adminName"],
      adminEmail: json["adminEmail"],
      adminUsername: json["adminUsername"],
      adminPassword: json["adminPassword"],
      status: json["status"] == null ? null : json["status"],
      expiryDate: json["expiryDate"] == null ? null : DateTime.parse(json["expiryDate"]),
    );

    Map<String, dynamic> toJson() => {
      "id": id,
      "name": name,
      "customerName": customerName,
      "noOfConnectedUsers": noOfConnectedUsers == null ? null : noOfConnectedUsers,
      "noOfTotalUsers": noOfTotalUsers == null ? null : noOfTotalUsers,
      "adminName": adminName,
      "adminEmail": adminEmail,
      "adminUsername": adminUsername,
      "adminPassword": adminPassword,
      "status": status == null ? null : status,
      "expiryDate": expiryDate == null ? null : expiryDate.toIso8601String(),
    };
}