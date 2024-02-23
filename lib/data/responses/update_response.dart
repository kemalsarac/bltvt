class updateResponse {
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
  String idColor;
  String dsColor;
  int idCustomer;
  bool flCastrated;
  bool valid;
  String dsSpecies;
  String dsNote;
  String mtBalance;
  bool flBreeding;
  String dsProfileImageUrl;
  String dsCustomer;
  String dsIdentityNo;
  String dsPatientSpecialStatus;
  bool flLeukemia;
  bool flCorona;
  bool flFiv;
  bool flPregnant;
  bool flStreetAnimal;
  String idParentPatient;
  String dtDryingDate;
  String  dtPregnant;
  String dtEstimatePregnant;
  String dsSpecialProtocolCode;
  String dtInsertDate;
  String dtUpdateDate;
  int idUserInsert;
  int idUserUpdate;
  String messages;
  List<MessageList> messageList;
  int dbStatus;

 updateResponse({
     this.idPatient,
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
     this.flPregnant,
     this.flStreetAnimal,
    this.idParentPatient,
    this.dtDryingDate,
    this.dtPregnant,
    this.dtEstimatePregnant,
    this.dsSpecialProtocolCode,
     this.dtInsertDate,
     this.dtUpdateDate,
     this.idUserInsert,
     this.idUserUpdate,
    this.messages,
    this.messageList,
    this.dbStatus,
  });

  updateResponse.fromJson(Map<String, dynamic> json) {
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
    flPregnant = json['flPregnant'];
    flStreetAnimal = json['flStreetAnimal'];
    idParentPatient = json['idParentPatient'];
    dtDryingDate = json['dtDryingDate'];
    dtPregnant = json['dtPregnant'];
    dtEstimatePregnant = json['dtEstimatePregnant'];
    dsSpecialProtocolCode = json['dsSpecialProtocolCode'];
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
    data['flPregnant'] = flPregnant;
    data['flStreetAnimal'] = flStreetAnimal;
    data['idParentPatient'] = idParentPatient;
    data['dtDryingDate'] = dtDryingDate;
    data['dtPregnant'] = dtPregnant;
    data['dtEstimatePregnant'] = dtEstimatePregnant;
    data['dsSpecialProtocolCode'] = dsSpecialProtocolCode;
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
