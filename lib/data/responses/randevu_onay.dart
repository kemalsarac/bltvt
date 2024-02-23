class randevuonay {
  int idPatientAdmission;
  int idUser;
  int user;
  int idCompany;
  String dsGuidId;
  int idPatient;
  int idAdmissionType;
  int idCustomer;
  int idProduct;
  int idVaccient;
  int idStatus;
  dynamic dsJson;
  dynamic dsProductWithPeriod;
  dynamic dsNote;
  String dtAdmission;
  dynamic dtAdmissionTime;
  dynamic dsTime;
  String dsPeriod;
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
  int idRefDocument;
  dynamic dsTreatment;
  bool isAppovalAppointment;
  dynamic dtNextAppointment;
  bool isTime;
  dynamic dsNextAppointmentTime;
  bool valid;
  dynamic examinationJsonProperties;
  List<randevuonay> patientAdmissionDetails; 
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
  dynamic idUserInsert;
  int idUserUpdate;
  dynamic messages;
  List<MessageList> messageList;
  int dbStatus;
  
  randevuonay(
      {this.idPatientAdmission,
      this.idUser,
      this.user,
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

  randevuonay.fromJson(Map<String, dynamic> json) {
  idPatientAdmission = json['idPatientAdmission'];
  idUser = json['idUser'];
  user = json['user'];
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
  examinationJsonProperties = json['examinationJsonProperties'];
  
  // Replace <Null>[] with direct assignment
  patientAdmissionDetails = json['patientAdmissionDetails'];
  
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
  
  // No need for explicit type casting, just assign the values directly
  if (json['messageList'] != null) {
    messageList = (json['messageList'] as List).map((v) => MessageList.fromJson(v)).toList();
  }
  
  dbStatus = json['dbStatus'];
}


 Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['idPatientAdmission'] = idPatientAdmission;
  data['idUser'] = idUser;
  data['user'] = user;
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
  data['mtGross'] = mtGross;
  data['mtDiscount'] = mtDiscount;
  data['mtNet'] = mtNet;
  data['mtTax'] = mtTax;
  data['mtDiscountRate'] = mtDiscountRate;
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
  data['examinationJsonProperties'] = examinationJsonProperties;

  // Check for null before mapping
  if (patientAdmissionDetails != null) {
    data['patientAdmissionDetails'] = patientAdmissionDetails.map((v) => v.toJson()).toList();
  } else {
    data['patientAdmissionDetails'] = null;
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
  String title;
  String message;
  int messageType;

   MessageList({this.title, this.message, this.messageType});

  // fromJson metodu
  MessageList.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    message = json['message'];
    messageType = json['messageType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['message'] = this.message;
    data['messageType'] = this.messageType;
    return data;
  }
}