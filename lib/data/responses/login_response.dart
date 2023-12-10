class LoginResponse {
  int idUser;
  String dsGuidId;
  String dsFirstName;
  String dsLastName;
  String dtBirthdate;
  bool flActive;
  String dsEmail;
  String dtLastLogin;
  String dsPhone;
  int idCompany;
  Company company;
  int idUserTitle;
  String dsPassword;
  String dsLogoUrl;
  String token;
  bool flAdmin;
  bool flRaise;
  String dsCode;
  String dtInsertDate;
  String dtUpdateDate;
  int idUserInsert;
  int idUserUpdate;
  String messages;
  List<MessageList> messageList;
  int dbStatus;

  LoginResponse(
      {this.idUser,
      this.dsGuidId,
      this.dsFirstName,
      this.dsLastName,
      this.dtBirthdate,
      this.flActive,
      this.dsEmail,
      this.dtLastLogin,
      this.dsPhone,
      this.idCompany,
      this.company,
      this.idUserTitle,
      this.dsPassword,
      this.dsLogoUrl,
      this.token,
      this.flAdmin,
      this.flRaise,
      this.dsCode,
      this.dtInsertDate,
      this.dtUpdateDate,
      this.idUserInsert,
      this.idUserUpdate,
      this.messages,
      this.messageList,
      this.dbStatus});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    idUser = json['idUser'];
    dsGuidId = json['dsGuidId'];
    dsFirstName = json['dsFirstName'];
    dsLastName = json['dsLastName'];
    dtBirthdate = json['dtBirthdate'];
    flActive = json['flActive'];
    dsEmail = json['dsEmail'];
    dtLastLogin = json['dtLastLogin'];
    dsPhone = json['dsPhone'];
    idCompany = json['idCompany'];
    company = json['company'] != null ? Company.fromJson(json['company']) : null;
    idUserTitle = json['idUserTitle'];
    dsPassword = json['dsPassword'];
    dsLogoUrl = json['dsLogoUrl'];
    token = json['token'];
    flAdmin = json['flAdmin'];
    flRaise = json['flRaise'];
    dsCode = json['dsCode'];
    dtInsertDate = json['dtInsertDate'];
    dtUpdateDate = json['dtUpdateDate'];
    idUserInsert = json['idUserInsert'];
    idUserUpdate = json['idUserUpdate'];
    messages = json['messages'];
    if (json['messageList'] != null) {
      messageList = <MessageList>[];
      json['messageList'].forEach((v) {
        messageList.add(MessageList.fromJson(v));
      });
    }
    dbStatus = json['dbStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idUser'] = idUser;
    data['dsGuidId'] = dsGuidId;
    data['dsFirstName'] = dsFirstName;
    data['dsLastName'] = dsLastName;
    data['dtBirthdate'] = dtBirthdate;
    data['flActive'] = flActive;
    data['dsEmail'] = dsEmail;
    data['dtLastLogin'] = dtLastLogin;
    data['dsPhone'] = dsPhone;
    data['idCompany'] = idCompany;
    if (company != null) {
      data['company'] = company.toJson();
    }
    data['idUserTitle'] = idUserTitle;
    data['dsPassword'] = dsPassword;
    data['dsLogoUrl'] = dsLogoUrl;
    data['token'] = token;
    data['flAdmin'] = flAdmin;
    data['flRaise'] = flRaise;
    data['dsCode'] = dsCode;
    data['dtInsertDate'] = dtInsertDate;
    data['dtUpdateDate'] = dtUpdateDate;
    data['idUserInsert'] = idUserInsert;
    data['idUserUpdate'] = idUserUpdate;
    data['messages'] = messages;
    if (messageList != null) {
      data['messageList'] = messageList.map((v) => v.toJson()).toList();
    }
    data['dbStatus'] = dbStatus;
    return data;
  }
}

class Company {
  int idCompany;
  String dsGuidId;
  String dsCompany;
  int mtTaxNo;
  String dtExpire;
  String dsOfficalTitle;
  String dsOfficalPhone;
  int idCity;
  int idTown;
  String dsOfficalAddress;
  String dsLogoUrl;
  int idCrmStatus;
  bool flChurn;
  int idCrmAgent;
  int mtChurnCount;
  bool flUsageContract;
  int idTaxOffice;
  String dsPromotionCode;
  String dsTaxOffice;
  String dsTaxNo;
  String dsCity;
  String dsTown;
  bool flTrial;
  int mtTotalSms;
  String dsPostalAddressJson;
  String dsDialCode;
  String dsCountryCode;
  int idStatus;
  bool flRaise;
  String dsApiKeyEInvoice;
  String dsApiSecretEInvoice;
  String dsCustomerIdEInvoice;
  String dtInsertDate;
  String dtUpdateDate;
  int idUserInsert;
  int idUserUpdate;
  String messages;
  List<String> messageList;
  int dbStatus;

  Company(
      {this.idCompany,
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
      this.dtInsertDate,
      this.dtUpdateDate,
      this.idUserInsert,
      this.idUserUpdate,
      this.messages,
      this.messageList,
      this.dbStatus});

  Company.fromJson(Map<String, dynamic> json) {
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
    dtInsertDate = json['dtInsertDate'];
    dtUpdateDate = json['dtUpdateDate'];
    idUserInsert = json['idUserInsert'];
    idUserUpdate = json['idUserUpdate'];
    messages = json['messages'];
    if (json['messageList'] != null) {
      messageList = <String>[];
      json['messageList'].forEach((v) {
        messageList.add(v);
      });
    }
    dbStatus = json['dbStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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

class MessageList {
  String title;
  String message;
  int messageType;

  MessageList({this.title, this.message, this.messageType});

  MessageList.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    message = json['message'];
    messageType = json['messageType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['message'] = message;
    data['messageType'] = messageType;
    return data;
  }
}
