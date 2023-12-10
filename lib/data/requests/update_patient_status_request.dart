class UpdatePatientStatusRequest {
  int idPatient;
  String dsGuidId;
  String dsPatientName;
  int idCustomer;
  bool valid;

  UpdatePatientStatusRequest({this.idPatient, this.dsGuidId, this.dsPatientName, this.idCustomer, this.valid});

  UpdatePatientStatusRequest.fromJson(Map<String, dynamic> json) {
    idPatient = json['idPatient'];
    dsGuidId = json['dsGuidId'];
    dsPatientName = json['dsPatientName'];
    idCustomer = json['idCustomer'];
    valid = json['valid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idPatient'] = idPatient;
    data['dsGuidId'] = dsGuidId;
    data['dsPatientName'] = dsPatientName;
    data['idCustomer'] = idCustomer;
    data['valid'] = valid;
    return data;
  }
}
