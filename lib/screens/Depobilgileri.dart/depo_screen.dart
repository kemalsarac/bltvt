import 'package:bltvt_mobile_veterinary/data/responses/waredata_response.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_widget.dart';
import 'package:bltvt_mobile_veterinary/screens/products/products_detail_view_model.dart';
import 'package:bltvt_mobile_veterinary/services/general_api_service.dart';
import 'package:bltvt_mobile_veterinary/utils/colors.dart';
import 'package:bltvt_mobile_veterinary/utils/custom_style.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class DepoScreen extends StatefulWidget {
  final String dsGuidId;

  const DepoScreen(this.dsGuidId, {Key key}) : super(key: key);

  @override
  State<DepoScreen> createState() => _DepoScreenState();
}

class _DepoScreenState extends State<DepoScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<Productdetailscreenviewmodel>(
      viewModelBuilder: (p0) => Productdetailscreenviewmodel(widget.dsGuidId),
      builder: (context, vm) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Depo içi"),
            backgroundColor: CustomColor.primaryColor,
            centerTitle: true,
            flexibleSpace: Image(
              image: AssetImage("assets/images/appbar.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          body: LazyLoadScrollView(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 10.0,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Ürün Adı'),
              Text('Stok adet'),
              Text('Stok maliyet'),
            ],
          ),
        ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ListView.separated(
                                              shrinkWrap: true,
                                              separatorBuilder:
                                                  (context, index) =>
                                                      SizedBox(height: 10),
                                              itemCount: vm.warebilgi.length,
                                              itemBuilder: (context, index) =>
                                                  Center(
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary:
                                                        CustomColor.accentColor,
                                                    onPrimary: Colors.white,
                                                    padding: EdgeInsets.all(20),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    side: BorderSide(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  child: Container(
                                                    width: double.infinity,
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Text(
                                                          '${vm.warebilgi[index]}',
                                                          style: CustomStyle
                                                              .defaultStyle,
                                                          textAlign:
                                                              TextAlign.left,
                                                        ),
                                                        Text(
                                                          '${vm.warestock[index]}',
                                                          style: CustomStyle
                                                              .defaultStyle,
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        Text(
                                                          '${vm.waretotal[index]}' + "₺",
                                                          style: CustomStyle
                                                              .defaultStyle,
                                                          textAlign:
                                                              TextAlign.right,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
