class GetAllPatientTypeResponse {
  int idPatientType;
  String dsPatientType;
  String dtInsertDate;
  String dtUpdateDate;
  int idUserInsert;
  int idUserUpdate;
  String messages;
  int dbStatus;
  String dsPatientName;
  
  GetAllPatientTypeResponse(
      {
        this.idPatientType,
      this.dsPatientType,
      this.dtInsertDate,
      this.dtUpdateDate,
      this.idUserInsert,
      this.idUserUpdate,
      this.messages,
      this.dbStatus,
      this.dsPatientName,
      });

  GetAllPatientTypeResponse.fromJson(Map<String, dynamic> json) {
    idPatientType = json['idPatientType'];
    dsPatientType = json['dsPatientType'];
    dtInsertDate = json['dtInsertDate'];
    dtUpdateDate = json['dtUpdateDate'];
    idUserInsert = json['idUserInsert'];
    idUserUpdate = json['idUserUpdate'];
    messages = json['messages'];
    dbStatus = json['dbStatus'];
    dsPatientName= json['dsPatientName'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idPatientType'] = idPatientType;
    data['dsPatientType'] = dsPatientType;
    data['dtInsertDate'] = dtInsertDate;
    data['dtUpdateDate'] = dtUpdateDate;
    data['idUserInsert'] = idUserInsert;
    data['idUserUpdate'] = idUserUpdate;
    data['messages'] = messages;
    data['dbStatus'] = dbStatus;
    data['dsPatientName'] = dsPatientName;
    return data;
  }
}
