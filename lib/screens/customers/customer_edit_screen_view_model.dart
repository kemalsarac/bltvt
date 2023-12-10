import 'dart:async';
import 'package:bltvt_mobile_veterinary/data/requests/save_customer_request.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_all_customer_groups_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/update_customer_response.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_view_model.dart';
import 'package:bltvt_mobile_veterinary/services/general_api_service.dart';

class CustomerEditScreenViewModel extends BaseViewModel {
  String guid;
  SaveCustomerRequest customer = SaveCustomerRequest();
  List<GetAllCustomerGroupsResponse> customerGroupsData;
  List<String> customerGroups = [];
  String selectedGroup;

  CustomerEditScreenViewModel(this.guid);

  @override
  Future<void> init() async {
    if (guid == '') {
      customer = SaveCustomerRequest();
      customer.mtDiscountRate = 0;
    } else {
      customer = await apiService.getCustomerByGuid(guid);
    }

    customerGroupsData = await apiService.getAllCustomerGroups();

    if (customerGroupsData != null && customerGroupsData.isNotEmpty) {
      customerGroups = customerGroupsData.map((element) => element.dsCustomerGroup).toList();
      selectedGroup = customerGroupsData.first.dsCustomerGroup;
    }
  }

  Future<UpdateCustomerResponse> saveCustomer() async {
   

    UpdateCustomerResponse saveData;
    if (guid == '') {
      saveData = await apiService.saveCustomer(customer);
    } else {
      saveData = await apiService.updateCustomer(customer);
    }
    return saveData;
  }
}
