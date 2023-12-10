class SaveAppointmentRequest {
  //ExaminationJsonProperties examinationJsonProperties;
  bool flDetail;
  bool isAppovalAppointment;
  bool isTime;
  bool isSendSms;
  //Layover layover;
  int idStatus;
  int idVaccient;
  String dtAdmission;
  int idPatient;
  String idAdmissionType;
  int idCustomer;
  String dsTime;
  String dtNextAppointment;

  SaveAppointmentRequest(
      {
      //this.examinationJsonProperties,
      this.flDetail,
      this.isAppovalAppointment,
      this.isTime,
      this.isSendSms,
      //this.layover,
      this.idStatus,
      this.idVaccient,
      this.dtAdmission,
      this.idPatient,
      this.idAdmissionType,
      this.idCustomer,
      this.dsTime,
      this.dtNextAppointment});

  SaveAppointmentRequest.fromJson(Map<String, dynamic> json) {
    // examinationJsonProperties = json['examinationJsonProperties'] != null
    //     ? ExaminationJsonProperties.fromJson(json['examinationJsonProperties'])
    //     : null;
    flDetail = json['flDetail'];
    isAppovalAppointment = json['isAppovalAppointment'];
    isTime = json['isTime'];
    isSendSms = json['isSendSms'];
    //layover = json['layover'] != null ? Layover.fromJson(json['layover']) : null;
    idStatus = json['idStatus'];
    idVaccient = json['idVaccient'];
    dtAdmission = json['dtAdmission'];
    idPatient = json['idPatient'];
    idAdmissionType = json['idAdmissionType'];
    idCustomer = json['idCustomer'];
    dsTime = json['dsTime'];
    dtNextAppointment = json['dtNextAppointment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // if (examinationJsonProperties != null) {
    //   data['examinationJsonProperties'] = examinationJsonProperties.toJson();
    // }
    data['flDetail'] = flDetail;
    data['isAppovalAppointment'] = isAppovalAppointment;
    data['isTime'] = isTime;
    data['isSendSms'] = isSendSms;
    // if (layover != null) {
    //   data['layover'] = layover.toJson();
    // }
    data['idStatus'] = idStatus;
    data['idVaccient'] = idVaccient;
    data['dtAdmission'] = dtAdmission;
    data['idPatient'] = idPatient;
    data['idAdmissionType'] = idAdmissionType;
    data['idCustomer'] = idCustomer;
    data['dsTime'] = dsTime;
    data['dtNextAppointment'] = dtNextAppointment;
    return data;
  }
}

// class ExaminationJsonProperties {
//   Object bodyTemperature;
//   Null fire;
//   Null respiratory;
//   Null pulse;
//   Null weight;
//   bool flGeneralSituation;
//   bool flSkin;
//   bool flEye;
//   bool flEars;
//   bool flMuscleSkeleton;
//   bool flCirculation;
//   bool flrespiratory;
//   bool flDigestion;
//   bool flGenitouriner;
//   bool flAnger;
//   bool flLymphModul;
//   bool flEndocrine;
//   String dsNote;
//   Null anamnesis;

//   ExaminationJsonProperties(
//       {this.bodyTemperature,
//       this.fire,
//       this.respiratory,
//       this.pulse,
//       this.weight,
//       this.flGeneralSituation,
//       this.flSkin,
//       this.flEye,
//       this.flEars,
//       this.flMuscleSkeleton,
//       this.flCirculation,
//       this.flrespiratory,
//       this.flDigestion,
//       this.flGenitouriner,
//       this.flAnger,
//       this.flLymphModul,
//       this.flEndocrine,
//       this.dsNote,
//       this.anamnesis});

//   ExaminationJsonProperties.fromJson(Map<String, dynamic> json) {
//     bodyTemperature = json['bodyTemperature'];
//     fire = json['fire'];
//     respiratory = json['respiratory'];
//     pulse = json['pulse'];
//     weight = json['weight'];
//     flGeneralSituation = json['flGeneralSituation'];
//     flSkin = json['flSkin'];
//     flEye = json['flEye'];
//     flEars = json['flEars'];
//     flMuscleSkeleton = json['flMuscleSkeleton'];
//     flCirculation = json['flCirculation'];
//     flrespiratory = json['flrespiratory'];
//     flDigestion = json['flDigestion'];
//     flGenitouriner = json['flGenitouriner'];
//     flAnger = json['flAnger'];
//     flLymphModul = json['flLymphModul'];
//     flEndocrine = json['flEndocrine'];
//     dsNote = json['dsNote'];
//     anamnesis = json['anamnesis'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['bodyTemperature'] = bodyTemperature;
//     data['fire'] = fire;
//     data['respiratory'] = respiratory;
//     data['pulse'] = pulse;
//     data['weight'] = weight;
//     data['flGeneralSituation'] = flGeneralSituation;
//     data['flSkin'] = flSkin;
//     data['flEye'] = flEye;
//     data['flEars'] = flEars;
//     data['flMuscleSkeleton'] = flMuscleSkeleton;
//     data['flCirculation'] = flCirculation;
//     data['flrespiratory'] = flrespiratory;
//     data['flDigestion'] = flDigestion;
//     data['flGenitouriner'] = flGenitouriner;
//     data['flAnger'] = flAnger;
//     data['flLymphModul'] = flLymphModul;
//     data['flEndocrine'] = flEndocrine;
//     data['dsNote'] = dsNote;
//     data['anamnesis'] = anamnesis;
//     return data;
//   }
// }

// class Layover {
//   List<Null> messageList;

//   Layover({this.messageList});

//   Layover.fromJson(Map<String, dynamic> json) {
//     if (json['messageList'] != null) {
//       messageList = List<Null>();
//       json['messageList'].forEach((v) {
//         messageList.add(Null.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     if (messageList != null) {
//       data['messageList'] = messageList.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
