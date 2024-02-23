class depohak {
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

  depohak(
      {this.idWarehouse,
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
      this.dbStatus});

  depohak.fromJson(Map<String, dynamic> json) {
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
      messageList = <Null>[];
      json['messageList'].forEach((v) {
        messageList.add(v);
      });
    }
    dbStatus = json['dbStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idWarehouse'] = this.idWarehouse;
    data['idCompany'] = this.idCompany;
    data['flActive'] = this.flActive;
    data['dsWarehouse'] = this.dsWarehouse;
    data['dsGuidId'] = this.dsGuidId;
    data['dtInsertDate'] = this.dtInsertDate;
    data['dtUpdateDate'] = this.dtUpdateDate;
    data['idUserInsert'] = this.idUserInsert;
    data['idUserUpdate'] = this.idUserUpdate;
    data['messages'] = this.messages;
    if (this.messageList != null) {
      data['messageList'] = this.messageList.map((v) => v.toJson()).toList();
    }
    data['dbStatus'] = this.dbStatus;
    return data;
  }
}