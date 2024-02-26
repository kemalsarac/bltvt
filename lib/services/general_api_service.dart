import 'dart:async';
import 'dart:convert';
// ignore: unused_import
import 'dart:developer';
import 'package:bltvt_mobile_veterinary/constants/app_constants.dart';
import 'package:bltvt_mobile_veterinary/data/requests/get_all_products_request.dart';
import 'package:bltvt_mobile_veterinary/data/requests/get_customer_search_request.dart';
import 'package:bltvt_mobile_veterinary/data/requests/get_sms_balance_request.dart';
import 'package:bltvt_mobile_veterinary/data/requests/save_appointment_request.dart';
import 'package:bltvt_mobile_veterinary/data/requests/save_customer_request.dart';
import 'package:bltvt_mobile_veterinary/data/requests/search_selling_request.dart';
import 'package:bltvt_mobile_veterinary/data/requests/update_admission_status_request.dart';
import 'package:bltvt_mobile_veterinary/data/requests/update_appointment_info_request.dart';
import 'package:bltvt_mobile_veterinary/data/requests/update_patient_status_request.dart';
import 'package:bltvt_mobile_veterinary/data/requests/update_request.dart';
import 'package:bltvt_mobile_veterinary/data/responses/bilanco_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/depohak_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_all_color_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_all_customer_groups_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_all_patient_type_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_all_products_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_appointment_by_id_patient_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_company_parameter_values_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_customer_search_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_dashboards_appointments_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_dashboards_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_product_vaccine_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_sms_settings_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_species_by_id_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/gethavedepo_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/login_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/money_resonse.dart';
import 'package:bltvt_mobile_veterinary/data/responses/sales_search_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/save_appointment_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/save_patient_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/search_calendar_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/update_admission_status_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/update_appointment_info_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/update_customer_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/update_patient_status_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/update_randevu_%C4%B1nfo_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/update_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/warecategoryval_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/waredata_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/warehouses_transferesponse.dart';
import 'package:bltvt_mobile_veterinary/services/local_storage_service.dart';
import 'package:bltvt_mobile_veterinary/data/responses/company_data_response.dart';
import 'package:http/http.dart' as http;

final GeneralApiService apiService = GeneralApiService._();

class GeneralApiService {
  final StreamController _tokenExpiredController = StreamController.broadcast();
  Stream get tokenExpired$ => _tokenExpiredController.stream;

  String token = '';

  GeneralApiService._();

  Map<String, String> getHeaders() {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
  }

  bool checkTokenExpired(http.Response response) {
    var flTokenExpired = response.statusCode == 401;

    if (flTokenExpired) {
      _tokenExpiredController.add(null);
    }

    return flTokenExpired;
  }

  FutureOr<LoginResponse> login(String dsEmail, String dsPassword) async {
    var requestBody = {"dsEmail": dsEmail, "dsPassword": dsPassword};

    final response = await http.post(
      Uri.parse("${ApplicationConstants.baseURL}/user/Login"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode(requestBody),
    );

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(json.decode(response.body));
    } else {
      return LoginResponse.fromJson(json.decode(response.body));
    }
  }
  

  Future<GetSmsSettingsResponse> getSmsSettings(int idProvider) async {
    var accountInfo = await localStorageService.getCredentialAccounts();
    token = accountInfo.token.isNotEmpty ? accountInfo.token : '';

    final response = await http.get(
      Uri.parse(
          "${ApplicationConstants.baseURL}/smsSettings/getByIdProvider/$idProvider"),
      headers: getHeaders(),
    );

    var data = GetSmsSettingsResponse();

    if (!checkTokenExpired(response)) {
      if (response.statusCode == 200) {
        var res = json.decode(response.body);
        data = GetSmsSettingsResponse.fromJson(res);
        return data;
      } else {
        return data;
      }
    } else {
      return data;
    }
  }

  Future<double> getSmsBalance(GetSmsBalanceRequest request) async {
    var accountInfo = await localStorageService.getCredentialAccounts();
    token = accountInfo.token.isNotEmpty ? accountInfo.token : '';

    var requestBody = {
      "username": request.username,
      "password": request.password,
      "idProvider": request.idProvider
    };

    final response = await http.post(
      Uri.parse("${ApplicationConstants.baseURL}/dashboard/getSmsBalance"),
      headers: getHeaders(),
      body: json.encode(requestBody),
    );

    if (!checkTokenExpired(response)) {
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return -1;
      }
    } else {
      return -1;
    }
  }

  Future<List<GetCompanyParameterValues>> getCompanyParameters() async {
    var accountInfo = await localStorageService.getCredentialAccounts();
    token = accountInfo.token.isNotEmpty ? accountInfo.token : '';

    final response = await http.get(
      Uri.parse(
          "${ApplicationConstants.baseURL}/companyParameterValue/getCompanyParameterValues"),
      headers: getHeaders(),
    );

    var data = <GetCompanyParameterValues>[];

    if (!checkTokenExpired(response)) {
      if (response.statusCode == 200) {
        Iterable list = json.decode(response.body);

        data = list.map((e) => GetCompanyParameterValues.fromJson(e)).toList();
        return data;
      } else {
        return data;
      }
    } else {
      return data;
    }
  }

  Future<List<GetCustomerSearchResponse>> getCustomerSearch(
      GetCustomerSearchRequest request) async {
    var accountInfo = await localStorageService.getCredentialAccounts();
    token = accountInfo.token.isNotEmpty ? accountInfo.token : '';

    final response = await http.post(
      Uri.parse("${ApplicationConstants.baseURL}/customer/GetCustomerSearch"),
      headers: getHeaders(),
      body: json.encode(request),
    );

    var data = <GetCustomerSearchResponse>[];

    if (!checkTokenExpired(response)) {
      if (response.statusCode == 200) {
        Iterable list = json.decode(response.body);

        data = list.map((e) => GetCustomerSearchResponse.fromJson(e)).toList();
        return data;
      } else {
        return data;
      }
    } else {
      return data;
    }
  }

  Future<UpdateCustomerResponse> updateCustomerStatus(
      SaveCustomerRequest request) async {
    var accountInfo = await localStorageService.getCredentialAccounts();
    token = accountInfo.token.isNotEmpty ? accountInfo.token : '';

    final response = await http.post(
      Uri.parse("${ApplicationConstants.baseURL}/customer/update"),
      headers: getHeaders(),
      body: json.encode(request),
    );

    var model = UpdateCustomerResponse();

    if (!checkTokenExpired(response)) {
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        model = UpdateCustomerResponse.fromJson(data);

        return model;
      } else {
        return model;
      }
    } else {
      return model;
    }
  }
  
  Future<WarehouseTransferResponse> stocktransferware(
     ) async {
    var accountInfo = await localStorageService.getCredentialAccounts();
    token = accountInfo.token.isNotEmpty ? accountInfo.token : '';

    final response = await http.post(
      Uri.parse("${ApplicationConstants.baseURL}/stockdefination/sendWarehouseStokTransfer"),
      headers: getHeaders(),
    
    );

    var model = WarehouseTransferResponse();

    if (!checkTokenExpired(response)) {
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        model = WarehouseTransferResponse.fromJson(data);

        return model;
      } else {
        return model;
      }
    } else {
      return model;
    }
  }


  Future<UpdateCustomerResponse> updateCustomer(
      SaveCustomerRequest request) async {
    var accountInfo = await localStorageService.getCredentialAccounts();
    token = accountInfo.token.isNotEmpty ? accountInfo.token : '';

    final response = await http.post(
      Uri.parse("${ApplicationConstants.baseURL}/customer/update"),
      headers: getHeaders(),
      body: json.encode(request),
    );

    var model = UpdateCustomerResponse();

    if (!checkTokenExpired(response)) {
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        model = UpdateCustomerResponse.fromJson(data);

        return model;
      } else {
        return model;
      }
    } else {
      return model;
    }
  }

  Future<UpdateCustomerResponse> saveCustomer(
      SaveCustomerRequest request) async {
    var accountInfo = await localStorageService.getCredentialAccounts();
    token = accountInfo.token.isNotEmpty ? accountInfo.token : '';

    final response = await http.post(
      Uri.parse("${ApplicationConstants.baseURL}/customer/save"),
      headers: getHeaders(),
      body: json.encode(request),
    );

    var model = UpdateCustomerResponse();

    if (!checkTokenExpired(response)) {
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        model = UpdateCustomerResponse.fromJson(data);

        return model;
      } else {
        return model;
      }
    } else {
      return model;
    }
  }

  Future<SaveCustomerRequest> getCustomerByGuid(String guid) async {
    var accountInfo = await localStorageService.getCredentialAccounts();
    token = accountInfo.token.isNotEmpty ? accountInfo.token : '';

    final response = await http.get(
      Uri.parse("${ApplicationConstants.baseURL}/customer/getbyguid/$guid"),
      headers: getHeaders(),
    );

    var model = SaveCustomerRequest();

    if (!checkTokenExpired(response)) {
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        model = SaveCustomerRequest.fromJson(data);

        return model;
      } else {
        return model;
      }
    } else {
      return model;
    }
  }

  Future<List<GetAllCustomerGroupsResponse>> getAllCustomerGroups() async {
    var accountInfo = await localStorageService.getCredentialAccounts();
    token = accountInfo.token.isNotEmpty ? accountInfo.token : '';

    final response = await http.get(
      Uri.parse(
          "${ApplicationConstants.baseURL}/customerGroup/getAllCustomerGroup"),
      headers: getHeaders(),
    );

    var model = <GetAllCustomerGroupsResponse>[];

    if (!checkTokenExpired(response)) {
      if (response.statusCode == 200) {
        Iterable list = json.decode(response.body);
        model =
            list.map((e) => GetAllCustomerGroupsResponse.fromJson(e)).toList();

        return model;
      } else {
        return model;
      }
    } else {
      return model;
    }
  }

  Future<List<GetAllProductsResponse>> getAllProducts(
      GetAllProductsRequest request) async {
    var accountInfo = await localStorageService.getCredentialAccounts();
    token = accountInfo.token.isNotEmpty ? accountInfo.token : '';

    final response = await http.post(
      Uri.parse("${ApplicationConstants.baseURL}/product/getAllProducts"),
      headers: getHeaders(),
      body: json.encode(request),
    );

    var model = <GetAllProductsResponse>[];

    if (!checkTokenExpired(response)) {
      if (response.statusCode == 200) {
        Iterable list = json.decode(response.body);
        model = list.map((e) => GetAllProductsResponse.fromJson(e)).toList();

        return model;
      } else {
        return model;
      }
    } else {
      return model;
    }
  }

  Future<UpdatePatientStatusResponse> updatePatientStatus(
      UpdatePatientStatusRequest request) async {
    var accountInfo = await localStorageService.getCredentialAccounts();
    token = accountInfo.token.isNotEmpty ? accountInfo.token : '';

    final response = await http.post(
      Uri.parse("${ApplicationConstants.baseURL}/patient/update"),
      headers: getHeaders(),
      body: json.encode(request),
    );

    var model = UpdatePatientStatusResponse();

    if (!checkTokenExpired(response)) {
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        model = UpdatePatientStatusResponse.fromJson(data);

        return model;
      } else {
        return model;
      }
    } else {
      return model;
    }
  }
  Future<updateResponse> updateHayvan(
      updateRequest request) async {
    var accountInfo = await localStorageService.getCredentialAccounts();
    token = accountInfo.token.isNotEmpty ? accountInfo.token : '';

    final response = await http.post(
      Uri.parse("${ApplicationConstants.baseURL}/patient/update"),
      headers: getHeaders(),
      body: json.encode(request),
    );

    var model = updateResponse();

    if (!checkTokenExpired(response)) {
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        model = updateResponse.fromJson(data);

        return model;
      } else {
        return model;
      }
    } else {
      return model;
    }
  }
  



Future<List<depohak>> getdepoturu() async {
  var accountInfo = await localStorageService.getCredentialAccounts();
  token = accountInfo.token.isNotEmpty ? accountInfo.token : '';

  final response = await http.get(
    Uri.parse("${ApplicationConstants.baseURL}/warehouse/getAllCompany/1"),
    headers: getHeaders(),
  );

  var model = <depohak>[];

  if (!checkTokenExpired(response)) {
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data is List && data.isNotEmpty) {
        data = data.first;
      }

        Iterable list = json.decode(response.body);
        model = list.map((e) => depohak.fromJson(e)).toList();

      return model;
    } else {
      return model;
    }
  } else {
    return model;
  }
}



  Future<SavePatientResponse> getPatientByGuid(
      String customerGuid, String patientGuid) async {
    var accountInfo = await localStorageService.getCredentialAccounts();
    token = accountInfo.token.isNotEmpty ? accountInfo.token : '';

    final response = await http.get(
      Uri.parse(
          "${ApplicationConstants.baseURL}/patient/getByGuid/$patientGuid/$customerGuid"),
      headers: getHeaders(),
    );

    var model = SavePatientResponse();

    if (!checkTokenExpired(response)) {
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        model = SavePatientResponse.fromJson(data);

        return model;
      } else {
        return model;
      }
    } else {
      return model;
    }
  }
    Future<List<salessearchresponse>> getSalesResponse(SearchSellinRequest request) async {
  var accountInfo = await localStorageService.getCredentialAccounts();
  token = accountInfo.token.isNotEmpty ? accountInfo.token : '';

  final response = await http.post(
    Uri.parse("${ApplicationConstants.baseURL}/Document/salesSearch"),
    headers: getHeaders(),
       body: json.encode(request),
  );

  var model = <salessearchresponse>[];

  if (!checkTokenExpired(response)) {
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data is List && data.isNotEmpty) {
        data = data.first;
      }

        Iterable list = json.decode(response.body);
        model = list.map((e) => salessearchresponse.fromJson(e)).toList();

      return model;
    } else {
      return model;
    }
  } else {
    return model;
  }
}

  Future<SavePatientResponse> savePatient(SavePatientResponse request) async {
    var accountInfo = await localStorageService.getCredentialAccounts();
    token = accountInfo.token.isNotEmpty ? accountInfo.token : '';

    final response = await http.post(
      Uri.parse("${ApplicationConstants.baseURL}/patient/save"),
      headers: getHeaders(),
      body: json.encode(request),
    );

    var model = SavePatientResponse();

    if (!checkTokenExpired(response)) {
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        model = SavePatientResponse.fromJson(data);

        return model;
      } else {
        return model;
      }
    } else {
      return model;
    }
  }

  Future<SavePatientResponse> updatePatient(SavePatientResponse request) async {
    var accountInfo = await localStorageService.getCredentialAccounts();
    token = accountInfo.token.isNotEmpty ? accountInfo.token : '';

    final response = await http.post(
      Uri.parse("${ApplicationConstants.baseURL}/patient/update"),
      headers: getHeaders(),
      body: json.encode(request),
    );

    var model = SavePatientResponse();

    if (!checkTokenExpired(response)) {
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        model = SavePatientResponse.fromJson(data);

        return model;
      } else {
        return model;
      }
    } else {
      return model;
    }
  }

 Future<Warecategoryval> Warecategory(int productId, int selectedDepoAdi ) async {
  var accountInfo = await localStorageService.getCredentialAccounts();
  token = accountInfo.token.isNotEmpty ? accountInfo.token : '';

  final response = await http.get(
    Uri.parse("${ApplicationConstants.baseURL}/stockdefination/getProductWarehouseStock/$productId/$selectedDepoAdi/0"),
    headers: getHeaders(),
  );

  if (!checkTokenExpired(response)) {
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var model = Warecategoryval.fromJson(data);
      return model;
    } else {
    }
  } 
}

 Future<MoneyDasboards> Moneyhesap() async {
  var accountInfo = await localStorageService.getCredentialAccounts();
  token = accountInfo.token.isNotEmpty ? accountInfo.token : '';

  final response = await http.get(
    Uri.parse("${ApplicationConstants.baseURL}/dashboard/getDashboards"),
    headers: getHeaders(),
  );

  if (!checkTokenExpired(response)) {
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var model = MoneyDasboards.fromJson(data);
      return model;
    } else {
    }
  } 
}
  
  Future<List<GetAllColorResponse>> getAllColor() async {
    var accountInfo = await localStorageService.getCredentialAccounts();
    token = accountInfo.token.isNotEmpty ? accountInfo.token : '';

    final response = await http.get(
      Uri.parse("${ApplicationConstants.baseURL}/Color/GetAllColor"),
      headers: getHeaders(),
    );

    var model = <GetAllColorResponse>[];

    if (!checkTokenExpired(response)) {
      if (response.statusCode == 200) {
        Iterable list = json.decode(response.body);
        model = list.map((e) => GetAllColorResponse.fromJson(e)).toList();

        return model;
      } else {
        return model;
      }
    } else {
      return model;
    }
  }

  Future<List<GetAllPatientTypeResponse>> getAllPatientType() async {
    var accountInfo = await localStorageService.getCredentialAccounts();
    token = accountInfo.token.isNotEmpty ? accountInfo.token : '';

    final response = await http.get(
      Uri.parse("${ApplicationConstants.baseURL}/patienttype/getall"),
      headers: getHeaders(),
    );

    var model = <GetAllPatientTypeResponse>[];

    if (!checkTokenExpired(response)) {
      if (response.statusCode == 200) {
        Iterable list = json.decode(response.body);
        model = list.map((e) => GetAllPatientTypeResponse.fromJson(e)).toList();

        return model;
      } else {
        return model;
      }
    } else {
      return model;
    }
  }

  Future<List<GetSpeciesByIdResponse>> getSpeciesById(int idSpecies) async {
    var accountInfo = await localStorageService.getCredentialAccounts();
    token = accountInfo.token.isNotEmpty ? accountInfo.token : '';

    final response = await http.get(
      Uri.parse(
          "${ApplicationConstants.baseURL}/species/getbyidtype/$idSpecies"),
      headers: getHeaders(),
    );

    var model = <GetSpeciesByIdResponse>[];

    if (!checkTokenExpired(response)) {
      if (response.statusCode == 200) {
        Iterable list = json.decode(response.body);
        model = list.map((e) => GetSpeciesByIdResponse.fromJson(e)).toList();

        return model;
      } else {
        return model;
      }
    } else {
      return model;
    }
  }
  Future<List<GethavewareResponse>> gethavedepo(int idproducts)async {
    var accountInfo = await localStorageService.getCredentialAccounts();
    token = accountInfo.token.isNotEmpty ? accountInfo.token : '';

    final response = await http.get(
      Uri.parse(
          "${ApplicationConstants.baseURL}/product/getProductWarehouses/$idproducts"),
      headers: getHeaders(),
    );

    var model = <GethavewareResponse>[];

    if (!checkTokenExpired(response)) {
      if (response.statusCode == 200) {
        Iterable list = json.decode(response.body);
        model = list.map((e) => GethavewareResponse.fromJson(e)).toList();

        return model;
      } else {
        return model;
      }
    } else {
      return model;
    }
  }

  Future<List<GetAppointmentByIdPatientResponse>> getAppointmentByIdPatient(
      int idPatient, int appointmentStatus, int idCustomer) async {
    var accountInfo = await localStorageService.getCredentialAccounts();
    token = accountInfo.token.isNotEmpty ? accountInfo.token : '';

    final response = await http.get(
      Uri.parse(
          "${ApplicationConstants.baseURL}/appointment/GetAppointmentByIdPatient/$idPatient/$appointmentStatus/$idCustomer"),
      headers: getHeaders(),
    );

    var model = <GetAppointmentByIdPatientResponse>[];

    if (!checkTokenExpired(response)) {
      if (response.statusCode == 200) {
        Iterable list = json.decode(response.body);
        model = list
            .map((e) => GetAppointmentByIdPatientResponse.fromJson(e))
            .toList();

        return model;
      } else {
        return model;
      }
    } else {
      return model;
    }
  }

  Future<SaveAppointmentResponse> saveAppointment(
      SaveAppointmentRequest request) async {
    var accountInfo = await localStorageService.getCredentialAccounts();
    token = accountInfo.token.isNotEmpty ? accountInfo.token : '';

    final response = await http.post(
      Uri.parse("${ApplicationConstants.baseURL}/appointment/save"),
      headers: getHeaders(),
      body: json.encode(request),
    );

    var model = SaveAppointmentResponse();

    if (!checkTokenExpired(response)) {
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        model = SaveAppointmentResponse.fromJson(data);

        return model;
      } else {
        return model;
      }
    } else {
      return model;
    }
  }
   

  Future<UpdateAdmissionStatusResponse> updateAdmissionStatus(
      UpdateAdmissionStatusRequest request) async {
    var accountInfo = await localStorageService.getCredentialAccounts();
    token = accountInfo.token.isNotEmpty ? accountInfo.token : '';

    final response = await http.post(
      Uri.parse(
          "${ApplicationConstants.baseURL}/appointment/updateAddmissionStatus"),
      headers: getHeaders(),
      body: json.encode(request),
    );

    var model = UpdateAdmissionStatusResponse();

    if (!checkTokenExpired(response)) {
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        model = UpdateAdmissionStatusResponse.fromJson(data);

        return model;
      } else {
        return model;
      }
    } else {
      return model;
    }
  }

  Future<List<GetProductVaccineResponse>> getProductVaccine() async {
    var accountInfo = await localStorageService.getCredentialAccounts();
    token = accountInfo.token.isNotEmpty ? accountInfo.token : '';

    final response = await http.get(
      Uri.parse("${ApplicationConstants.baseURL}/product/getProductVaccine/7"),
      headers: getHeaders(),
    );

    var model = <GetProductVaccineResponse>[];

    if (!checkTokenExpired(response)) {
      if (response.statusCode == 200) {
        Iterable list = json.decode(response.body);
        model = list.map((e) => GetProductVaccineResponse.fromJson(e)).toList();

        return model;
      } else {
        return model;
      }
    } else {
      return model;
    }
  }

  Future<UpdateAppointmentInfoResponse> updateAppointmentInfo(
      UpdateAppointmentInfoRequest request) async {
    var accountInfo = await localStorageService.getCredentialAccounts();
    token = accountInfo.token.isNotEmpty ? accountInfo.token : '';

    final response = await http.post(
      Uri.parse(
          "${ApplicationConstants.baseURL}/appointment/UpdateAppointmentInformation"),
      headers: getHeaders(),
      body: json.encode(request),
    );

    var model = UpdateAppointmentInfoResponse();

    if (!checkTokenExpired(response)) {
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        model = UpdateAppointmentInfoResponse.fromJson(data);

        return model;
      } else {
        return model;
      }
    } else {
      return model;
    }
  }
 

  Future<GetDashboardsResponse> getDashboards() async {
    var accountInfo = await localStorageService.getCredentialAccounts();
    token = accountInfo.token.isNotEmpty ? accountInfo.token : '';

    final response = await http.get(
      Uri.parse("${ApplicationConstants.baseURL}/dashboard/getDashboards"),
      headers: getHeaders(),
    );

    var model = GetDashboardsResponse();

    if (!checkTokenExpired(response)) {
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        model = GetDashboardsResponse.fromJson(data);

        return model;
      } else {
        return model;
      }
    } else {
      return model;
    }
  }

  Future<List<GetDashboardsAppointmentsResponse>>
      getMoreDashboardsAppointments() async {
    var accountInfo = await localStorageService.getCredentialAccounts();
    token = accountInfo.token.isNotEmpty ? accountInfo.token : '';

    final response = await http.get(
      Uri.parse(
          "${ApplicationConstants.baseURL}/dashboard/getDashboardsAppointments/${accountInfo.idCompany}/-1"),
      headers: getHeaders(),
    );

    var model = <GetDashboardsAppointmentsResponse>[];

    if (!checkTokenExpired(response)) {
      if (response.statusCode == 200) {
        Iterable list = json.decode(response.body);
        model = list
            .map((e) => GetDashboardsAppointmentsResponse.fromJson(e))
            .toList();

        return model;
      } else {
        return model;
      }
    } else {
      return model;
    }
  }
   Future<List<Bilanco>>
      bilancoResponse() async {
    var accountInfo = await localStorageService.getCredentialAccounts();
    token = accountInfo.token.isNotEmpty ? accountInfo.token : '';

    final response = await http.get(
      Uri.parse(
          "${ApplicationConstants.baseURL}/dashboard/getPatientGraphic"),
      headers: getHeaders(),
    );

    var model = <Bilanco>[];

    if (!checkTokenExpired(response)) {
      if (response.statusCode == 200) {
        Iterable list = json.decode(response.body);
        model = list
            .map((e) => Bilanco.fromJson(e))
            .toList();

        return model;
      } else {
        return model;
      }
    } else {
      return model;
    }
  }

  Future<List<SearchCalendarResponse>> getSearchCalendarResults() async {
    var accountInfo = await localStorageService.getCredentialAccounts();
    token = accountInfo.token.isNotEmpty ? accountInfo.token : '';

    // API'nin beklediği JSON formatına uygun gövde
    var requestBody = {
      "idAddmisionType": 2,
      "idStatus": 2,
      "idCustomer": null,
      "dtFrom": "2023-11-27T00:00:00.000Z",
      "dtTo": "2024-01-08T00:00:00.000Z",
    };

    final response = await http.post(
      Uri.parse("${ApplicationConstants.baseURL}/appointment/searchCalendar/"),
      headers: getHeaders(),
      body: json.encode(requestBody), // JSON gövdeyi encode et
    );

    if (response.statusCode == 200) {
      // Başarılı cevap alındı, JSON'ı parse et ve işle
      var data = json.decode(response.body);
      var modelList = (data as List<dynamic>)
          .map((item) => SearchCalendarResponse.fromJson(item))
          .toList();

      return modelList;
    } else {
      // Başarısız bir cevap alındı, hata işleme
      print("Request failed with status: ${response.statusCode}");
      return <SearchCalendarResponse>[]; // veya null, hata durumuna göre
    }
  }

  Future<CompanyDataResponse> getById() async {
    var accountInfo = await localStorageService.getCredentialAccounts();
    token = accountInfo.token;

    final response = await http.get(
      Uri.parse("${ApplicationConstants.baseURL}/company/getById"),
      headers: getHeaders(),
    );

    if (!checkTokenExpired(response)) {
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var model = CompanyDataResponse.fromJson(data);
        return model;
      } else {
        // Hata durumunu işle
        print("API request failed with status code: ${response.statusCode}");
        print("Error message: ${response.body}");
        return null;
      }
    } else {
      // Token kontrolü yap
      print("Token expired or invalid.");
      return null;
    }
  }
  Future<List<Waredata>> waredatasettings(dynamic depoguid)async {
    var accountInfo = await localStorageService.getCredentialAccounts();
    token = accountInfo.token.isNotEmpty ? accountInfo.token : '';

    final response = await http.get(
      Uri.parse(
          "${ApplicationConstants.baseURL}/warehouse/getWarehouseProductsStockInventory/$depoguid"),
      headers: getHeaders(),
    );

    var model = <Waredata>[];

    if (!checkTokenExpired(response)) {
      if (response.statusCode == 200) {
        Iterable list = json.decode(response.body);
        model = list
            .map((e) => Waredata.fromJson(e))
            .toList();

        return model;
      } else {
        return model;
      }
    } else {
      return model;
    }
  }
  


  
}
