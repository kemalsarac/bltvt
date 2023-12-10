class GetAllProductsRequest {
  int status;
  int startIndex;
  String searchText;
  bool sortDirectionAsc;
  int sortColumnIndex;
  String sortColumnName;
  int totalRecordCount;
  int searchType;

  GetAllProductsRequest(
      {this.status,
      this.startIndex,
      this.searchText,
      this.sortDirectionAsc,
      this.sortColumnIndex,
      this.sortColumnName,
      this.totalRecordCount,
      this.searchType});

  GetAllProductsRequest.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    startIndex = json['startIndex'];
    searchText = json['searchText'];
    sortDirectionAsc = json['sortDirectionAsc'];
    sortColumnIndex = json['sortColumnIndex'];
    sortColumnName = json['sortColumnName'];
    totalRecordCount = json['totalRecordCount'];
    searchType = json['searchType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['startIndex'] = startIndex;
    data['searchText'] = searchText;
    data['sortDirectionAsc'] = sortDirectionAsc;
    data['sortColumnIndex'] = sortColumnIndex;
    data['sortColumnName'] = sortColumnName;
    data['totalRecordCount'] = totalRecordCount;
    data['searchType'] = searchType;
    return data;
  }
}
