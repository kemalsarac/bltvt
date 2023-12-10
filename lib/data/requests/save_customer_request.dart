import 'package:bltvt_mobile_veterinary/data/responses/save_patient_response.dart';

class SaveCustomerRequest {
  int idCustomer;
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
  List<SavePatientResponse> patients;
  CustomerGroup customerGroup;
  String dsNameAndSurname;
  String dtInsertDate;
  String dtUpdateDate;
  int idUserInsert;
  int idUserUpdate;
  String messages;
  List<MessageList> messageList;
  int dbStatus;

  SaveCustomerRequest(
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
      this.patients,
      this.customerGroup,
      this.dsNameAndSurname,
      this.dtInsertDate,
      this.dtUpdateDate,
      this.idUserInsert,
      this.idUserUpdate,
      this.messages,
      this.messageList,
      this.dbStatus});

  SaveCustomerRequest.fromJson(Map<String, dynamic> json) {
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
    if (json['patients'] != null) {
      patients = <SavePatientResponse>[];
      json['patients'].forEach((v) {
        patients.add(SavePatientResponse.fromJson(v));
      });
    }
    customerGroup = json['customerGroup'] != null ? CustomerGroup.fromJson(json['customerGroup']) : null;
    dsNameAndSurname = json['dsNameAndSurname'];
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
    if (patients != null) {
      data['patients'] = patients.map((v) => v.toJson()).toList();
    }
    if (customerGroup != null) {
      data['customerGroup'] = customerGroup.toJson();
    }
    data['dsNameAndSurname'] = dsNameAndSurname;
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

class Patients {
  int idPatient;
  String dsGuidId;
  String dsPatientName;
  String dsCarneNo;
  String dsChipNo;
  String dtBirthDate;
  String dtDeathDate;
  int mtAge;
  int idGender;
  int idType;
  String dsRace;
  int idSpecies;
  int idColor;
  String dsColor;
  int idCustomer;
  bool flCastrated;
  bool valid;
  String dsSpecies;
  String dsNote;
  double mtBalance;
  bool flBreeding;
  String dsProfileImageUrl;
  String dsCustomer;
  String dsIdentityNo;
  String dsPatientSpecialStatus;
  bool flLeukemia;
  bool flCorona;
  bool flFiv;
  String dtInsertDate;
  String dtUpdateDate;
  int idUserInsert;
  int idUserUpdate;
  String messages;
  List<MessageList> messageList;
  int dbStatus;

  Patients(
      {this.idPatient,
      this.dsGuidId,
      this.dsPatientName,
      this.dsCarneNo,
      this.dsChipNo,
      this.dtBirthDate,
      this.dtDeathDate,
      this.mtAge,
      this.idGender,
      this.idType,
      this.dsRace,
      this.idSpecies,
      this.idColor,
      this.dsColor,
      this.idCustomer,
      this.flCastrated,
      this.valid,
      this.dsSpecies,
      this.dsNote,
      this.mtBalance,
      this.flBreeding,
      this.dsProfileImageUrl,
      this.dsCustomer,
      this.dsIdentityNo,
      this.dsPatientSpecialStatus,
      this.flLeukemia,
      this.flCorona,
      this.flFiv,
      this.dtInsertDate,
      this.dtUpdateDate,
      this.idUserInsert,
      this.idUserUpdate,
      this.messages,
      this.messageList,
      this.dbStatus});

  Patients.fromJson(Map<String, dynamic> json) {
    idPatient = json['idPatient'];
    dsGuidId = json['dsGuidId'];
    dsPatientName = json['dsPatientName'];
    dsCarneNo = json['dsCarneNo'];
    dsChipNo = json['dsChipNo'];
    dtBirthDate = json['dtBirthDate'];
    dtDeathDate = json['dtDeathDate'];
    mtAge = json['mtAge'];
    idGender = json['idGender'];
    idType = json['idType'];
    dsRace = json['dsRace'];
    idSpecies = json['idSpecies'];
    idColor = json['idColor'];
    dsColor = json['dsColor'];
    idCustomer = json['idCustomer'];
    flCastrated = json['flCastrated'];
    valid = json['valid'];
    dsSpecies = json['dsSpecies'];
    dsNote = json['dsNote'];
    mtBalance = json['mtBalance'];
    flBreeding = json['flBreeding'];
    dsProfileImageUrl = json['dsProfileImageUrl'];
    dsCustomer = json['dsCustomer'];
    dsIdentityNo = json['dsIdentityNo'];
    dsPatientSpecialStatus = json['dsPatientSpecialStatus'];
    flLeukemia = json['flLeukemia'];
    flCorona = json['flCorona'];
    flFiv = json['flFiv'];
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
    data['idPatient'] = idPatient;
    data['dsGuidId'] = dsGuidId;
    data['dsPatientName'] = dsPatientName;
    data['dsCarneNo'] = dsCarneNo;
    data['dsChipNo'] = dsChipNo;
    data['dtBirthDate'] = dtBirthDate;
    data['dtDeathDate'] = dtDeathDate;
    data['mtAge'] = mtAge;
    data['idGender'] = idGender;
    data['idType'] = idType;
    data['dsRace'] = dsRace;
    data['idSpecies'] = idSpecies;
    data['idColor'] = idColor;
    data['dsColor'] = dsColor;
    data['idCustomer'] = idCustomer;
    data['flCastrated'] = flCastrated;
    data['valid'] = valid;
    data['dsSpecies'] = dsSpecies;
    data['dsNote'] = dsNote;
    data['mtBalance'] = mtBalance;
    data['flBreeding'] = flBreeding;
    data['dsProfileImageUrl'] = dsProfileImageUrl;
    data['dsCustomer'] = dsCustomer;
    data['dsIdentityNo'] = dsIdentityNo;
    data['dsPatientSpecialStatus'] = dsPatientSpecialStatus;
    data['flLeukemia'] = flLeukemia;
    data['flCorona'] = flCorona;
    data['flFiv'] = flFiv;
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

class CustomerGroup {
  int idCustomerGroup;
  int idCompany;
  String dsCustomerGroup;
  String dsGuidId;
  bool valid;
  String dtInsertDate;
  String dtUpdateDate;
  int idUserInsert;
  int idUserUpdate;
  String messages;
  List<MessageList> messageList;
  int dbStatus;

  CustomerGroup(
      {this.idCustomerGroup,
      this.idCompany,
      this.dsCustomerGroup,
      this.dsGuidId,
      this.valid,
      this.dtInsertDate,
      this.dtUpdateDate,
      this.idUserInsert,
      this.idUserUpdate,
      this.messages,
      this.messageList,
      this.dbStatus});

  CustomerGroup.fromJson(Map<String, dynamic> json) {
    idCustomerGroup = json['idCustomerGroup'];
    idCompany = json['idCompany'];
    dsCustomerGroup = json['dsCustomerGroup'];
    dsGuidId = json['dsGuidId'];
    valid = json['valid'];
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
    data['idCustomerGroup'] = idCustomerGroup;
    data['idCompany'] = idCompany;
    data['dsCustomerGroup'] = dsCustomerGroup;
    data['dsGuidId'] = dsGuidId;
    data['valid'] = valid;
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
