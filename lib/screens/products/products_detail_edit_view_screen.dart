/* import 'dart:async';

import 'package:bltvt_mobile_veterinary/data/requests/save_customer_request.dart';
import 'package:bltvt_mobile_veterinary/data/requests/update_product_request.dart';
import 'package:bltvt_mobile_veterinary/data/requests/update_request.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_product_vaccine_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/save_patient_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/update_product_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/updatedepo_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/warehouses_response.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_view_model.dart';
import 'package:bltvt_mobile_veterinary/services/general_api_service.dart';
import 'package:flutter/material.dart';

class ProductdetaileditviewScreen extends BaseViewModel{
  UpdateProductRequest urun = UpdateProductRequest();
  String proguid ; 
  ProductdetaileditviewScreen(this.proguid, { key}) : super(key: key);
  @override
  FutureOr<void> init() async {
       if (proguid == '') {
     urun = UpdateProductRequest();
     urun.mtPriceBuying= 0;
    } else {
      print("hata! hata! hata!");
    }
   

    
  }
Future< UpdateProductResponse> updateProsuctStatus() async {
   

    UpdateProductResponse saveurun;
    if (proguid == '') {
      saveurun = await apiService.updateProsuctStatus(urun);
    } else {
      saveurun = await apiService.updateProsuctStatus(urun);
    }
    return saveurun;
  }
}
*/