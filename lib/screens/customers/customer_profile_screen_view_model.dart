import 'dart:async';
import 'package:bltvt_mobile_veterinary/data/requests/save_customer_request.dart';
import 'package:bltvt_mobile_veterinary/data/requests/update_patient_status_request.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_all_patient_type_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/update_patient_status_response.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_view_model.dart';
import 'package:bltvt_mobile_veterinary/services/general_api_service.dart';

class CustomerProfileScreenViewModel extends BaseViewModel {
  String guid;
  SaveCustomerRequest customerDetail;
  List<GetAllPatientTypeResponse> patientTypes;

  CustomerProfileScreenViewModel(this.guid);

  @override
  FutureOr<void> init() async {
    customerDetail = await apiService.getCustomerByGuid(guid);
    customerDetail.patients = customerDetail.patients.where((element) => element.valid == true).toList();
    patientTypes = await apiService.getAllPatientType();
    
  }

  Future<bool> updatePatientStatus(UpdatePatientStatusRequest request) async {
    UpdatePatientStatusResponse result = await apiService.updatePatientStatus(request);

    if (result.messageList.isNotEmpty && result.messageList.first.message == "Kaydedildi") {
      return true;
    } else {
      return false;
    }
  }
}
