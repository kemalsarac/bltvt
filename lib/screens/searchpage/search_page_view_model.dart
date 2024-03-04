import 'dart:async';
import 'package:bltvt_mobile_veterinary/data/requests/get_customer_search_request.dart';
import 'package:bltvt_mobile_veterinary/data/requests/save_customer_request.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_customer_search_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/update_customer_response.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_view_model.dart';
import 'package:bltvt_mobile_veterinary/services/general_api_service.dart';
class   SearchScreenViewModel extends BaseViewModel {
  Timer _searchDebounce;
  List<GetCustomerSearchResponse> customerList;
  List<GetCustomerSearchResponse> filteredList;

  @override
  FutureOr<void> init() async {
    customerList = await apiService.getCustomerSearch(
      GetCustomerSearchRequest(
        searchText: "",
        searchType: "1",
        sortDirectionAsc: true,
        sortColumnIndex: 0,
        sortColumnName: "",
        startIndex: 0,
        totalRecordCount: 50,
      ),
    );

    
    if (customerList == null) {
      return;
    }

    filteredList = List.from(customerList);
  }

  FutureOr<SaveCustomerRequest> getCustomerByGuid (String dsGuidId) async {
    SaveCustomerRequest customer = await apiService.getCustomerByGuid(dsGuidId);
    return customer;
  }

  Future loadMoreCustomers(String search, int retrievedCount) async {
    var newCustomers = await apiService.getCustomerSearch(
      GetCustomerSearchRequest(
        searchText: search,
        searchType: "1",
        sortColumnIndex: 0,
        sortDirectionAsc: true,
        sortColumnName: "",
        startIndex: retrievedCount,
        totalRecordCount: 50,
      ),
    );

    if (newCustomers == null) {
      return;
    }

    customerList.addAll(newCustomers);
    filteredList.addAll(newCustomers);

    refreshState();
  }

  void searchText(String text) {
    if (_searchDebounce?.isActive ?? false) _searchDebounce.cancel();

    _searchDebounce = Timer(const Duration(milliseconds: 500), () async {
      if ((text?.length ?? 0) > 2) {
        customerList = await apiService.getCustomerSearch(
          GetCustomerSearchRequest(
            searchText: text,
            searchType: "1",
            sortColumnIndex: 0,
            sortColumnName: "",
            sortDirectionAsc: true,
            startIndex: 0,
            totalRecordCount: 50,
          ),
        );
        filteredList = List.from(customerList);
      } else {
        customerList = await apiService.getCustomerSearch(
          GetCustomerSearchRequest(
            searchText: "",
            searchType: "1",
            sortDirectionAsc: true,
            sortColumnIndex: 0,
            sortColumnName: "",
            startIndex: 0,
            totalRecordCount: 50,
          ),
        );
        filteredList = List.from(customerList);
      }

      if (customerList == null) {
        return;
      }

      refreshState();
    });
  }

  Future<bool> updateCustomerStatus(SaveCustomerRequest customer) async {
    UpdateCustomerResponse result =
        await apiService.updateCustomerStatus(customer);

    if (result.messageList.isNotEmpty &&
        result.messageList.first.message == "Kaydedildi" ) {
      return true;
    } else {
      return false;
    }
  }
 
}
