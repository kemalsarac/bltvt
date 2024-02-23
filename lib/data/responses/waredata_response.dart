class Waredata {
  String dsProduct;
  String dsUnit;
  String dsProductCode;
  String dsBarcode;
  String dsGuidId;
  double mtStockCount;
  double mtTotal;

  Waredata({
    this.dsProduct,
    this.dsUnit,
    this.dsProductCode,
    this.dsBarcode,
    this.dsGuidId,
    this.mtStockCount,
    this.mtTotal,
  });

  // Güncellenen kısım
  factory Waredata.fromJson(Map<String, dynamic> json) {
    return Waredata(
      dsProduct: json['dsProduct'],
      dsUnit: json['dsUnit'],
      dsProductCode: json['dsProductCode'],
      dsBarcode: json['dsBarcode'],
      dsGuidId: json['dsGuidId'],
      mtStockCount: json['mtStockCount']?.toDouble() ?? 0.0,
      mtTotal: json['mtTotal']?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dsProduct'] = this.dsProduct;
    data['dsUnit'] = this.dsUnit;
    data['dsProductCode'] = this.dsProductCode;
    data['dsBarcode'] = this.dsBarcode;
    data['dsGuidId'] = this.dsGuidId;
    data['mtStockCount'] = this.mtStockCount;
    data['mtTotal'] = this.mtTotal;
    return data;
  }
}
