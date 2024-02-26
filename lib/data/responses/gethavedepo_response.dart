class GethavewareResponse {
  int idWarehouse;
  int idCompany;
  bool flActive;
  String dsWarehouse;
  String dsGuidId;
  String dtInsertDate;
  String dtUpdateDate;
  int idUserInsert;
  int idUserUpdate;
  dynamic messages;
  List<dynamic> messageList;
  int dbStatus;

  GethavewareResponse({
    this.idWarehouse,
    this.idCompany,
    this.flActive,
    this.dsWarehouse,
    this.dsGuidId,
    this.dtInsertDate,
    this.dtUpdateDate,
    this.idUserInsert,
    this.idUserUpdate,
    this.messages,
    this.messageList,
    this.dbStatus,
  });

  GethavewareResponse.fromJson(Map<String, dynamic> json) {
    idWarehouse = json['idWarehouse'];
    idCompany = json['idCompany'];
    flActive = json['flActive'];
    dsWarehouse = json['dsWarehouse'];
    dsGuidId = json['dsGuidId'];
    dtInsertDate = json['dtInsertDate'];
    dtUpdateDate = json['dtUpdateDate'];
    idUserInsert = json['idUserInsert'];
    idUserUpdate = json['idUserUpdate'];
    messages = json['messages'];
    if (json['messageList'] != null) {
      messageList = <dynamic>[];
      json['messageList'].forEach((v) {
        messageList.add(v);
      });
    }
    dbStatus = json['dbStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'idWarehouse': idWarehouse,
      'idCompany': idCompany,
      'flActive': flActive,
      'dsWarehouse': dsWarehouse,
      'dsGuidId': dsGuidId,
      'dtInsertDate': dtInsertDate,
      'dtUpdateDate': dtUpdateDate,
      'idUserInsert': idUserInsert,
      'idUserUpdate': idUserUpdate,
      'messages': messages,
      'dbStatus': dbStatus,
    };
    if (messageList != null) {
      data['messageList'] = messageList.map((v) => v).toList();
    }
    return data;
  }
}
