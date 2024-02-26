import 'dart:async';
import 'package:bltvt_mobile_veterinary/data/responses/depohak_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_all_products_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/gethavedepo_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/waredata_response.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_view_model.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_product_vaccine_response.dart';
import 'package:bltvt_mobile_veterinary/services/general_api_service.dart';

class Vaccinesdetailview extends BaseViewModel {

  List<Waredata> warecontens; 
  dynamic depoguid;
  List<String> depopList = []; 
  List<String> warebilgi = []; 
  List<dynamic> warestock = [];
  String dsWarehouse= '';
    List<dynamic> waretotal = [];
  List<depohak> depoTuru; 
 int idproducts;
  List<GethavewareResponse> havedepo = [];
  GetAllProductsResponse vaccineDetail;

  Vaccinesdetailview( this.vaccineDetail, { key}) : super(key: key) ;
  @override
  FutureOr<void> init() async {
    depoTuru = await apiService.getdepoturu();
   idproducts = vaccineDetail.idProduct;
    havedepo = await apiService.gethavedepo(idproducts);
    
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

