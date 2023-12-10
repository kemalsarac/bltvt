class GetCustomerSearchResponse {
  int idCustomer;
  String patientGuid; 
  String dsGuidId;
  String dsFirstName;
  String dsLastName;
  String identityNo;
  String dsPhoneNo;
  String dsPhoneNo2;
  String dsEmail;
  int idCrmAgent;
  int idCompany;
  String dsCustomerPhoto;
  bool valid;
  bool flSendEmail;
  bool flSendSms;
  int idCity;
  int idTown;
  String dsAddress;
  String dsNote;
  String dtInsert;
  String dtUpdate;
  int mtDiscountRate;
  int idCustomerAccount;
  double mtBalance;
  int idCustomerGroup;
  bool flRetail;
  String dsTaxOffice;
  String dsCity;
  String dsTown;
  String dsDialCode;
  String dsCountryCode;
  bool flHome;
  String dsChipNo;
  String dsNameAndSurname;
  String dtInsertDate;
  String dtUpdateDate;
  int idUserInsert;
  int idUserUpdate;
  String messages;
  int dbStatus;

  GetCustomerSearchResponse(
      {this.idCustomer,
      this.dsGuidId,
      this.dsFirstName,
      this.dsLastName,
      this.identityNo,
      this.dsPhoneNo,
      this.dsPhoneNo2,
      this.dsEmail,
      this.idCrmAgent,
      this.idCompany,
      this.dsCustomerPhoto,
      this.valid,
      this.flSendEmail,
      this.flSendSms,
      this.idCity,
      this.idTown,
      this.dsAddress,
      this.dsNote,
      this.dtInsert,
      this.dtUpdate,
      this.mtDiscountRate,
      this.idCustomerAccount,
      this.mtBalance,
      this.idCustomerGroup,
      this.flRetail,
      this.dsTaxOffice,
      this.dsCity,
      this.dsTown,
      this.dsDialCode,
      this.dsCountryCode,
      this.flHome,
      this.dsChipNo,
      this.dsNameAndSurname,
      this.dtInsertDate,
      this.dtUpdateDate,
      this.idUserInsert,
      this.idUserUpdate,
      this.messages,
      this.dbStatus});

  GetCustomerSearchResponse.fromJson(Map<String, dynamic> json) {
    idCustomer = json['idCustomer'];
    dsGuidId = json['dsGuidId'];
    dsFirstName = json['dsFirstName'];
    dsLastName = json['dsLastName'];
    identityNo = json['identityNo'];
    dsPhoneNo = json['dsPhoneNo'];
    dsPhoneNo2 = json['dsPhoneNo2'];
    dsEmail = json['dsEmail'];
    idCrmAgent = json['idCrmAgent'];
    idCompany = json['idCompany'];
    dsCustomerPhoto = json['dsCustomerPhoto'];
    valid = json['valid'];
    flSendEmail = json['flSendEmail'];
    flSendSms = json['flSendSms'];
    idCity = json['idCity'];
    idTown = json['idTown'];
    dsAddress = json['dsAddress'];
    dsNote = json['dsNote'];
    dtInsert = json['dtInsert'];
    dtUpdate = json['dtUpdate'];
    mtDiscountRate = json['mtDiscountRate'];
    idCustomerAccount = json['idCustomerAccount'];
    mtBalance = json['mtBalance'];
    idCustomerGroup = json['idCustomerGroup'];
    flRetail = json['flRetail'];
    dsTaxOffice = json['dsTaxOffice'];
    dsCity = json['dsCity'];
    dsTown = json['dsTown'];
    dsDialCode = json['dsDialCode'];
    dsCountryCode = json['dsCountryCode'];
    flHome = json['flHome'];
    dsChipNo = json['dsChipNo'];
    dsNameAndSurname = json['dsNameAndSurname'];
    dtInsertDate = json['dtInsertDate'];
    dtUpdateDate = json['dtUpdateDate'];
    idUserInsert = json['idUserInsert'];
    idUserUpdate = json['idUserUpdate'];
    messages = json['messages'];
    dbStatus = json['dbStatus'];
  }

  get someProperty => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idCustomer'] = idCustomer;
    data['dsGuidId'] = dsGuidId;
    data['dsFirstName'] = dsFirstName;
    data['dsLastName'] = dsLastName;
    data['identityNo'] = identityNo;
    data['dsPhoneNo'] = dsPhoneNo;
    data['dsPhoneNo2'] = dsPhoneNo2;
    data['dsEmail'] = dsEmail;
    data['idCrmAgent'] = idCrmAgent;
    data['idCompany'] = idCompany;
    data['dsCustomerPhoto'] = dsCustomerPhoto;
    data['valid'] = valid;
    data['flSendEmail'] = flSendEmail;
    data['flSendSms'] = flSendSms;
    data['idCity'] = idCity;
    data['idTown'] = idTown;
    data['dsAddress'] = dsAddress;
    data['dsNote'] = dsNote;
    data['dtInsert'] = dtInsert;
    data['dtUpdate'] = dtUpdate;
    data['mtDiscountRate'] = mtDiscountRate;
    data['idCustomerAccount'] = idCustomerAccount;
    data['mtBalance'] = mtBalance;
    data['idCustomerGroup'] = idCustomerGroup;
    data['flRetail'] = flRetail;
    data['dsTaxOffice'] = dsTaxOffice;
    data['dsCity'] = dsCity;
    data['dsTown'] = dsTown;
    data['dsDialCode'] = dsDialCode;
    data['dsCountryCode'] = dsCountryCode;
    data['flHome'] = flHome;
    data['dsChipNo'] = dsChipNo;
    data['dsNameAndSurname'] = dsNameAndSurname;
    data['dtInsertDate'] = dtInsertDate;
    data['dtUpdateDate'] = dtUpdateDate;
    data['idUserInsert'] = idUserInsert;
    data['idUserUpdate'] = idUserUpdate;
    data['messages'] = messages;
    data['dbStatus'] = dbStatus;
    return data;
  }
}
