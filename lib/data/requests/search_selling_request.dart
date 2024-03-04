class SearchSellinRequest {
  bool flBuying;
  List<int> idPaymentTypes;
  bool isAll;
  bool isBank;
  bool isCustomer;
  bool isExpriy;
  bool isNotCollection;
  bool isPartialCollection;
  bool isRemaining;
  bool isSupplier;
  int length;
  String searchText;
  int sortColumnIndex;
  bool sortDirectionAsc;
  int startIndex;

  SearchSellinRequest({
    this.flBuying,
    this.idPaymentTypes,
    this.isAll,
    this.isBank,
    this.isCustomer,
    this.isExpriy,
    this.isNotCollection,
    this.isPartialCollection,
    this.isRemaining,
    this.isSupplier,
    this.length,
    this.searchText,
    this.sortColumnIndex,
    this.sortDirectionAsc,
    this.startIndex,
  });

  SearchSellinRequest.fromJson(Map<String, dynamic> json) {
    flBuying = json['flbuying'];
    idPaymentTypes = json['idPaymentTypes'];
    isAll = json['isAll'];
    isBank = json['isBank'];
    isCustomer = json['isCustomer'];
    isExpriy = json['isExpriy'];
    isNotCollection = json['isNotCollection'];
    isPartialCollection = json['isPartialCollection'];
    isRemaining = json['isRemaining'];
    isSupplier = json['isSupplier'];
    length = json['length'];
    searchText = json['searchText'];
    sortColumnIndex = json['sortColumnIndex'];
    sortDirectionAsc = json['sortDirectionAsc'];
    startIndex = json['startIndex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['flBuying'] = flBuying;
    data['idPaymentTypes'] = idPaymentTypes;
    data['isAll'] = isAll;
    data['isBank'] = isBank;
    data['isCustomer'] = isCustomer;
    data['isExpriy'] = isExpriy;
    data['isNotCollection'] = isNotCollection;
    data['isPartialCollection'] = isPartialCollection;
    data['isRemaining'] = isRemaining;
    data['isSupplier'] = isSupplier;
    data['length'] = length;
    data['searchText'] = searchText;
    data['sortColumnIndex'] = sortColumnIndex;
    data['sortDirectionAsc'] = sortDirectionAsc;
    data['startIndex'] = startIndex;
    return data;
  }
}