class MoneyDasboards {
  double totalStockPrice;
  int customerYesterdayCount;
  int customerCount;
  int customerTotalCount;
  double customerRate;
  var appointmentYesterdayCount;
  var appointmentCount;
  var appointmentRate;
  var totalYesterday;
  var total;
  var totalRate;
  var remainingDay;
  var idCompany;
  bool flUsageContact;
  int onlineAdmissionCount;
  IsUsageContract isUsageContract;
  bool flMailing;
  MoneyDasboards(
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
      this.onlineAdmissionCount,
      this.isUsageContract,
      this.flMailing});

  MoneyDasboards.fromJson(Map<String, dynamic> json) {
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
    onlineAdmissionCount = json['onlineAdmissionCount'];
    isUsageContract = json['isUsageContract'] != null
        ? new IsUsageContract.fromJson(json['isUsageContract'])
        : null;
    flMailing = json['flMailing'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalStockPrice'] = this.totalStockPrice;
    data['customerYesterdayCount'] = this.customerYesterdayCount;
    data['customerCount'] = this.customerCount;
    data['customerTotalCount'] = this.customerTotalCount;
    data['customerRate'] = this.customerRate;
    data['appointmentYesterdayCount'] = this.appointmentYesterdayCount;
    data['appointmentCount'] = this.appointmentCount;
    data['appointmentRate'] = this.appointmentRate;
    data['totalYesterday'] = this.totalYesterday;
    data['total'] = this.total;
    data['totalRate'] = this.totalRate;
    data['remainingDay'] = this.remainingDay;
    data['idCompany'] = this.idCompany;
    data['flUsageContact'] = this.flUsageContact;
    data['onlineAdmissionCount'] = this.onlineAdmissionCount;
    if (this.isUsageContract != null) {
      data['isUsageContract'] = this.isUsageContract.toJson();
    }
    data['flMailing'] = this.flMailing;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item1'] = this.item1;
    data['item2'] = this.item2;
    return data;
  }
}
