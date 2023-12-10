import 'dart:async';

import 'package:bltvt_mobile_veterinary/data/requests/get_all_products_request.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_all_products_response.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_view_model.dart';
import 'package:bltvt_mobile_veterinary/services/general_api_service.dart';

class VaccinesScreenViewModel extends BaseViewModel {
  Timer _searchDebounce;
  List<GetAllProductsResponse> productList;
  List<GetAllProductsResponse> filteredList;

  @override
  FutureOr<void> init() async {
    productList = await apiService.getAllProducts(
      GetAllProductsRequest(
        status: 2,
        startIndex: 0,
        searchText: "",
        sortDirectionAsc: true,
        sortColumnIndex: 0,
        sortColumnName: "",
        totalRecordCount: 50,
        searchType: 1,
      ),
    );
    filteredList = productList;
  }

  Future loadMoreProducts(String search, int retrievedCount) async {
    var newProducts = await apiService.getAllProducts(
      GetAllProductsRequest(
          searchText: search,
          searchType: 1,
          status: 2,
          totalRecordCount: 50,
          sortColumnIndex: 0,
          sortColumnName: "",
          sortDirectionAsc: true,
          startIndex: retrievedCount),
    );
    productList.addAll(newProducts);

    refreshState();
  }

  void searchText(String text) {
    if (_searchDebounce?.isActive ?? false) _searchDebounce.cancel();

    _searchDebounce = Timer(
      const Duration(milliseconds: 500),
      () async {
        if ((text?.length ?? 0) > 2) {
          productList = await apiService.getAllProducts(
            GetAllProductsRequest(
              status: 2,
              startIndex: 0,
              searchText: text,
              sortDirectionAsc: true,
              sortColumnIndex: 0,
              sortColumnName: "",
              totalRecordCount: 50,
              searchType: 1,
            ),
          );
          // this.refreshState();
        } else {
          productList = await apiService.getAllProducts(
            GetAllProductsRequest(
              status: 2,
              startIndex: 0,
              searchText: "",
              sortDirectionAsc: true,
              sortColumnIndex: 0,
              sortColumnName: "",
              totalRecordCount: 50,
              searchType: 1,
            ),
          );
        }
        refreshState();
      },
    );
  }
}
