class UpdateAppointmentInfoResponse {
  int idPatientAdmission;
  int idUser;
  //Null user;
  int idCompany;
  String dsGuidId;
  int idPatient;
  int idAdmissionType;
  int idCustomer;
  int idProduct;
  int idVaccient;
  int idStatus;
  String dsJson;
  String dsProductWithPeriod;
  String dsNote;
  String dtAdmission;
  String dtAdmissionTime;
  String dsTime;
  String dsPeriod;
  double mtPeriodCount;
  int idPaymentStatus;
  int idTransactionType;
  int idTransactionStatus;
  double mtTotal;
  double mtRemainingDebt;
  String dtUpdate;
  String dsUser;
  int idRefDocument;
  String dsTreatment;
  bool isAppovalAppointment;
  String dtNextAppointment;
  bool isTime;
  String dsNextAppointmentTime;
  bool valid;
  // Null examinationJsonProperties;
  // List<Null> patientAdmissionDetails;
  // Null customer;
  // Null layover;
  // Null labo;
  double mtTotalPayment;
  bool isSendSms;
  String dsSmsMessage;
  String dsPatientName;
  String dsProduct;
  String dsColor;
  String dtInsertDate;
  String dtUpdateDate;
  int idUserInsert;
  int idUserUpdate;
  String messages;
  List<MessageList> messageList;
  int dbStatus;

  UpdateAppointmentInfoResponse(
      {this.idPatientAdmission,
      this.idUser,
      this.idCompany,
      this.dsGuidId,
      this.idPatient,
      this.idAdmissionType,
      this.idCustomer,
      this.idProduct,
      this.idVaccient,
      this.idStatus,
      this.dsJson,
      this.dsProductWithPeriod,
      this.dsNote,
      this.dtAdmission,
      this.dtAdmissionTime,
      this.dsTime,
      this.dsPeriod,
      this.mtPeriodCount,
      this.idPaymentStatus,
      this.idTransactionType,
      this.idTransactionStatus,
      this.mtTotal,
      this.mtRemainingDebt,
      this.dtUpdate,
      this.dsUser,
      this.idRefDocument,
      this.dsTreatment,
      this.isAppovalAppointment,
      this.dtNextAppointment,
      this.isTime,
      this.dsNextAppointmentTime,
      this.valid,
      this.mtTotalPayment,
      this.isSendSms,
      this.dsSmsMessage,
      this.dsPatientName,
      this.dsProduct,
      this.dsColor,
      this.dtInsertDate,
      this.dtUpdateDate,
      this.idUserInsert,
      this.idUserUpdate,
      this.messages,
      this.messageList,
      this.dbStatus});

  UpdateAppointmentInfoResponse.fromJson(Map<String, dynamic> json) {
    idPatientAdmission = json['idPatientAdmission'];
    idUser = json['idUser'];
    idCompany = json['idCompany'];
    dsGuidId = json['dsGuidId'];
    idPatient = json['idPatient'];
    idAdmissionType = json['idAdmissionType'];
    idCustomer = json['idCustomer'];
    idProduct = json['idProduct'];
    idVaccient = json['idVaccient'];
    idStatus = json['idStatus'];
    dsJson = json['dsJson'];
    dsProductWithPeriod = json['dsProductWithPeriod'];
    dsNote = json['dsNote'];
    dtAdmission = json['dtAdmission'];
    dtAdmissionTime = json['dtAdmissionTime'];
    dsTime = json['dsTime'];
    dsPeriod = json['dsPeriod'];
    mtPeriodCount = json['mtPeriodCount'];
    idPaymentStatus = json['idPaymentStatus'];
    idTransactionType = json['idTransactionType'];
    idTransactionStatus = json['idTransactionStatus'];
    mtTotal = json['mtTotal'];
    mtRemainingDebt = json['mtRemainingDebt'];
    dtUpdate = json['dtUpdate'];
    dsUser = json['dsUser'];
    idRefDocument = json['idRefDocument'];
    dsTreatment = json['dsTreatment'];
    isAppovalAppointment = json['isAppovalAppointment'];
    dtNextAppointment = json['dtNextAppointment'];
    isTime = json['isTime'];
    dsNextAppointmentTime = json['dsNextAppointmentTime'];
    valid = json['valid'];
    mtTotalPayment = json['mtTotalPayment'];
    isSendSms = json['isSendSms'];
    dsSmsMessage = json['dsSmsMessage'];
    dsPatientName = json['dsPatientName'];
    dsProduct = json['dsProduct'];
    dsColor = json['dsColor'];
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
    data['idPatientAdmission'] = idPatientAdmission;
    data['idUser'] = idUser;
    data['idCompany'] = idCompany;
    data['dsGuidId'] = dsGuidId;
    data['idPatient'] = idPatient;
    data['idAdmissionType'] = idAdmissionType;
    data['idCustomer'] = idCustomer;
    data['idProduct'] = idProduct;
    data['idVaccient'] = idVaccient;
    data['idStatus'] = idStatus;
    data['dsJson'] = dsJson;
    data['dsProductWithPeriod'] = dsProductWithPeriod;
    data['dsNote'] = dsNote;
    data['dtAdmission'] = dtAdmission;
    data['dtAdmissionTime'] = dtAdmissionTime;
    data['dsTime'] = dsTime;
    data['dsPeriod'] = dsPeriod;
    data['mtPeriodCount'] = mtPeriodCount;
    data['idPaymentStatus'] = idPaymentStatus;
    data['idTransactionType'] = idTransactionType;
    data['idTransactionStatus'] = idTransactionStatus;
    data['mtTotal'] = mtTotal;
    data['mtRemainingDebt'] = mtRemainingDebt;
    data['dtUpdate'] = dtUpdate;
    data['dsUser'] = dsUser;
    data['idRefDocument'] = idRefDocument;
    data['dsTreatment'] = dsTreatment;
    data['isAppovalAppointment'] = isAppovalAppointment;
    data['dtNextAppointment'] = dtNextAppointment;
    data['isTime'] = isTime;
    data['dsNextAppointmentTime'] = dsNextAppointmentTime;
    data['valid'] = valid;
    data['mtTotalPayment'] = mtTotalPayment;
    data['isSendSms'] = isSendSms;
    data['dsSmsMessage'] = dsSmsMessage;
    data['dsPatientName'] = dsPatientName;
    data['dsProduct'] = dsProduct;
    data['dsColor'] = dsColor;
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
