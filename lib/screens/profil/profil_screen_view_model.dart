import 'package:bltvt_mobile_veterinary/data/responses/company_data_response.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_view_model.dart';
import 'package:bltvt_mobile_veterinary/services/general_api_service.dart';

CompanyDataResponse companydata;

 
class Profilscreenviewmodel extends BaseViewModel {
  @override
  void init() async {
    companydata = await apiService.getById();

    
  }
}

