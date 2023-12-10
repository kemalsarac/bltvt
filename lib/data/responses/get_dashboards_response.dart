class GetDashboardsResponse {
  double totalStockPrice;
  int customerYesterdayCount;
  int customerCount;
  int customerTotalCount;
  double customerRate;
  int appointmentYesterdayCount;
  int appointmentCount;
  double appointmentRate;
  double totalYesterday;
  double total;
  double totalRate;
  int remainingDay;
  int idCompany;
  bool flUsageContact;
  IsUsageContract isUsageContract;
  bool flMailing;
  List<DashboardAppointments> dashboardAppointments;
  List<DashboardPastAppointments> dashboardPastAppointments;

  GetDashboardsResponse(
      {this.totalStockPrice,
      this.customerYesterdayCount,
      this.customerCount,
      this.customerTotalCount,
      this.customerRate,
      this.appointmentYesterdayCount,
      this.appointmentCount,
      this.appointmentRate,
      this.totalYesterday,
      this.total,
      this.totalRate,
      this.remainingDay,
      this.idCompany,
      this.flUsageContact,
      this.isUsageContract,
      this.flMailing,
      this.dashboardAppointments,
      this.dashboardPastAppointments});

  GetDashboardsResponse.fromJson(Map<String, dynamic> json) {
    totalStockPrice = json['totalStockPrice'];
    customerYesterdayCount = json['customerYesterdayCount'];
    customerCount = json['customerCount'];
    customerTotalCount = json['customerTotalCount'];
    customerRate = json['customerRate'];
    appointmentYesterdayCount = json['appointmentYesterdayCount'];
    appointmentCount = json['appointmentCount'];
    appointmentRate = json['appointmentRate'];
    totalYesterday = json['totalYesterday'];
    total = json['total'];
    totalRate = json['totalRate'];
    remainingDay = json['remainingDay'];
    idCompany = json['idCompany'];
    flUsageContact = json['flUsageContact'];
    isUsageContract = json['isUsageContract'] != null ? IsUsageContract.fromJson(json['isUsageContract']) : null;
    flMailing = json['flMailing'];
    if (json['dashboardAppointments'] != null) {
      dashboardAppointments = <DashboardAppointments>[];
      json['dashboardAppointments'].forEach((v) {
        dashboardAppointments.add(DashboardAppointments.fromJson(v));
      });
    }
    if (json['dashboardPastAppointments'] != null) {
      dashboardPastAppointments = <DashboardPastAppointments>[];
      json['dashboardPastAppointments'].forEach((v) {
        dashboardPastAppointments.add(DashboardPastAppointments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalStockPrice'] = totalStockPrice;
    data['customerYesterdayCount'] = customerYesterdayCount;
    data['customerCount'] = customerCount;
    data['customerTotalCount'] = customerTotalCount;
    data['customerRate'] = customerRate;
    data['appointmentYesterdayCount'] = appointmentYesterdayCount;
    data['appointmentCount'] = appointmentCount;
    data['appointmentRate'] = appointmentRate;
    data['totalYesterday'] = totalYesterday;
    data['total'] = total;
    data['totalRate'] = totalRate;
    data['remainingDay'] = remainingDay;
    data['idCompany'] = idCompany;
    data['flUsageContact'] = flUsageContact;
    if (isUsageContract != null) {
      data['isUsageContract'] = isUsageContract.toJson();
    }
    data['flMailing'] = flMailing;
    if (dashboardAppointments != null) {
      data['dashboardAppointments'] = dashboardAppointments.map((v) => v.toJson()).toList();
    }
    if (dashboardPastAppointments != null) {
      data['dashboardPastAppointments'] = dashboardPastAppointments.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class IsUsageContract {
  bool item1;
  bool item2;

  IsUsageContract({this.item1, this.item2});

  IsUsageContract.fromJson(Map<String, dynamic> json) {
    item1 = json['item1'];
    item2 = json['item2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item1'] = item1;
    data['item2'] = item2;
    return data;
  }
}

class DashboardAppointments {
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

  DashboardAppointments(
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

  DashboardAppointments.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

class DashboardPastAppointments {
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

  DashboardPastAppointments(
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

  DashboardPastAppointments.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}
