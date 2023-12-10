import 'dart:async';
import 'package:bltvt_mobile_veterinary/data/requests/save_customer_request.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_all_color_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_all_patient_type_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_species_by_id_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/save_patient_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/update_customer_response.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_view_model.dart';
import 'package:bltvt_mobile_veterinary/screens/customers/customer_edit_screen_view_model.dart';
import 'package:bltvt_mobile_veterinary/services/general_api_service.dart';

class PatientEditScreenViewModel extends BaseViewModel {
  String customerGuid, patientGuid;
  SavePatientResponse patient = SavePatientResponse();
  List<GetAllColorResponse> allColorData;
  List<String> allColor = [];
  List<GetAllPatientTypeResponse> allPatientTypeData;
  List<String> allPatientType = [];
  List<GetSpeciesByIdResponse> allSpeciesByIdData;
  List<String> allSpeciesById = [];
  int idSpecies;
  String selectedType;
  String selectedColor;
  String selectedSpecies;
  String gender;
  DateTime pickerDate;
  int idCustomer;
  SaveCustomerRequest customer;
  bool isContinue = false;
  CustomerEditScreenViewModel customerVm;
  

  PatientEditScreenViewModel(
    this.customerGuid,
    this.patientGuid,
    this.idCustomer,
    this.customer,
    this.isContinue,
  );

  @override
  FutureOr<void> init() async {
    allColorData = await apiService.getAllColor();
    for (var element in allColorData) {
      allColor.add(element.dsColor);
    }
    allPatientTypeData = await apiService.getAllPatientType();
    for (var element in allPatientTypeData) {
      allPatientType.add(element.dsPatientType);
    }
    if (customerGuid == '' && patientGuid == '') {
      patient = SavePatientResponse();
      selectedType = allPatientTypeData.where((element) => element.dsPatientType == "KEDİ").first.dsPatientType;
      idSpecies = allPatientTypeData.where((element) => element.dsPatientType == selectedType).first.idPatientType;
      allSpeciesById = await getSpeciesById();
      selectedColor = allColorData.first.dsColor;
    } else {
      patient = await apiService.getPatientByGuid(customerGuid, patientGuid);
      selectedType = allPatientTypeData.where((element) => element.idPatientType == patient.idType).first.dsPatientType;
      idSpecies = allPatientTypeData.where((element) => element.dsPatientType == selectedType).first.idPatientType;
      if (idSpecies != null) {
        allSpeciesById = await getSpeciesById();
      }
      // ignore: prefer_if_null_operators
      selectedColor = allColorData.where((element) => element.idColor == (patient.idColor == null ? 92 : patient.idColor)).first.dsColor;
    }
    pickerDate = patient.dtBirthDate == null ? DateTime.now() : DateTime.parse(patient.dtBirthDate);
  }

  FutureOr<List<String>> getSpeciesById() async {
    allSpeciesById.clear();

    allSpeciesByIdData = await apiService.getSpeciesById(idSpecies);

    for (var element in allSpeciesByIdData) {
      allSpeciesById.add(element.dsSpecies);
    }

    selectedSpecies = allSpeciesByIdData.first.dsSpecies;

    return allSpeciesById;
  }

  FutureOr<SavePatientResponse> savePatient() async {
    patient.idColor = allColorData.where((element) => element.dsColor == selectedColor).first.idColor;
    patient.idType = allPatientTypeData.where((element) => element.dsPatientType == selectedType).first.idPatientType;
    patient.idSpecies = idSpecies;
    patient.idGender = gender == "Erkek"
        ? 1
        : gender == "Dişi"
            ? 2
            : null;
    patient.dtBirthDate = pickerDate.toString();
    patient.valid = true;
    patient.idCustomer = idCustomer;

    SavePatientResponse saveData;

    if (customerGuid == '' && patientGuid == '') {
      saveData = await apiService.savePatient(patient);
    } else {
      saveData = await apiService.updatePatient(patient);
    }

    return saveData;
  }

  FutureOr<UpdateCustomerResponse> saveCustomerAndPatient() async {
    patient.idColor = allColorData.where((element) => element.dsColor == selectedColor).first.idColor;
    patient.idType = allPatientTypeData.where((element) => element.dsPatientType == selectedType).first.idPatientType;
    patient.idSpecies = idSpecies;
    patient.idGender = gender == "Erkek"
        ? 1
        : gender == "Dişi"
            ? 2
            : null;
    patient.dtBirthDate = pickerDate.toString();
    patient.valid = true;
    patient.idCustomer = idCustomer;

    UpdateCustomerResponse saveCustomerData;

    if (isContinue) {
      customer.patients = <SavePatientResponse>[];
      customer.patients.add(patient);
      customer.flSendEmail = true;
      customer.flSendSms = true;
      saveCustomerData = await apiService.saveCustomer(customer);
    }

    return saveCustomerData;
  }
}
