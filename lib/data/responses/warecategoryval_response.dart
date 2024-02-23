class Warecategoryval {
  double mtPieces; 
  int idStockDefination;
  int idWarehouse;
  int idProduct;
  int idProductSerial;
  int idVaccine;
  int idCompany;
  String dsGuidId;
  int idTransactionType;
  int idPatientAdmissionType;
  int stockTransactionList;
  String dtInsertDate;
  String dtUpdateDate;
  int idUserInsert;
  int idUserUpdate;
  String messages;
  List<MessageList> messageList;
  int dbStatus;

  Warecategoryval({
    this.idStockDefination,
    this.idWarehouse,
    this.mtPieces, 
    this.idProduct,
    this.idProductSerial,
    this.idVaccine,
    this.idCompany,
    this.dsGuidId,
    this.idTransactionType,
    this.idPatientAdmissionType,
    this.stockTransactionList,
    this.dtInsertDate,
    this.dtUpdateDate,
    this.idUserInsert,
    this.idUserUpdate,
    this.messages,
    this.messageList,
    this.dbStatus,
  });

  Warecategoryval.fromJson(Map<String, dynamic> json) {
    idStockDefination = json['idStockDefination'];
    idWarehouse = json['idWarehouse'];
    mtPieces = json['mtPieces'];
    idProduct = json['idProduct'];
    idProductSerial = json['idProductSerial'];
    idVaccine = json['idVaccine'];
    idCompany = json['idCompany'];
    dsGuidId = json['dsGuidId'];
    idTransactionType = json['idTransactionType'];
    idPatientAdmissionType = json['idPatientAdmissionType'];
    stockTransactionList = json['stockTransactionList'];
    dtInsertDate = json['dtInsertDate'];
    dtUpdateDate = json['dtUpdateDate'];
    idUserInsert = json['idUserInsert'];
    idUserUpdate = json['idUserUpdate'];
    messages = json['messages'];
    if (json['messageList'] != null) {
      messageList = <Null>[];
      json['messageList'].forEach((v) {
        messageList.add(MessageList.fromJson(v));
      });
    }
    dbStatus = json['dbStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idStockDefination'] = idStockDefination;
    data['idWarehouse'] = idWarehouse;
    data['mtPieces'] = mtPieces;
    data['idProduct'] = idProduct;
    data['idProductSerial'] = idProductSerial;
    data['idVaccine'] = idVaccine;
    data['idCompany'] = idCompany;
    data['dsGuidId'] = dsGuidId;
    data['idTransactionType'] = idTransactionType;
    data['idPatientAdmissionType'] = idPatientAdmissionType;
    data['stockTransactionList'] = stockTransactionList;
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
