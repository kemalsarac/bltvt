class salessearchresponse {
  String dtDocument;
  String dsDocument;
  int idDocument;
  String dsCustomer;
  String dsProduct;
  double mtTotal;
  double mtGross;
  double mtNet;
  double mtDiscount;
  double mtTax;
  double mtQuantity;
  String dsPaymentType;
  bool flApprovedDocument;
  String dsDocumentNo;
  bool flDetail;
  dynamic documentDetail;

  salessearchresponse(
      {this.dtDocument,
      this.dsDocument,
      this.idDocument,
      this.dsCustomer,
      this.dsProduct,
      this.mtTotal,
      this.mtGross,
      this.mtNet,
      this.mtDiscount,
      this.mtTax,
      this.mtQuantity,
      this.dsPaymentType,
      this.flApprovedDocument,
      this.dsDocumentNo,
      this.flDetail,
      this.documentDetail});

  salessearchresponse.fromJson(Map<String, dynamic> json) {
    dtDocument = json['dtDocument'];
    dsDocument = json['dsDocument'];
    idDocument = json['idDocument'];
    dsCustomer = json['dsCustomer'];
    dsProduct = json['dsProduct'];
    mtTotal = json['mtTotal'];
    mtGross = json['mtGross'];
    mtNet = json['mtNet'];
    mtDiscount = json['mtDiscount'];
    mtTax = json['mtTax'];
    mtQuantity = json['mtQuantity'];
    dsPaymentType = json['dsPaymentType'];
    flApprovedDocument = json['flApprovedDocument'];
    dsDocumentNo = json['dsDocumentNo'];
    flDetail = json['flDetail'];
    documentDetail = json['documentDetail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dtDocument'] = this.dtDocument;
    data['dsDocument'] = this.dsDocument;
    data['idDocument'] = this.idDocument;
    data['dsCustomer'] = this.dsCustomer;
    data['dsProduct'] = this.dsProduct;
    data['mtTotal'] = this.mtTotal;
    data['mtGross'] = this.mtGross;
    data['mtNet'] = this.mtNet;
    data['mtDiscount'] = this.mtDiscount;
    data['mtTax'] = this.mtTax;
    data['mtQuantity'] = this.mtQuantity;
    data['dsPaymentType'] = this.dsPaymentType;
    data['flApprovedDocument'] = this.flApprovedDocument;
    data['dsDocumentNo'] = this.dsDocumentNo;
    data['flDetail'] = this.flDetail;
    data['documentDetail'] = this.documentDetail;
    return data;
  }
}
