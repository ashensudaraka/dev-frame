// To parse this JSON data, do
//
//     final userDetails = userDetailsFromJson(jsonString);

import 'dart:convert';

UserDetails userDetailsFromJson(String str) => UserDetails.fromJson(json.decode(str));

String userDetailsToJson(UserDetails data) => json.encode(data.toJson());

class UserDetails {
    UserDetails({
        this.firstName,
    });

    String firstName;

    factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        firstName: json["firstName"],
    );

    Map<String, dynamic> toJson() => {
        "firstName": firstName,
    };
}
