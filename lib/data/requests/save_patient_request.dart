class SavePatientRequest {
  String dsPatientName;
  int idGender;
  int idSpecies;
  String idType;
  String dsCarneNo;
  String dsChipNo;
  String dsNote;
  bool valid;
  int idPatient;
  String dtBirthDate;
  int idColor;
  int idCustomer;

  SavePatientRequest(
      {this.dsPatientName,
      this.idGender,
      this.idSpecies,
      this.idType,
      this.dsCarneNo,
      this.dsChipNo,
      this.dsNote,
      this.valid,
      this.idPatient,
      this.dtBirthDate,
      this.idColor,
      this.idCustomer});

  SavePatientRequest.fromJson(Map<String, dynamic> json) {
    dsPatientName = json['dsPatientName'];
    idGender = json['idGender'];
    idSpecies = json['idSpecies'];
    idType = json['idType'];
    dsCarneNo = json['dsCarneNo'];
    dsChipNo = json['dsChipNo'];
    dsNote = json['dsNote'];
    valid = json['valid'];
    idPatient = json['idPatient'];
    dtBirthDate = json['dtBirthDate'];
    idColor = json['idColor'];
    idCustomer = json['idCustomer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dsPatientName'] = dsPatientName;
    data['idGender'] = idGender;
    data['idSpecies'] = idSpecies;
    data['idType'] = idType;
    data['dsCarneNo'] = dsCarneNo;
    data['dsChipNo'] = dsChipNo;
    data['dsNote'] = dsNote;
    data['valid'] = valid;
    data['idPatient'] = idPatient;
    data['dtBirthDate'] = dtBirthDate;
    data['idColor'] = idColor;
    data['idCustomer'] = idCustomer;
    return data;
  }
}
