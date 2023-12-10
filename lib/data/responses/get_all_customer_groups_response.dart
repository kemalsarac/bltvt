class GetAllCustomerGroupsResponse {
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

  GetAllCustomerGroupsResponse(
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

  GetAllCustomerGroupsResponse.fromJson(Map<String, dynamic> json) {
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
