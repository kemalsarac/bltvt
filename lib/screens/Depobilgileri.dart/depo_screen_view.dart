
import 'dart:async';

import 'package:bltvt_mobile_veterinary/data/responses/depohak_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/waredata_response.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_view_model.dart';
import 'package:bltvt_mobile_veterinary/services/general_api_service.dart';

class depodetailscreenviewmodel extends BaseViewModel {
  dynamic depoguid;
  List<String> depopList = []; 
  List<depohak> depoTuru; 
  List<Waredata> warecontens; 
  List<String> warebilgi = []; 
  List<dynamic> warestock = [];
 
    List<dynamic> waretotal = [];

 depodetailscreenviewmodel(this.depoguid,{ key}) : super(key: key) ;
 
  void addToDepoList(String newValue) {
    depopList.add(newValue);
  }

  @override
  FutureOr<void> init() async {
    
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
