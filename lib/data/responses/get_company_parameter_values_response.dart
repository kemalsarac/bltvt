class GetCompanyParameterValues {
  int idCompanyParameterValue;
  int idCompanyParameter;
  int idCompany;
  bool valid;
  int mtValue;
  String dsDaysValue;
  String dtInsertDate;
  String dtUpdateDate;
  int idUserInsert;
  int idUserUpdate;
  int dbStatus;

  GetCompanyParameterValues(
      {this.idCompanyParameterValue,
      this.idCompanyParameter,
      this.idCompany,
      this.valid,
      this.mtValue,
      this.dsDaysValue,
      this.dtInsertDate,
      this.dtUpdateDate,
      this.idUserInsert,
      this.idUserUpdate,
      this.dbStatus});

  GetCompanyParameterValues.fromJson(Map<String, dynamic> json) {
    idCompanyParameterValue = json['idCompanyParameterValue'];
    idCompanyParameter = json['idCompanyParameter'];
    idCompany = json['idCompany'];
    valid = json['valid'];
    mtValue = json['mtValue'];
    dsDaysValue = json['dsDaysValue'];
    dtInsertDate = json['dtInsertDate'];
    dtUpdateDate = json['dtUpdateDate'];
    idUserInsert = json['idUserInsert'];
    idUserUpdate = json['idUserUpdate'];
    dbStatus = json['dbStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idCompanyParameterValue'] = idCompanyParameterValue;
    data['idCompanyParameter'] = idCompanyParameter;
    data['idCompany'] = idCompany;
    data['valid'] = valid;
    data['mtValue'] = mtValue;
    data['dsDaysValue'] = dsDaysValue;
    data['dtInsertDate'] = dtInsertDate;
    data['dtUpdateDate'] = dtUpdateDate;
    data['idUserInsert'] = idUserInsert;
    data['idUserUpdate'] = idUserUpdate;
    data['dbStatus'] = dbStatus;
    return data;
  }
}
