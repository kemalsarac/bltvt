class UpdateAdmissionStatusRequest {
  int idPatientAdmission;
  int idCustomer;
  String dsGuidId;
  String dtAdmission;
  String dtInsertDate;
  String dtUpdateDate;
  int idAdmissionType;
  int idCompany;
  int idPatient;
  int idUser;
  String dsUser;
  int idStatus;
  String dsNote;
  String dsPeriod;
  String dsProduct;
  String dsTreatment;
  int idRefDocument;
  int idVaccient;
  double mtTotal;
  double mtRemainingDebt;
  String dsJson;
  String dsAdmissionTime;
  bool flDetail;

  UpdateAdmissionStatusRequest(
      {this.idPatientAdmission,
      this.idCustomer,
      this.dsGuidId,
      this.dtAdmission,
      this.dtInsertDate,
      this.dtUpdateDate,
      this.idAdmissionType,
      this.idCompany,
      this.idPatient,
      this.idUser,
      this.dsUser,
      this.idStatus,
      this.dsNote,
      this.dsPeriod,
      this.dsProduct,
      this.dsTreatment,
      this.idRefDocument,
      this.idVaccient,
      this.mtTotal,
      this.mtRemainingDebt,
      this.dsJson,
      this.dsAdmissionTime,
      this.flDetail});

  UpdateAdmissionStatusRequest.fromJson(Map<String, dynamic> json) {
    idPatientAdmission = json['idPatientAdmission'];
    idCustomer = json['idCustomer'];
    dsGuidId = json['dsGuidId'];
    dtAdmission = json['dtAdmission'];
    dtInsertDate = json['dtInsertDate'];
    dtUpdateDate = json['dtUpdateDate'];
    idAdmissionType = json['idAdmissionType'];
    idCompany = json['idCompany'];
    idPatient = json['idPatient'];
    idUser = json['idUser'];
    dsUser = json['dsUser'];
    idStatus = json['idStatus'];
    dsNote = json['dsNote'];
    dsPeriod = json['dsPeriod'];
    dsProduct = json['dsProduct'];
    dsTreatment = json['dsTreatment'];
    idRefDocument = json['idRefDocument'];
    idVaccient = json['idVaccient'];
    mtTotal = json['mtTotal'];
    mtRemainingDebt = json['mtRemainingDebt'];
    dsJson = json['dsJson'];
    dsAdmissionTime = json['dsAdmissionTime'];
    flDetail = json['flDetail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idPatientAdmission'] = idPatientAdmission;
    data['idCustomer'] = idCustomer;
    data['dsGuidId'] = dsGuidId;
    data['dtAdmission'] = dtAdmission;
    data['dtInsertDate'] = dtInsertDate;
    data['dtUpdateDate'] = dtUpdateDate;
    data['idAdmissionType'] = idAdmissionType;
    data['idCompany'] = idCompany;
    data['idPatient'] = idPatient;
    data['idUser'] = idUser;
    data['dsUser'] = dsUser;
    data['idStatus'] = idStatus;
    data['dsNote'] = dsNote;
    data['dsPeriod'] = dsPeriod;
    data['dsProduct'] = dsProduct;
    data['dsTreatment'] = dsTreatment;
    data['idRefDocument'] = idRefDocument;
    data['idVaccient'] = idVaccient;
    data['mtTotal'] = mtTotal;
    data['mtRemainingDebt'] = mtRemainingDebt;
    data['dsJson'] = dsJson;
    data['dsAdmissionTime'] = dsAdmissionTime;
    data['flDetail'] = flDetail;
    return data;
  }
}
