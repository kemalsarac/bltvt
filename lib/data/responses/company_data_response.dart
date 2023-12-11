class CompanyDataResponse {
  int idCompany;
  String dsGuidId;
  String dsCompany;
  dynamic mtTaxNo; // Değişiklik burada, mtTaxNo'nun türü dynamic oldu
  String dtExpire;
  String dsOfficalTitle;
  String dsOfficalPhone;
  int idCity;
  int idTown;
  String dsOfficalAddress;
  String dsLogoUrl;
  dynamic idCrmStatus; // Değişiklik burada, idCrmStatus'un türü dynamic oldu
  bool flChurn;
  dynamic idCrmAgent; // Değişiklik burada, idCrmAgent'in türü dynamic oldu
  dynamic mtChurnCount; // Değişiklik burada, mtChurnCount'un türü dynamic oldu
  bool flUsageContract;
  dynamic idTaxOffice; // Değişiklik burada, idTaxOffice'un türü dynamic oldu
  String dsPromotionCode;
  String dsTaxOffice;
  String dsTaxNo;
  String dsCity; 
  String dsTown;
  bool flTrial;
  int mtTotalSms;
  String dsPostalAddressJson; // Değişiklik burada, dsPostalAddressJson'un türü dynamic oldu
  dynamic dsDialCode; // Değişiklik burada, dsDialCode'un türü dynamic oldu
  dynamic dsCountryCode; // Değişiklik burada, dsCountryCode'un türü dynamic oldu
  int idStatus;
  bool flRaise;
  dynamic dsApiKeyEInvoice; // Değişiklik burada, dsApiKeyEInvoice'un türü dynamic oldu
  dynamic dsApiSecretEInvoice; // Değişiklik burada, dsApiSecretEInvoice'un türü dynamic oldu
  dynamic dsCustomerIdEInvoice; // Değişiklik burada, dsCustomerIdEInvoice'un türü dynamic oldu
  dynamic dsCompanyServices; // Değişiklik burada, dsCompanyServices'un türü dynamic oldu
  String dtInsertDate;
  String dtUpdateDate;
  dynamic idUserInsert; // Değişiklik burada, idUserInsert'in türü dynamic oldu
  dynamic idUserUpdate; // Değişiklik burada, idUserUpdate'un türü dynamic oldu
  dynamic messages; // Değişiklik burada, messages'un türü dynamic oldu
  List<String> messageList;
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
      messageList = <String>[]; 
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
