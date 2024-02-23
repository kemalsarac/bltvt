import 'dart:async';
import 'package:bltvt_mobile_veterinary/data/responses/depohak_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_all_products_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/warecategoryval_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/warehouses_transferesponse.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_view_model.dart';
import 'package:bltvt_mobile_veterinary/services/general_api_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../data/requests/get_all_products_request.dart';
class WarehouseTransferViewModel extends BaseViewModel {
  WarehouseTransferResponse transferware = WarehouseTransferResponse();
  
  String selectedwarehousesType1;
  int selectedDepoAdi;
  int productId;
  String warehouseGuid;
  double warecategoMtpiece;
  String selectedwarehousesType2;
  List<String> depopList = [];
  String dsWarehouse = '';
  List<depohak> depoTuru;
  GetAllProductsResponse Productkod;
  Warecategoryval warecatego;

  WarehouseTransferViewModel(this.Productkod, this.selectedDepoAdi) {
    productId = Productkod.idProduct;
   
  }

  @override
FutureOr<void> init() async {
  depoTuru = await apiService.getdepoturu();
 

  for (var element in depoTuru) {
    depopList.add(element.dsWarehouse);
  }

  if (depoTuru.isNotEmpty) {
    selectedwarehousesType1 = depoTuru.first.dsGuidId.toString();
    selectedDepoAdi = depoTuru.first.idWarehouse;
    await updateWarecategory();
  }
  if (productId == '' && selectedDepoAdi == '') {
    print("geçersiz !!!");
  }
  else {
    transferware = await apiService.stocktransferware();

  }
}

 Future<void> updateWarecategory() async {
    
    warecatego = await apiService.Warecategory(productId, selectedDepoAdi);
    warecategoMtpiece = warecatego.mtPieces ?? 0;
    refreshState();
  }


  

}
