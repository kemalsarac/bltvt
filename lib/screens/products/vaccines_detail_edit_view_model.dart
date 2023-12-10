/*
import 'dart:async';
import 'package:bltvt_mobile_veterinary/data/responses/get_all_products_response.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_view_model.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_product_vaccine_response.dart';
import 'package:bltvt_mobile_veterinary/services/general_api_service.dart';

class Vaccinesdetaileditview extends BaseViewModel {

  GetAllProductsResponse vaccineDetail;
  @override
  FutureOr<void> init() async {}

   Future<GetProductVaccineResponse> saveProduct() async {
   

    GetProductVaccineResponse vaccineDetail;
    if (vaccineDetail == '') {
      vaccineDetail = (await apiService.getProductVaccine()) as GetProductVaccineResponse;
    } 
    
    return vaccineDetail;
  }
}
*/