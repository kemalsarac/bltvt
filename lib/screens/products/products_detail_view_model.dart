import 'dart:async';
import 'package:bltvt_mobile_veterinary/data/requests/get_all_products_request.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_view_model.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_all_products_response.dart';
import 'package:bltvt_mobile_veterinary/screens/products/products_detail_screen.dart';
import 'package:bltvt_mobile_veterinary/services/general_api_service.dart';
import 'package:flutter/material.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_product_vaccine_response.dart';

class Productdetailscreen extends BaseViewModel {
 
 List<GetProductVaccineResponse> vaccineDetail;
 

  @override
  FutureOr<void> init() async {
    vaccineDetail = await apiService.getProductVaccine();
    
  }
 
}
