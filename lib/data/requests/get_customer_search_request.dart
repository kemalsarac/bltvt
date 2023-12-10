class GetCustomerSearchRequest {
  String searchText;
  int startIndex;
  bool sortDirectionAsc;
  int sortColumnIndex;
  String sortColumnName;
  int totalRecordCount;
  String searchType;

  GetCustomerSearchRequest(
      {this.searchText,
      this.startIndex,
      this.sortDirectionAsc,
      this.sortColumnIndex,
      this.sortColumnName,
      this.totalRecordCount,
      this.searchType});

  GetCustomerSearchRequest.fromJson(Map<String, dynamic> json) {
    searchText = json["searchText"];
    startIndex = json['startIndex'];
    sortDirectionAsc = json['sortDirectionAsc'];
    sortColumnIndex = json['sortColumnIndex'];
    sortColumnName = json['sortColumnName'];
    totalRecordCount = json['totalRecordCount'];
    searchType = json['searchType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['searchText'] = searchText;
    data['startIndex'] = startIndex;
    data['sortDirectionAsc'] = sortDirectionAsc;
    data['sortColumnIndex'] = sortColumnIndex;
    data['sortColumnName'] = sortColumnName;
    data['totalRecordCount'] = totalRecordCount;
    data['searchType'] = searchType;
    return data;
  }
}
