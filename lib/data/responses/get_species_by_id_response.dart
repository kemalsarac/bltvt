class GetSpeciesByIdResponse {
  int idSpecies;
  String dsSpecies;
  int idType;
  bool valid;
  String dtInsertDate;
  String dtUpdateDate;
  int idUserInsert;
  int idUserUpdate;
  String messages;
  int dbStatus;

  GetSpeciesByIdResponse(
      {this.idSpecies,
      this.dsSpecies,
      this.idType,
      this.valid,
      this.dtInsertDate,
      this.dtUpdateDate,
      this.idUserInsert,
      this.idUserUpdate,
      this.messages,
      this.dbStatus});

  GetSpeciesByIdResponse.fromJson(Map<String, dynamic> json) {
    idSpecies = json['idSpecies'];
    dsSpecies = json['dsSpecies'];
    idType = json['idType'];
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
    data['idSpecies'] = idSpecies;
    data['dsSpecies'] = dsSpecies;
    data['idType'] = idType;
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
