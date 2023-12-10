class GetAllColorResponse {
  int idColor;
  String dsColor;
  bool valid;
  String dtInsertDate;
  String dtUpdateDate;
  int idUserInsert;
  int idUserUpdate;
  String messages;
  int dbStatus;

  GetAllColorResponse(
      {this.idColor,
      this.dsColor,
      this.valid,
      this.dtInsertDate,
      this.dtUpdateDate,
      this.idUserInsert,
      this.idUserUpdate,
      this.messages,
      this.dbStatus});

  GetAllColorResponse.fromJson(Map<String, dynamic> json) {
    idColor = json['idColor'];
    dsColor = json['dsColor'];
    valid = json['valid'];
    dtInsertDate = json['dtInsertDate'];
    dtUpdateDate = json['dtUpdateDate'];
    idUserInsert = json['idUserInsert'];
    idUserUpdate = json['idUserUpdate'];
    messages = json['messages'];
    dbStatus = json['dbStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idColor'] = idColor;
    data['dsColor'] = dsColor;
    data['valid'] = valid;
    data['dtInsertDate'] = dtInsertDate;
    data['dtUpdateDate'] = dtUpdateDate;
    data['idUserInsert'] = idUserInsert;
    data['idUserUpdate'] = idUserUpdate;
    data['messages'] = messages;
    data['dbStatus'] = dbStatus;
    return data;
  }
}
