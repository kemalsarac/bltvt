class UpdateProductResponse {
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
  int mtPeriod1;
  int mtPeriod2;
   int mtPeriodCount;
  int idType;
  String dtExpiration;
  double mtCriticalStockCount;
  bool flRepeat;
  int idUnit;
  int mtStockCount;
  String dsJson;
  bool flTaxInclude;
  bool flBuyingTaxIncluded;
  bool flFixedPrice;
  bool flSerial;
  int idCurrency;
  Supplier supplier;
  ProductType productType;
  ProductCategory productCategory;
  UnitDto unitDto;
  String dtInsertDate;
  String dtUpdateDate;
  int idUserInsert;
  int idUserUpdate;
  String messages;
  List<MessageList> messageList;
  int dbStatus;

  UpdateProductResponse(
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
      this.idCurrency,
      this.supplier,
      this.productType,
      this.productCategory,
      this.unitDto,
      this.dtInsertDate,
      this.dtUpdateDate,
      this.idUserInsert,
      this.idUserUpdate,
      this.messages,
      this.messageList,
      this.dbStatus});

  UpdateProductResponse.fromJson(Map<String, dynamic> json) {
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
    idCurrency = json['idCurrency'];
    supplier = json['supplier'] != null
        ? new Supplier.fromJson(json['supplier'])
        : null;
    productType = json['productType'] != null
        ? new ProductType.fromJson(json['productType'])
        : null;
    productCategory = json['productCategory'] != null
        ? new ProductCategory.fromJson(json['productCategory'])
        : null;
    unitDto =
        json['unitDto'] != null ? new UnitDto.fromJson(json['unitDto']) : null;
    dtInsertDate = json['dtInsertDate'];
    dtUpdateDate = json['dtUpdateDate'];
    idUserInsert = json['idUserInsert'];
    idUserUpdate = json['idUserUpdate'];
    messages = json['messages'];
    if (json['messageList'] != null) {
      messageList = <MessageList>[];
      json['messageList'].forEach((v) {
        messageList.add(new MessageList.fromJson(v));
      });
    }
    dbStatus = json['dbStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idProduct'] = this.idProduct;
    data['dsProduct'] = this.dsProduct;
    data['dsProductSmsName'] = this.dsProductSmsName;
    data['dsGuidId'] = this.dsGuidId;
    data['valid'] = this.valid;
    data['idProductType'] = this.idProductType;
    data['idProductCategory'] = this.idProductCategory;
    data['idSupplier'] = this.idSupplier;
    data['idBrand'] = this.idBrand;
    data['idCompany'] = this.idCompany;
    data['dsProductCode'] = this.dsProductCode;
    data['dsBarcode'] = this.dsBarcode;
    data['mtPrice'] = this.mtPrice;
    data['mtPriceBuying'] = this.mtPriceBuying;
    data['mtTaxRate'] = this.mtTaxRate;
    data['mtPeriod1'] = this.mtPeriod1;
    data['mtPeriod2'] = this.mtPeriod2;
    data['mtPeriodCount'] = this.mtPeriodCount;
    data['idType'] = this.idType;
    data['dtExpiration'] = this.dtExpiration;
    data['mtCriticalStockCount'] = this.mtCriticalStockCount;
    data['flRepeat'] = this.flRepeat;
    data['idUnit'] = this.idUnit;
    data['mtStockCount'] = this.mtStockCount;
    data['dsJson'] = this.dsJson;
    data['flTaxInclude'] = this.flTaxInclude;
    data['flBuyingTaxIncluded'] = this.flBuyingTaxIncluded;
    data['flFixedPrice'] = this.flFixedPrice;
    data['flSerial'] = this.flSerial;
    data['idCurrency'] = this.idCurrency;
    if (this.supplier != null) {
      data['supplier'] = this.supplier.toJson();
    }
    if (this.productType != null) {
      data['productType'] = this.productType.toJson();
    }
    if (this.productCategory != null) {
      data['productCategory'] = this.productCategory.toJson();
    }
    if (this.unitDto != null) {
      data['unitDto'] = this.unitDto.toJson();
    }
    data['dtInsertDate'] = this.dtInsertDate;
    data['dtUpdateDate'] = this.dtUpdateDate;
    data['idUserInsert'] = this.idUserInsert;
    data['idUserUpdate'] = this.idUserUpdate;
    data['messages'] = this.messages;
    if (this.messageList != null) {
      data['messageList'] = this.messageList.map((v) => v.toJson()).toList();
    }
    data['dbStatus'] = this.dbStatus;
    return data;
  }
}

class Supplier {
  int idSupplier;
  int idCompany;
  String dsSupplier;
  String dsPhoneNo;
  String dsGuidId;
  String dsEmail;
  bool valid;
  double mtBalance;
  String dtInsertDate;
  String dtUpdateDate;
  int idUserInsert;
  int idUserUpdate;
  String messages;
  List<MessageList> messageList;
  int dbStatus;

  Supplier(
      {this.idSupplier,
      this.idCompany,
      this.dsSupplier,
      this.dsPhoneNo,
      this.dsGuidId,
      this.dsEmail,
      this.valid,
      this.mtBalance,
      this.dtInsertDate,
      this.dtUpdateDate,
      this.idUserInsert,
      this.idUserUpdate,
      this.messages,
      this.messageList,
      this.dbStatus});

  Supplier.fromJson(Map<String, dynamic> json) {
    idSupplier = json['idSupplier'];
    idCompany = json['idCompany'];
    dsSupplier = json['dsSupplier'];
    dsPhoneNo = json['dsPhoneNo'];
    dsGuidId = json['dsGuidId'];
    dsEmail = json['dsEmail'];
    valid = json['valid'];
    mtBalance = json['mtBalance'];
    dtInsertDate = json['dtInsertDate'];
    dtUpdateDate = json['dtUpdateDate'];
    idUserInsert = json['idUserInsert'];
    idUserUpdate = json['idUserUpdate'];
    messages = json['messages'];
    if (json['messageList'] != null) {
      messageList = <MessageList>[];
      json['messageList'].forEach((v) {
        messageList.add(new MessageList.fromJson(v));
      });
    }
    dbStatus = json['dbStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idSupplier'] = this.idSupplier;
    data['idCompany'] = this.idCompany;
    data['dsSupplier'] = this.dsSupplier;
    data['dsPhoneNo'] = this.dsPhoneNo;
    data['dsGuidId'] = this.dsGuidId;
    data['dsEmail'] = this.dsEmail;
    data['valid'] = this.valid;
    data['mtBalance'] = this.mtBalance;
    data['dtInsertDate'] = this.dtInsertDate;
    data['dtUpdateDate'] = this.dtUpdateDate;
    data['idUserInsert'] = this.idUserInsert;
    data['idUserUpdate'] = this.idUserUpdate;
    data['messages'] = this.messages;
    if (this.messageList != null) {
      data['messageList'] = this.messageList.map((v) => v.toJson()).toList();
    }
    data['dbStatus'] = this.dbStatus;
    return data;
  }
}

class ProductType {
  int idProductType;
  String dsGuidId;
  String dsProductType;
  int idCompany;
  bool valid;
  String dtInsertDate;
  String dtUpdateDate;
  int idUserInsert;
  int idUserUpdate;
  String messages;
  List<MessageList> messageList;
  int dbStatus;

  ProductType(
      {this.idProductType,
      this.dsGuidId,
      this.dsProductType,
      this.idCompany,
      this.valid,
      this.dtInsertDate,
      this.dtUpdateDate,
      this.idUserInsert,
      this.idUserUpdate,
      this.messages,
      this.messageList,
      this.dbStatus});

  ProductType.fromJson(Map<String, dynamic> json) {
    idProductType = json['idProductType'];
    dsGuidId = json['dsGuidId'];
    dsProductType = json['dsProductType'];
    idCompany = json['idCompany'];
    valid = json['valid'];
    dtInsertDate = json['dtInsertDate'];
    dtUpdateDate = json['dtUpdateDate'];
    idUserInsert = json['idUserInsert'];
    idUserUpdate = json['idUserUpdate'];
    messages = json['messages'];
    if (json['messageList'] != null) {
      messageList = <Null>[];
      json['messageList'].forEach((v) {
        messageList.add(new MessageList.fromJson(v));
      });
    }
    dbStatus = json['dbStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idProductType'] = this.idProductType;
    data['dsGuidId'] = this.dsGuidId;
    data['dsProductType'] = this.dsProductType;
    data['idCompany'] = this.idCompany;
    data['valid'] = this.valid;
    data['dtInsertDate'] = this.dtInsertDate;
    data['dtUpdateDate'] = this.dtUpdateDate;
    data['idUserInsert'] = this.idUserInsert;
    data['idUserUpdate'] = this.idUserUpdate;
    data['messages'] = this.messages;
    if (this.messageList != null) {
      data['messageList'] = this.messageList.map((v) => v.toJson()).toList();
    }
    data['dbStatus'] = this.dbStatus;
    return data;
  }
}

class ProductCategory {
  int idProductCategory;
  int idCompany;
  String dsGuidId;
  String dsProductCategory;
  bool valid;
  String dtInsertDate;
  String dtUpdateDate;
  int idUserInsert;
  int idUserUpdate;
  String messages;
  List<MessageList> messageList;
  int dbStatus;

  ProductCategory(
      {this.idProductCategory,
      this.idCompany,
      this.dsGuidId,
      this.dsProductCategory,
      this.valid,
      this.dtInsertDate,
      this.dtUpdateDate,
      this.idUserInsert,
      this.idUserUpdate,
      this.messages,
      this.messageList,
      this.dbStatus});

  ProductCategory.fromJson(Map<String, dynamic> json) {
    idProductCategory = json['idProductCategory'];
    idCompany = json['idCompany'];
    dsGuidId = json['dsGuidId'];
    dsProductCategory = json['dsProductCategory'];
    valid = json['valid'];
    dtInsertDate = json['dtInsertDate'];
    dtUpdateDate = json['dtUpdateDate'];
    idUserInsert = json['idUserInsert'];
    idUserUpdate = json['idUserUpdate'];
    messages = json['messages'];
    if (json['messageList'] != null) {
      messageList = <MessageList>[];
      json['messageList'].forEach((v) {
        messageList.add(new MessageList.fromJson(v));
      });
    }
    dbStatus = json['dbStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idProductCategory'] = this.idProductCategory;
    data['idCompany'] = this.idCompany;
    data['dsGuidId'] = this.dsGuidId;
    data['dsProductCategory'] = this.dsProductCategory;
    data['valid'] = this.valid;
    data['dtInsertDate'] = this.dtInsertDate;
    data['dtUpdateDate'] = this.dtUpdateDate;
    data['idUserInsert'] = this.idUserInsert;
    data['idUserUpdate'] = this.idUserUpdate;
    data['messages'] = this.messages;
    if (this.messageList != null) {
      data['messageList'] = this.messageList.map((v) => v.toJson()).toList();
    }
    data['dbStatus'] = this.dbStatus;
    return data;
  }
}

class UnitDto {
  int idUnit;
  String dsUnit;
  String dsUnitLong;
  String dtInsertDate;
  String dtUpdateDate;
  int idUserInsert;
  int idUserUpdate;
  String messages;
  List<MessageList> messageList;
  int dbStatus;

  UnitDto(
      {this.idUnit,
      this.dsUnit,
      this.dsUnitLong,
      this.dtInsertDate,
      this.dtUpdateDate,
      this.idUserInsert,
      this.idUserUpdate,
      this.messages,
      this.messageList,
      this.dbStatus});

  UnitDto.fromJson(Map<String, dynamic> json) {
    idUnit = json['idUnit'];
    dsUnit = json['dsUnit'];
    dsUnitLong = json['dsUnitLong'];
    dtInsertDate = json['dtInsertDate'];
    dtUpdateDate = json['dtUpdateDate'];
    idUserInsert = json['idUserInsert'];
    idUserUpdate = json['idUserUpdate'];
    messages = json['messages'];
    if (json['messageList'] != null) {
      messageList = <MessageList>[];
      json['messageList'].forEach((v) {
        messageList.add(new MessageList.fromJson(v));
      });
    }
    dbStatus = json['dbStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idUnit'] = this.idUnit;
    data['dsUnit'] = this.dsUnit;
    data['dsUnitLong'] = this.dsUnitLong;
    data['dtInsertDate'] = this.dtInsertDate;
    data['dtUpdateDate'] = this.dtUpdateDate;
    data['idUserInsert'] = this.idUserInsert;
    data['idUserUpdate'] = this.idUserUpdate;
    data['messages'] = this.messages;
    if (this.messageList != null) {
      data['messageList'] = this.messageList.map((v) => v.toJson()).toList();
    }
    data['dbStatus'] = this.dbStatus;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['message'] = this.message;
    data['messageType'] = this.messageType;
    return data;
  }
}
