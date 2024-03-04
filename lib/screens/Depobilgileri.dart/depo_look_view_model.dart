import 'dart:async';

import 'package:bltvt_mobile_veterinary/data/responses/depohak_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_all_products_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/gethavedepo_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/waredata_response.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_view_model.dart';
import 'package:bltvt_mobile_veterinary/services/general_api_service.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_product_vaccine_response.dart';

import 'package:flutter/material.dart';
class DepoLookScreenviewmodel extends BaseViewModel {
  String selectedwarehousesType1 = "stokcikis";
  String selectedware;
  int idproducts;
  GetAllProductsResponse productDetail;
  dynamic depoguid;
  List<String> depopList = []; 
  List<depohak> depoTuru; 
  List<GetProductVaccineResponse> vaccineDetail;
  List<GethavewareResponse> havedepo = [];
  List<Waredata> warecontens; 
  List<String> warebilgi = []; 
  List<dynamic> warestock = [];
 
    List<dynamic> waretotal = [];

  DepoLookScreenviewmodel({ key}) : super(key: key) ;
 
  void addToDepoList(String newValue) {
    depopList.add(newValue);
  }

  @override
  FutureOr<void> init() async {
    havedepo = await apiService.gethavedepo(idproducts);
    depoTuru = await apiService.getdepoturu();
    
    for (var element in depoTuru) {
      depopList.add(element.dsWarehouse);
    }
     if (depoguid != null) {
      warecontens = await apiService.waredatasettings(depoguid);
      
      warebilgi.addAll(warecontens.map((element) => element.dsProduct));
      waretotal.addAll(warecontens.map((element) => element.mtTotal.toInt()));
      warestock.addAll(warecontens.map((element) => element.mtStockCount.toInt()));


    } else {
    }
    
  }
}
