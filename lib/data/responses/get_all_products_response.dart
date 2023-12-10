class GetAllProductsResponse {
  int idProduct;
  String dsProduct;
  String dsProductSmsName;
  String dsGuidId;
  bool valid;
  int idProductType;
  int idProductCategory;
  int idSupplier;
  int idBrand;
  int idCompany;
  String dsProductCode;
  String dsBarcode;
  double mtPrice;
  double mtPriceBuying;
  int mtTaxRate;
  double mtPeriod1;
  double mtPeriod2;
  double mtPeriodCount;
  int idType;
  String dtExpiration;
  int mtCriticalStockCount;
  bool flRepeat;
  int idUnit;
  int mtStockCount;
  String dsJson;
  bool flTaxInclude;
  bool flBuyingTaxIncluded;
  bool flFixedPrice;
  bool flSerial;
  // Null supplier;
  // Null productType;
  // Null productCategory;
  // Null unitDto;
  String dtInsertDate;
  String dtUpdateDate;
  int idUserInsert;
  int idUserUpdate;
  String messages;
  List<MessageList> messageList;
  int dbStatus;

  GetAllProductsResponse(
      {this.idProduct,
      this.dsProduct,
      this.dsProductSmsName,
      this.dsGuidId,
      this.valid,
      this.idProductType,
      this.idProductCategory,
      this.idSupplier,
      this.idBrand,
      this.idCompany,
      this.dsProductCode,
      this.dsBarcode,
      this.mtPrice,
      this.mtPriceBuying,
      this.mtTaxRate,
      this.mtPeriod1,
      this.mtPeriod2,
      this.mtPeriodCount,
      this.idType,
      this.dtExpiration,
      this.mtCriticalStockCount,
      this.flRepeat,
      this.idUnit,
      this.mtStockCount,
      this.dsJson,
      this.flTaxInclude,
      this.flBuyingTaxIncluded,
      this.flFixedPrice,
      this.flSerial,
      this.dtInsertDate,
      this.dtUpdateDate,
      this.idUserInsert,
      this.idUserUpdate,
      this.messages,
      this.messageList,
      this.dbStatus});

  GetAllProductsResponse.fromJson(Map<String, dynamic> json) {
    idProduct = json['idProduct'];
    dsProduct = json['dsProduct'];
    dsProductSmsName = json['dsProductSmsName'];
    dsGuidId = json['dsGuidId'];
    valid = json['valid'];
    idProductType = json['idProductType'];
    idProductCategory = json['idProductCategory'];
    idSupplier = json['idSupplier'];
    idBrand = json['idBrand'];
    idCompany = json['idCompany'];
    dsProductCode = json['dsProductCode'];
    dsBarcode = json['dsBarcode'];
    mtPrice = json['mtPrice'];
    mtPriceBuying = json['mtPriceBuying'];
    mtTaxRate = json['mtTaxRate'];
    mtPeriod1 = json['mtPeriod1'];
    mtPeriod2 = json['mtPeriod2'];
    mtPeriodCount = json['mtPeriodCount'];
    idType = json['idType'];
    dtExpiration = json['dtExpiration'];
    mtCriticalStockCount = json['mtCriticalStockCount'];
    flRepeat = json['flRepeat'];
    idUnit = json['idUnit'];
    mtStockCount = json['mtStockCount'];
    dsJson = json['dsJson'];
    flTaxInclude = json['flTaxInclude'];
    flBuyingTaxIncluded = json['flBuyingTaxIncluded'];
    flFixedPrice = json['flFixedPrice'];
    flSerial = json['flSerial'];
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
    data['idProduct'] = idProduct;
    data['dsProduct'] = dsProduct;
    data['dsProductSmsName'] = dsProductSmsName;
    data['dsGuidId'] = dsGuidId;
    data['valid'] = valid;
    data['idProductType'] = idProductType;
    data['idProductCategory'] = idProductCategory;
    data['idSupplier'] = idSupplier;
    data['idBrand'] = idBrand;
    data['idCompany'] = idCompany;
    data['dsProductCode'] = dsProductCode;
    data['dsBarcode'] = dsBarcode;
    data['mtPrice'] = mtPrice;
    data['mtPriceBuying'] = mtPriceBuying;
    data['mtTaxRate'] = mtTaxRate;
    data['mtPeriod1'] = mtPeriod1;
    data['mtPeriod2'] = mtPeriod2;
    data['mtPeriodCount'] = mtPeriodCount;
    data['idType'] = idType;
    data['dtExpiration'] = dtExpiration;
    data['mtCriticalStockCount'] = mtCriticalStockCount;
    data['flRepeat'] = flRepeat;
    data['idUnit'] = idUnit;
    data['mtStockCount'] = mtStockCount;
    data['dsJson'] = dsJson;
    data['flTaxInclude'] = flTaxInclude;
    data['flBuyingTaxIncluded'] = flBuyingTaxIncluded;
    data['flFixedPrice'] = flFixedPrice;
    data['flSerial'] = flSerial;
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
