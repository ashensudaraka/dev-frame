// To parse this JSON data, do
//
//     final logout = logoutFromJson(jsonString);

import 'dart:convert';

Logout logoutFromJson(String str) => Logout.fromJson(json.decode(str));

String logoutToJson(Logout data) => json.encode(data.toJson());

class Logout {
    Logout({
        this.logoutMessage,
        this.logout,
    });

    String logoutMessage;
    bool logout;

    factory Logout.fromJson(Map<String, dynamic> json) => Logout(
        logoutMessage: json["logoutMessage"],
        logout: json["logout"],
    );

    Map<String, dynamic> toJson() => {
        "logoutMessage": logoutMessage,
        "logout": logout,
    };
}
