import 'dart:async';
import 'package:bltvt_mobile_veterinary/data/requests/save_customer_request.dart';
import 'package:bltvt_mobile_veterinary/data/requests/update_admission_status_request.dart';
import 'package:bltvt_mobile_veterinary/data/requests/update_patient_status_request.dart';
import 'package:bltvt_mobile_veterinary/data/requests/update_request.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_appointment_by_id_patient_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/save_patient_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/update_admission_status_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/update_patient_status_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/update_response.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_view_model.dart';
import 'package:bltvt_mobile_veterinary/services/general_api_service.dart';

import 'package:bltvt_mobile_veterinary/data/responses/get_dashboards_appointments_response.dart';
class PatientProfileScreenViewModel extends BaseViewModel {
  String patientGuid;
  SaveCustomerRequest customerDetail;
  SavePatientResponse patientDetail;
  List<GetAppointmentByIdPatientResponse> appointments = [];
  List<String> appointmentTypes = ["Bekleyen", "Onaylanan", "İptal"];
  List<GetDashboardsAppointmentsResponse> filteredAppointments = [];
  PatientProfileScreenViewModel(this.patientGuid, this.customerDetail);

  @override
  FutureOr<void> init() async {
    patientDetail = await apiService.getPatientByGuid(customerDetail.dsGuidId, patientGuid);
    appointments.addAll(
      await apiService.getAppointmentByIdPatient(patientDetail.idPatient, 1, customerDetail.idCustomer),
    );
    appointments.addAll(
      await apiService.getAppointmentByIdPatient(patientDetail.idPatient, 2, customerDetail.idCustomer),
    );
    appointments.addAll(
      await apiService.getAppointmentByIdPatient(patientDetail.idPatient, 3, customerDetail.idCustomer),
    );
    for (var element in appointments) {
      element.dsProduct = element.dsProduct == null || element.dsProduct.isEmpty
          ? getAppointmentName(element.idAdmissionType)
          : element.dsProduct;
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
    Future<bool> updateHayvan(updateRequest request) async {
    updateResponse result = await apiService.updateHayvan(request);

    if (result.messageList.isNotEmpty && result.messageList.first.message == "Kaydedildi") {
      return true;
    } else {
      return false;
    }
  }


  String getAppointmentName(int idAdmissionType) {
    switch (idAdmissionType) {
      case 1:
        return "Genel Muayene";
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

  Future<bool> updateAdmissionStatus(UpdateAdmissionStatusRequest request) async {
    UpdateAdmissionStatusResponse result = await apiService.updateAdmissionStatus(request);

    if (result.messageList.isNotEmpty && result.messageList.first.message == "Kaydedildi") {
      return true;
    }

    return false;
  }
}
