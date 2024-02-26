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
     this.sortColumnIndex,
     this.sortDirectionAsc,
     this.startIndex,
  });

  Map<String, dynamic> toJson() {
    return {
      'flBuying': flBuying,
      'idPaymentTypes': idPaymentTypes,
      'isAll': isAll,
      'isBank': isBank,
      'isCustomer': isCustomer,
      'isExpriy': isExpriy,
      'isNotCollection': isNotCollection,
      'isPartialCollection': isPartialCollection,
      'isRemaining': isRemaining,
      'isSupplier': isSupplier,
      'length': length,
      'sortColumnIndex': sortColumnIndex,
      'sortDirectionAsc': sortDirectionAsc,
      'startIndex': startIndex,
    };
  }
}
