class updatedeporequest{
  String dsProduct;
  int mtPieces;
  int mtStockCount;
  String dtInsertDate;
  String dsWarehouse;
  String dsSerialNumber;
  String dsStockTransactionType;

  updatedeporequest(
      {this.dsProduct,
      this.mtPieces,
      this.mtStockCount,
      this.dtInsertDate,
      this.dsWarehouse,
      this.dsSerialNumber,
      this.dsStockTransactionType});

  updatedeporequest.fromJson(Map<String, dynamic> json) {
    dsProduct = json['dsProduct'];
    mtPieces = json['mtPieces'];
    mtStockCount = json['mtStockCount'];
    dtInsertDate = json['dtInsertDate'];
    dsWarehouse = json['dsWarehouse'];
    dsSerialNumber = json['dsSerialNumber'];
    dsStockTransactionType = json['dsStockTransactionType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dsProduct'] = this.dsProduct;
    data['mtPieces'] = this.mtPieces;
    data['mtStockCount'] = this.mtStockCount;
    data['dtInsertDate'] = this.dtInsertDate;
    data['dsWarehouse'] = this.dsWarehouse;
    data['dsSerialNumber'] = this.dsSerialNumber;
    data['dsStockTransactionType'] = this.dsStockTransactionType;
    return data;
  }
}