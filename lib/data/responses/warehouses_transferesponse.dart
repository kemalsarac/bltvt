class WarehouseTransferResponse {
  int idWarehouseTo;
  String dsGuidIdTo;
  String dsGuidIdFrom;
  int idWarehouseFrom;
  double mtPieces;
  int idTransactionType;
  String dtInsertDate;
  String dtUpdateDate;
  int idUserInsert;
  int idUserUpdate;
  String messages;
  List<MessageList> messageList;
  int dbStatus;

  WarehouseTransferResponse(
      {this.idWarehouseTo,
      this.dsGuidIdTo,
      this.dsGuidIdFrom,
      this.idWarehouseFrom,
      this.mtPieces,
      this.idTransactionType,
      this.dtInsertDate,
      this.dtUpdateDate,
      this.idUserInsert,
      this.idUserUpdate,
      this.messages,
      this.messageList,
      this.dbStatus});

  WarehouseTransferResponse.fromJson(Map<String, dynamic> json) {
    idWarehouseTo = json['idWarehouseTo'];
    dsGuidIdTo = json['dsGuidIdTo'];
    dsGuidIdFrom = json['dsGuidIdFrom'];
    idWarehouseFrom = json['idWarehouseFrom'];
    mtPieces = json['mtPieces'];
    idTransactionType = json['idTransactionType'];
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
    data['idWarehouseTo'] = this.idWarehouseTo;
    data['dsGuidIdTo'] = this.dsGuidIdTo;
    data['dsGuidIdFrom'] = this.dsGuidIdFrom;
    data['idWarehouseFrom'] = this.idWarehouseFrom;
    data['mtPieces'] = this.mtPieces;
    data['idTransactionType'] = this.idTransactionType;
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