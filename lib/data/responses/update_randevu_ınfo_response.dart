class UpdateRandevuInfoResponse {
  int idPatientAdmission;
  int idUser;
  int iduser;
  int idCompany;
  String dsGuidId;
  int idPatient;
  int idAdmissionType;
  int idCustomer;
  dynamic idProduct;
  dynamic idVaccient;
  int idStatus;
  dynamic dsJson;
  dynamic dsProductWithPeriod;
  dynamic dsNote;
  String dtAdmission;
  dynamic dtAdmissionTime;
  dynamic dsTime;
  dynamic dsPeriod;
  dynamic mtPeriodCount;
  dynamic idPaymentStatus;
  dynamic idTransactionType;
  dynamic idTransactionStatus;
  dynamic mtTotal;
  dynamic mtGross;
  dynamic mtDiscount;
  dynamic mtNet;
  dynamic mtTax;
  dynamic mtDiscountRate;
  dynamic mtRemainingDebt;
  dynamic dtUpdate;
  dynamic dsUser;
  dynamic idRefDocument;
  dynamic dsTreatment;
  bool isAppovalAppointment;
  dynamic dtNextAppointment;
  bool isTime;
  dynamic dsNextAppointmentTime;
  bool valid;
  dynamic examinationJsonProperties;
  List<dynamic> patientAdmissionDetails;
  dynamic customer;
  dynamic layover;
  dynamic laboResult;
  dynamic laboDto;
  dynamic idLayoverType;
  dynamic idRoom;
  dynamic dateStart;
  dynamic dateEnd;
  dynamic layoverNote;
  bool isLayoverExit;
  int mtTotalPayment;
  bool isSendSms;
  dynamic dsSmsMessage;
  dynamic dsPatientName;
  dynamic dsProduct;
  String dsColor;
  String dtInsertDate;
  String dtUpdateDate;
  int idUserInsert;
  int idUserUpdate;
  dynamic messages;
  List<MessageList> messageList;
  int dbStatus;

  UpdateRandevuInfoResponse(
      {this.idPatientAdmission,
      this.idUser,
      this.iduser,
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
      this.mtGross,
      this.mtDiscount,
      this.mtNet,
      this.mtTax,
      this.mtDiscountRate,
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
      this.examinationJsonProperties,
      this.patientAdmissionDetails,
      this.customer,
      this.layover,
      this.laboResult,
      this.laboDto,
      this.idLayoverType,
      this.idRoom,
      this.dateStart,
      this.dateEnd,
      this.layoverNote,
      this.isLayoverExit,
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

  UpdateRandevuInfoResponse.fromJson(Map<String, dynamic> json) {
    idPatientAdmission = json['idPatientAdmission'];
    idUser = json['idUser'];
    iduser = json['user'];
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
    mtGross = json['mtGross'];
    mtDiscount = json['mtDiscount'];
    mtNet = json['mtNet'];
    mtTax = json['mtTax'];
    mtDiscountRate = json['mtDiscountRate'];
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
       if (json['messageList'] != null) {
      messageList = <MessageList>[];
      json['messageList'].forEach((v) {
        messageList.add(MessageList.fromJson(v));
      });
    }
    dbStatus = json['dbStatus'];
  
    customer = json['customer'];
    layover = json['layover'];
    laboResult = json['laboResult'];
    laboDto = json['laboDto'];
    idLayoverType = json['idLayoverType'];
    idRoom = json['idRoom'];
    dateStart = json['dateStart'];
    dateEnd = json['dateEnd'];
    layoverNote = json['layoverNote'];
    isLayoverExit = json['isLayoverExit'];
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
        messageList.add(new MessageList.fromJson(v));
      });
    }
    dbStatus = json['dbStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idPatientAdmission'] = this.idPatientAdmission;
    data['idUser'] = this.idUser;
    data['user'] = this.iduser;
    data['idCompany'] = this.idCompany;
    data['dsGuidId'] = this.dsGuidId;
    data['idPatient'] = this.idPatient;
    data['idAdmissionType'] = this.idAdmissionType;
    data['idCustomer'] = this.idCustomer;
    data['idProduct'] = this.idProduct;
    data['idVaccient'] = this.idVaccient;
    data['idStatus'] = this.idStatus;
    data['dsJson'] = this.dsJson;
    data['dsProductWithPeriod'] = this.dsProductWithPeriod;
    data['dsNote'] = this.dsNote;
    data['dtAdmission'] = this.dtAdmission;
    data['dtAdmissionTime'] = this.dtAdmissionTime;
    data['dsTime'] = this.dsTime;
    data['dsPeriod'] = this.dsPeriod;
    data['mtPeriodCount'] = this.mtPeriodCount;
    data['idPaymentStatus'] = this.idPaymentStatus;
    data['idTransactionType'] = this.idTransactionType;
    data['idTransactionStatus'] = this.idTransactionStatus;
    data['mtTotal'] = this.mtTotal;
    data['mtGross'] = this.mtGross;
    data['mtDiscount'] = this.mtDiscount;
    data['mtNet'] = this.mtNet;
    data['mtTax'] = this.mtTax;
    data['mtDiscountRate'] = this.mtDiscountRate;
    data['mtRemainingDebt'] = this.mtRemainingDebt;
    data['dtUpdate'] = this.dtUpdate;
    data['dsUser'] = this.dsUser;
    data['idRefDocument'] = this.idRefDocument;
    data['dsTreatment'] = this.dsTreatment;
    data['isAppovalAppointment'] = this.isAppovalAppointment;
    data['dtNextAppointment'] = this.dtNextAppointment;
    data['isTime'] = this.isTime;
    data['dsNextAppointmentTime'] = this.dsNextAppointmentTime;
    data['valid'] = this.valid;
    data['examinationJsonProperties'] = this.examinationJsonProperties;
    if (patientAdmissionDetails != null) {
      data['patientAdmissionDetails'] = patientAdmissionDetails;
    }
    data['customer'] = this.customer;
    data['layover'] = this.layover;
    data['laboResult'] = this.laboResult;
    data['laboDto'] = this.laboDto;
    data['idLayoverType'] = this.idLayoverType;
    data['idRoom'] = this.idRoom;
    data['dateStart'] = this.dateStart;
    data['dateEnd'] = this.dateEnd;
    data['layoverNote'] = this.layoverNote;
    data['isLayoverExit'] = this.isLayoverExit;
    data['mtTotalPayment'] = this.mtTotalPayment;
    data['isSendSms'] = this.isSendSms;
    data['dsSmsMessage'] = this.dsSmsMessage;
    data['dsPatientName'] = this.dsPatientName;
    data['dsProduct'] = this.dsProduct;
    data['dsColor'] = this.dsColor;
    data['dtInsertDate'] = this.dtInsertDate;
    data['dtUpdateDate'] = this.dtUpdateDate;
    data['idUserInsert'] = this.idUserInsert;
    data['idUserUpdate'] = this.idUserUpdate;
    data['messages'] = this.messages;
    if (this.messageList != null) {
      data['messageList'] = this.messageList.map((v) => v.toJson()).toList();
    }
    data['dbStatus'] = this.dbStatus;
    return data;
  }
}

class MessageList {
  Null title;
  String message;
  int messageType;

  MessageList({this.title, this.message, this.messageType});

  MessageList.fromJson(Map<String, dynamic> json) {
    dynamic title;
  String message;
  int messageType;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['message'] = this.message;
    data['messageType'] = this.messageType;
    return data;
  }
}
