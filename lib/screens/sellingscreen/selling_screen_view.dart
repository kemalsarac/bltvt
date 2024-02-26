import 'dart:async';
import 'package:bltvt_mobile_veterinary/data/requests/search_selling_request.dart';
import 'package:bltvt_mobile_veterinary/data/responses/sales_search_response.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_view_model.dart';
import 'package:bltvt_mobile_veterinary/services/general_api_service.dart';

class SellingScreenViewModel extends BaseViewModel {
  Timer _searchDebounce;
List<salessearchresponse> salesData = [];


  @override
 FutureOr<void> init() async {
  salesData = await apiService.getSalesResponse(
    SearchSellinRequest(
      flBuying: false,
      idPaymentTypes: [],
      isAll: false,
      isBank: false,
      isCustomer: false,
      isExpriy: false,
      isNotCollection: false,
      isPartialCollection: false,
      isRemaining: false,
      isSupplier: false,
      length: 0,
      sortColumnIndex: 0,
      sortDirectionAsc: false,
      startIndex: 0,
    )
  );
}


  
}
