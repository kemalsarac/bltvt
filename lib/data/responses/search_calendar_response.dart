class SearchCalendarResponse {
  int idPatientAdmisson;
  String dsNote;
  int idStatus;
  int idAdmissionType;
  String dtAdmissionDate;
  String dsCustomerAndPatient;
  String dsPhoneNo;
  String dsColor;
  String dtAdmissionTime;
 

  List<SearchCalendarResponse > dashboardAppointments;
  List<SearchCalendarResponse > dashboardPastAppointments;

  SearchCalendarResponse(
      {this.idPatientAdmisson,
      this.dsNote,
      this.idStatus,
      this.idAdmissionType,
      this.dtAdmissionDate,
      this.dsCustomerAndPatient,
      this.dsPhoneNo,
      this.dsColor,
      this.dtAdmissionTime,
      
      });

  SearchCalendarResponse.fromJson(Map<String, dynamic> json) {
    idPatientAdmisson = json['idPatientAdmisson'];
    dsNote = json['dsNote'];
    idStatus = json['idStatus'];
    idAdmissionType = json['idAdmissionType'];
    dtAdmissionDate = json['dtAdmissionDate'];
    dsCustomerAndPatient = json['dsCustomerAndPatient'];
    dsPhoneNo = json['dsPhoneNo'];
    dsColor = json['dsColor'];
    
    dtAdmissionTime = json['dtAdmissionTime'];
     if (json['dashboardAppointments'] != null) {
      dashboardAppointments = <SearchCalendarResponse>[];
      json['dashboardAppointments'].forEach((v) {
        dashboardAppointments
            .add(SearchCalendarResponse.fromJson(v));
      });
    }
    if (json['dashboardPastAppointments'] != null) {
      dashboardPastAppointments = <SearchCalendarResponse>[];
      json['dashboardPastAppointments'].forEach((v) {
        dashboardPastAppointments
            .add(SearchCalendarResponse.fromJson(v));
      });
    }
  }

  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idPatientAdmisson'] = idPatientAdmisson;
    data['dsNote'] = dsNote;
    data['idStatus'] = idStatus;
    data['idAdmissionType'] = idAdmissionType;
    data['dtAdmissionDate'] = dtAdmissionDate;
    data['dsCustomerAndPatient'] = dsCustomerAndPatient;
    data['dsPhoneNo'] = dsPhoneNo;
    data['dsColor'] = dsColor;
   
    data['dtAdmissionTime'] = dtAdmissionTime;
     if (dashboardAppointments != null) {
      data['dashboardAppointments'] =
          dashboardAppointments.map((v) => v.toJson()).toList();
    }
    if (dashboardPastAppointments != null) {
      data['dashboardPastAppointments'] =
          dashboardPastAppointments.map((v) => v.toJson()).toList();
    }
    return data;
  }
    
}
