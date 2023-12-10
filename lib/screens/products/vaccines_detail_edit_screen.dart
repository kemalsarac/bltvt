/*
import 'package:bltvt_mobile_veterinary/data/responses/get_all_products_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_product_vaccine_response.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_widget.dart';
import 'package:bltvt_mobile_veterinary/screens/products/vaccines_detail_edit_view_model.dart';
import 'package:bltvt_mobile_veterinary/screens/products/vaccines_detail_screen.dart';
import 'package:bltvt_mobile_veterinary/utils/colors.dart';
import 'package:bltvt_mobile_veterinary/utils/custom_style.dart';
import 'package:bltvt_mobile_veterinary/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: must_be_immutable
class VaccinesDetaileditScreen extends StatefulWidget {
  GetAllProductsResponse vaccineDetail;

  VaccinesDetaileditScreen(this.vaccineDetail, {Key key}) : super(key: key);

  @override
  State<VaccinesDetaileditScreen> createState() =>
      _VaccinesDetaileditScreenState();
}

class _VaccinesDetaileditScreenState extends State<VaccinesDetaileditScreen> {
  ScrollController scrollController = ScrollController();
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BaseWidget<Vaccinesdetaileditview>(
      viewModelBuilder: (p0) => Vaccinesdetaileditview(),
      builder: (context, vm) {
        return DefaultTabController(
            length: 3,
            initialIndex: 0,
            child: Form(
                key: _keyForm,
                child: Scaffold(
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerFloat,
                  floatingActionButton:
                      FloatingActionButton.extended(onPressed: () async {
                    var flValid = _keyForm.currentState.validate();
                    if (widget.vaccineDetail.dsProduct == null)
                      widget.vaccineDetail.dsProduct = '';

                    if (widget.vaccineDetail.dsProductSmsName == null)
                      widget.vaccineDetail.dsProductSmsName = '';

                    if (widget.vaccineDetail.dsProductCode == null)
                      widget.vaccineDetail.dsProductCode = '';

                    if (widget.vaccineDetail.dtExpiration == null)
                      widget.vaccineDetail.dtExpiration = '';

                    if (widget.vaccineDetail.mtCriticalStockCount == null)
                      widget.vaccineDetail.mtCriticalStockCount = '' as int;

                    if (widget.vaccineDetail.mtTaxRate == null)
                      widget.vaccineDetail.mtTaxRate = '' as int;

                    if (widget.vaccineDetail.mtPriceBuying == null)
                      widget.vaccineDetail.mtPriceBuying = '' as double;
                    if (widget.vaccineDetail.mtPrice == null)
                      widget.vaccineDetail.mtPrice = '' as double;

                    var result = GetProductVaccineResponse();
                     if (flValid) {
                    if (widget.vaccineDetail == '') {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => VaccinesDetailScreen('', '',
                              widget.vaccineDetail.idProduct, widget.vaccineDetail, true),
                        ),
                      );
                    } else {
                      result = await vm.vaccineDetail;

                      if (result.dsGuidId != null) {
                        Fluttertoast.showToast(
                          msg: "Müşteri kaydedildi",
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 20,
                          toastLength: Toast.LENGTH_LONG,
                        );

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CustomerProfileScreen(guid)));
                      } else {
                        for (var element in result.messageList) {
                          Fluttertoast.showToast(
                            msg: element.message,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 20,
                            toastLength: Toast.LENGTH_LONG,
                          );
                        }
                      }
                    }
                    vm.refreshState();
                  } else {
                    Fluttertoast.showToast(
                      msg: "Lütfen Eksik Bilgileri Doldurunuz!",
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 20,
                      toastLength: Toast.LENGTH_LONG,
                    );
                  }
                    
                  }),
                )));
      },
    );
  }
}
*/