class GetSmsSettingsResponse {
  int idSmsSettings;
  int idCompany;
  bool flActive;
  String dsUserName;
  String dsPassword;
  String dsSender;
  String dsGuidId;
  String dsToken;
  String dsCompanyCode;
  int idProvider;
  String dtInsertDate;
  String dtUpdateDate;
  int idUserInsert;
  int idUserUpdate;
  int dbStatus;

  GetSmsSettingsResponse(
      {this.idSmsSettings,
      this.idCompany,
      this.flActive,
      this.dsUserName,
      this.dsPassword,
      this.dsSender,
      this.dsGuidId,
      this.dsToken,
      this.dsCompanyCode,
      this.idProvider,
      this.dtInsertDate,
      this.dtUpdateDate,
      this.idUserInsert,
      this.idUserUpdate,
      this.dbStatus});

  GetSmsSettingsResponse.fromJson(Map<String, dynamic> json) {
    idSmsSettings = json['idSmsSettings'];
    idCompany = json['idCompany'];
    flActive = json['flActive'];
    dsUserName = json['dsUserName'];
    dsPassword = json['dsPassword'];
    dsSender = json['dsSender'];
    dsGuidId = json['dsGuidId'];
    dsToken = json['dsToken'];
    dsCompanyCode = json['dsCompanyCode'];
    idProvider = json['idProvider'];
    dtInsertDate = json['dtInsertDate'];
    dtUpdateDate = json['dtUpdateDate'];
    idUserInsert = json['idUserInsert'];
    idUserUpdate = json['idUserUpdate'];
    dbStatus = json['dbStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idSmsSettings'] = idSmsSettings;
    data['idCompany'] = idCompany;
    data['flActive'] = flActive;
    data['dsUserName'] = dsUserName;
    data['dsPassword'] = dsPassword;
    data['dsSender'] = dsSender;
    data['dsGuidId'] = dsGuidId;
    data['dsToken'] = dsToken;
    data['dsCompanyCode'] = dsCompanyCode;
    data['idProvider'] = idProvider;
    data['dtInsertDate'] = dtInsertDate;
    data['dtUpdateDate'] = dtUpdateDate;
    data['idUserInsert'] = idUserInsert;
    data['idUserUpdate'] = idUserUpdate;
    data['dbStatus'] = dbStatus;
    return data;
  }
}
