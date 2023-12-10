class CompanyDataResponse {
  int idCompany;
  String dsGuidId;
  String dsCompany;
  Null mtTaxNo;
  String dtExpire;
  String dsOfficalTitle;
  String dsOfficalPhone;
  int idCity;
  int idTown;
  Null dsOfficalAddress;
  Null dsLogoUrl;
  Null idCrmStatus;
  bool flChurn;
  Null idCrmAgent;
  Null mtChurnCount;
  bool flUsageContract;
  Null idTaxOffice;
  Null dsPromotionCode;
  Null dsTaxOffice;
  Null dsTaxNo;
  String dsCity; 
  Null dsTown;
  bool flTrial;
  int mtTotalSms;
  Null dsPostalAddressJson;
  Null dsDialCode;
  Null dsCountryCode;
  int idStatus;
  bool flRaise;
  Null dsApiKeyEInvoice;
  Null dsApiSecretEInvoice;
  Null dsCustomerIdEInvoice;
  Null dsCompanyServices;
  String dtInsertDate;
  String dtUpdateDate;
  Null idUserInsert;
  Null idUserUpdate;
  Null messages;
  List<String> messageList; // Değişiklik burada, messageList'in türü List<String> oldu
  int dbStatus;

  CompanyDataResponse({
    this.idCompany,
    this.dsGuidId,
    this.dsCompany,
    this.mtTaxNo,
    this.dtExpire,
    this.dsOfficalTitle,
    this.dsOfficalPhone,
    this.idCity,
    this.idTown,
    this.dsOfficalAddress,
    this.dsLogoUrl,
    this.idCrmStatus,
    this.flChurn,
    this.idCrmAgent,
    this.mtChurnCount,
    this.flUsageContract,
    this.idTaxOffice,
    this.dsPromotionCode,
    this.dsTaxOffice,
    this.dsTaxNo,
    this.dsCity,
    this.dsTown,
    this.flTrial,
    this.mtTotalSms,
    this.dsPostalAddressJson,
    this.dsDialCode,
    this.dsCountryCode,
    this.idStatus,
    this.flRaise,
    this.dsApiKeyEInvoice,
    this.dsApiSecretEInvoice,
    this.dsCustomerIdEInvoice,
    this.dsCompanyServices,
    this.dtInsertDate,
    this.dtUpdateDate,
    this.idUserInsert,
    this.idUserUpdate,
    this.messages,
    this.messageList,
    this.dbStatus,
  });

  CompanyDataResponse.fromJson(Map<String, dynamic> json) {
    idCompany = json['idCompany'];
    dsGuidId = json['dsGuidId'];
    dsCompany = json['dsCompany'];
    mtTaxNo = json['mtTaxNo'];
    dtExpire = json['dtExpire'];
    dsOfficalTitle = json['dsOfficalTitle'];
    dsOfficalPhone = json['dsOfficalPhone'];
    idCity = json['idCity'];
    idTown = json['idTown'];
    dsOfficalAddress = json['dsOfficalAddress'];
    dsLogoUrl = json['dsLogoUrl'];
    idCrmStatus = json['idCrmStatus'];
    flChurn = json['flChurn'];
    idCrmAgent = json['idCrmAgent'];
    mtChurnCount = json['mtChurnCount'];
    flUsageContract = json['flUsageContract'];
    idTaxOffice = json['idTaxOffice'];
    dsPromotionCode = json['dsPromotionCode'];
    dsTaxOffice = json['dsTaxOffice'];
    dsTaxNo = json['dsTaxNo'];
    dsCity = json['dsCity'];
    dsTown = json['dsTown'];
    flTrial = json['flTrial'];
    mtTotalSms = json['mtTotalSms'];
    dsPostalAddressJson = json['dsPostalAddressJson'];
    dsDialCode = json['dsDialCode'];
    dsCountryCode = json['dsCountryCode'];
    idStatus = json['idStatus'];
    flRaise = json['flRaise'];
    dsApiKeyEInvoice = json['dsApiKeyEInvoice'];
    dsApiSecretEInvoice = json['dsApiSecretEInvoice'];
    dsCustomerIdEInvoice = json['dsCustomerIdEInvoice'];
    dsCompanyServices = json['dsCompanyServices'];
    dtInsertDate = json['dtInsertDate'];
    dtUpdateDate = json['dtUpdateDate'];
    idUserInsert = json['idUserInsert'];
    idUserUpdate = json['idUserUpdate'];
    messages = json['messages'];
    if (json['messageList'] != null) {
      messageList = <String>[]; // Değişiklik burada, messageList'in türü List<String> oldu
      json['messageList'].forEach((v) {
        messageList.add(v as String);
      });
    }
    dbStatus = json['dbStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['idCompany'] = idCompany;
    data['dsGuidId'] = dsGuidId;
    data['dsCompany'] = dsCompany;
    data['mtTaxNo'] = mtTaxNo;
    data['dtExpire'] = dtExpire;
    data['dsOfficalTitle'] = dsOfficalTitle;
    data['dsOfficalPhone'] = dsOfficalPhone;
    data['idCity'] = idCity;
    data['idTown'] = idTown;
    data['dsOfficalAddress'] = dsOfficalAddress;
    data['dsLogoUrl'] = dsLogoUrl;
    data['idCrmStatus'] = idCrmStatus;
    data['flChurn'] = flChurn;
    data['idCrmAgent'] = idCrmAgent;
    data['mtChurnCount'] = mtChurnCount;
    data['flUsageContract'] = flUsageContract;
    data['idTaxOffice'] = idTaxOffice;
    data['dsPromotionCode'] = dsPromotionCode;
    data['dsTaxOffice'] = dsTaxOffice;
    data['dsTaxNo'] = dsTaxNo;
    data['dsCity'] = dsCity;
    data['dsTown'] = dsTown;
    data['flTrial'] = flTrial;
    data['mtTotalSms'] = mtTotalSms;
    data['dsPostalAddressJson'] = dsPostalAddressJson;
    data['dsDialCode'] = dsDialCode;
    data['dsCountryCode'] = dsCountryCode;
    data['idStatus'] = idStatus;
    data['flRaise'] = flRaise;
    data['dsApiKeyEInvoice'] = dsApiKeyEInvoice;
    data['dsApiSecretEInvoice'] = dsApiSecretEInvoice;
    data['dsCustomerIdEInvoice'] = dsCustomerIdEInvoice;
    data['dsCompanyServices'] = dsCompanyServices;
    data['dtInsertDate'] = dtInsertDate;
    data['dtUpdateDate'] = dtUpdateDate;
    data['idUserInsert'] = idUserInsert;
    data['idUserUpdate'] = idUserUpdate;
    data['messages'] = messages;
    if (messageList != null) {
      data['messageList'] = messageList.map((v) => v).toList();
    }
    data['dbStatus'] = dbStatus;
    return data;
  }
}
