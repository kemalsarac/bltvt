class GetSmsBalanceRequest {
  String username;
  String password;
  int idProvider;

  GetSmsBalanceRequest({this.username, this.password, this.idProvider});

  GetSmsBalanceRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    idProvider = json['idProvider'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    data['idProvider'] = idProvider;
    return data;
  }
}
