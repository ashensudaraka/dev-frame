class Login {
  String tokenType;
  String accessToken;
  int expiresIn;

  Login({this.tokenType, this.accessToken, this.expiresIn});

  Login.fromJson(Map<String, dynamic> map) {
    tokenType = map['token_type'];
    accessToken = map['access_token'];
    expiresIn = map['expires_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token_type'] = this.tokenType;
    data['access_token'] = this.accessToken;
    data['expires_in'] = this.expiresIn;
    return data;
  }
}