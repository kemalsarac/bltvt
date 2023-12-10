import 'dart:async';
import 'package:bltvt_mobile_veterinary/data/requests/save_appointment_request.dart';
import 'package:bltvt_mobile_veterinary/data/requests/update_appointment_info_request.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_appointment_by_id_patient_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_product_vaccine_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/save_appointment_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/save_patient_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/search_calendar_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/update_appointment_info_response.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_view_model.dart';
import 'package:bltvt_mobile_veterinary/services/general_api_service.dart';
import 'package:bltvt_mobile_veterinary/data/requests/save_customer_request.dart';
import 'package:bltvt_mobile_veterinary/data/requests/update_patient_status_request.dart';
import 'package:bltvt_mobile_veterinary/data/responses/update_patient_status_response.dart';
class AdmissionEditScreenViewModel extends BaseViewModel {
  String admissionGuid, customerGuid, patientGuid;
  List<GetProductVaccineResponse> vaccines = [];
  List<String> vaccinesList = [];
  String selectedVaccine;
  SaveAppointmentRequest saveRequest = SaveAppointmentRequest();
  UpdateAppointmentInfoRequest updateRequest = UpdateAppointmentInfoRequest();
  List<String> admissionTypes = ["Genel Muayene", "Aşı", "Kontrol Muayenesi", "Operasyon", "Tıraş", "Banyo"];
  String selectedAdmissionType = "Genel Muayene";
  DateTime pickerDate;
  List<SearchCalendarResponse> appointments = [];
  GetAppointmentByIdPatientResponse selectedAppointment;
  SaveCustomerRequest customerDetail;
  List<SavePatientResponse> customerPatients;
  

  AdmissionEditScreenViewModel(this.admissionGuid, this.selectedAppointment, this.customerGuid, this.patientGuid);

  @override
  FutureOr<void> init() async {
    vaccines = await apiService.getProductVaccine();
    appointments = await apiService.getSearchCalendarResults();
    customerDetail = await  apiService.getCustomerByGuid(customerGuid);
    customerPatients = customerDetail.patients.where((element) => element.valid == true).toList();
   
   
    for (var element in vaccines) {
      vaccinesList.add(element.dsProduct);
    }
    if (admissionGuid == '') {
      pickerDate = DateTime.now();
      SavePatientResponse patient = await apiService.getPatientByGuid(customerGuid, patientGuid);
      selectedAppointment.idCustomer = patient.idCustomer;
      selectedAppointment.idPatient = patient.idPatient;
    } else {
      pickerDate =
          selectedAppointment.dtAdmission == null ? DateTime.now() : DateTime.parse(selectedAppointment.dtAdmission);
      selectedAdmissionType = getAppointmentName(selectedAppointment.idAdmissionType);
      if (selectedAppointment.idAdmissionType == 2) {
        selectedVaccine = vaccinesList.where((element) => element == selectedAppointment.dsProduct).first;
      } else {
        selectedVaccine = vaccinesList.first;
      }
    }
  } 
  Future<bool> updatePatientStatus(UpdatePatientStatusRequest request) async {
    UpdatePatientStatusResponse result = await apiService.updatePatientStatus(request);

    if (result.messageList.isNotEmpty && result.messageList.first.message == "Kaydedildi") {
      return true;
    } else {
      return false;
    }
  }

  Future<UpdateAppointmentInfoResponse> updateAppointment() async {
    updateRequest.idPatientAdmission = selectedAppointment.idPatientAdmission;
    updateRequest.idCustomer = selectedAppointment.idCustomer;
    updateRequest.dsGuidId = selectedAppointment.dsGuidId;
    updateRequest.dtAdmission = pickerDate.toString();
    updateRequest.dtInsertDate = selectedAppointment.dtInsertDate;
    updateRequest.dtUpdateDate = selectedAppointment.dtUpdateDate;
    updateRequest.idAdmissionType = selectedAppointment.idAdmissionType;
    updateRequest.idCompany = selectedAppointment.idCompany;
    updateRequest.idPatient = selectedAppointment.idPatient;
    updateRequest.idUser = selectedAppointment.idUser;
    updateRequest.dsUser = selectedAppointment.dsUser;
    updateRequest.idStatus = selectedAppointment.idStatus;
    updateRequest.dsNote = "";
    updateRequest.mtTotal = 0;
    updateRequest.mtRemainingDebt = 0;
    updateRequest.flDetail = false;
    if (selectedVaccine != null && selectedVaccine.isNotEmpty) {
      updateRequest.dsProduct = selectedVaccine;
      updateRequest.idVaccient = vaccines.where((element) => element.dsProduct == selectedVaccine).first.idProduct;
    }

    UpdateAppointmentInfoResponse updateResponse = await apiService.updateAppointmentInfo(updateRequest);

    return updateResponse;
  }

  Future<SaveAppointmentResponse> saveAppointment() async {
    saveRequest.flDetail = false;
    saveRequest.isAppovalAppointment = false;
    saveRequest.isTime = false;
    saveRequest.isSendSms = false;
    saveRequest.idStatus = 2;
    if (selectedVaccine != null && selectedVaccine.isNotEmpty) {
      saveRequest.idVaccient = vaccines.where((element) => element.dsProduct == selectedVaccine).first.idProduct;
    }
    saveRequest.dtAdmission = pickerDate.toString();
    saveRequest.idPatient = selectedAppointment.idPatient;
    saveRequest.idAdmissionType = getAppointmentId(selectedAdmissionType).toString();
    saveRequest.idCustomer = selectedAppointment.idCustomer;

    SaveAppointmentResponse saveResponse = await apiService.saveAppointment(saveRequest);

    return saveResponse;
  }

  String getAppointmentName(int idAdmissionType) {
    switch (idAdmissionType) {
      case 1:
        return "Genel Muayene";
        break;
      case 2:
        return "Aşı";
        break;
      case 3:
        return "Kontrol Muayenesi";
        break;
      case 4:
        return "Operasyon";
        break;
      case 5:
        return "Tıraş";
        break;
      case 8:
        return "Tedavi";
        break;
      case 9:
        return "Banyo";
        break;
      case 10:
        return "Konaklama";
        break;
      default:
        return "Randevu";
    }
  }

  int getAppointmentId(String admissionType) {
    switch (admissionType) {
      case "Genel Muayene":
        return 1;
        break;
      case "Aşı":
        return 2;
        break;
      case "Kontrol Muayenesi":
        return 3;
        break;
      case "Operasyon":
        return 4;
        break;
      case "Tıraş":
        return 5;
        break;
      case "Tedavi":
        return 8;
        break;
      case "Banyo":
        return 9;
        break;
      case "Konaklama":
        return 10;
        break;
      default:
        return null;
    }
  }
}
