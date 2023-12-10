class GetDashboardsAppointmentsResponse {
  String dsCustomer;
  String dsPhoneNo;
  String dsPatient;
  String dsGuidIdCustomer;
  String dsGuidIdPatient;
  int idSmsStatus;
  String dtAdmission;
  String dsProduct;
  String dsProductName;
  String dsCompany;
  int idPatientAdmission;
  int idAdmissionType;
  int idProduct;
  String dsAdmissionTime;

  List<GetDashboardsAppointmentsResponse> dashboardAppointments;
  List<GetDashboardsAppointmentsResponse> dashboardPastAppointments;

  GetDashboardsAppointmentsResponse(
      {this.dsCustomer,
      this.dsPhoneNo,
      this.dsPatient,
      this.dsGuidIdCustomer,
      this.dsGuidIdPatient,
      this.idSmsStatus,
      this.dtAdmission,
      this.dsProduct,
      this.dsProductName,
      this.dsCompany,
      this.idPatientAdmission,
      this.idAdmissionType,
      this.idProduct,
      this.dsAdmissionTime});

  GetDashboardsAppointmentsResponse.fromJson(Map<String, dynamic> json) {
    dsCustomer = json['dsCustomer'];
    dsPhoneNo = json['dsPhoneNo'];
    dsPatient = json['dsPatient'];
    dsGuidIdCustomer = json['dsGuidIdCustomer'];
    dsGuidIdPatient = json['dsGuidIdPatient'];
    idSmsStatus = json['idSmsStatus'];
    dtAdmission = json['dtAdmission'];
    dsProduct = json['dsProduct'];
    dsProductName = json['dsProductName'];
    dsCompany = json['dsCompany'];
    idPatientAdmission = json['idPatientAdmission'];
    idAdmissionType = json['idAdmissionType'];
    idProduct = json['idProduct'];
    dsAdmissionTime = json['dsAdmissionTime'];
    if (json['dashboardAppointments'] != null) {
      dashboardAppointments = <GetDashboardsAppointmentsResponse>[];
      json['dashboardAppointments'].forEach((v) {
        dashboardAppointments
            .add(GetDashboardsAppointmentsResponse.fromJson(v));
      });
    }
    if (json['dashboardPastAppointments'] != null) {
      dashboardPastAppointments = <GetDashboardsAppointmentsResponse>[];
      json['dashboardPastAppointments'].forEach((v) {
        dashboardPastAppointments
            .add(GetDashboardsAppointmentsResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dsCustomer'] = dsCustomer;
    data['dsPhoneNo'] = dsPhoneNo;
    data['dsPatient'] = dsPatient;
    data['dsGuidIdCustomer'] = dsGuidIdCustomer;
    data['dsGuidIdPatient'] = dsGuidIdPatient;
    data['idSmsStatus'] = idSmsStatus;
    data['dtAdmission'] = dtAdmission;
    data['dsProduct'] = dsProduct;
    data['dsProductName'] = dsProductName;
    data['dsCompany'] = dsCompany;
    data['idPatientAdmission'] = idPatientAdmission;
    data['idAdmissionType'] = idAdmissionType;
    data['idProduct'] = idProduct;
    data['dsAdmissionTime'] = dsAdmissionTime;

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
