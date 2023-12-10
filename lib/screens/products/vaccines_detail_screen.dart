import 'package:bltvt_mobile_veterinary/data/responses/get_all_products_response.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_widget.dart';
import 'package:bltvt_mobile_veterinary/screens/products/vaccines_detail_view_model.dart';
import 'package:bltvt_mobile_veterinary/utils/colors.dart';
import 'package:bltvt_mobile_veterinary/utils/custom_style.dart';
import 'package:bltvt_mobile_veterinary/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

// ignore: must_be_immutable
class VaccinesDetailScreen extends StatefulWidget {
  GetAllProductsResponse vaccineDetail;

  VaccinesDetailScreen(this.vaccineDetail, {Key key}) : super(key: key);

  @override
  State<VaccinesDetailScreen> createState() => _VaccinesDetailScreenState();
}

class _VaccinesDetailScreenState extends State<VaccinesDetailScreen> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BaseWidget<Vaccinesdetailview>(
      viewModelBuilder: (p0) => Vaccinesdetailview(),
      builder: (context, vm) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Aşı Detayı"),
            backgroundColor: CustomColor.primaryColor,
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(Dimensions.defaultPaddingSize),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              controller: scrollController,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        padding: EdgeInsets.all(1.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[200],
                        ),
                        child: Icon(
                          Icons.vaccines_rounded,
                          color: CustomColor.primaryColor,
                          size: 54,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Aşı Adı",
                              style: CustomStyle.kTitleStyle,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              child: Divider(
                                color: CustomColor.lightGreyColorForDivider,
                                thickness: 2,
                              ),
                            ),
                            Text(
                              widget.vaccineDetail.dsProduct ?? "",
                              style: CustomStyle.defaultStyle,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Sms ismi",
                              style: CustomStyle.kTitleStyle,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              child: Divider(
                                color: CustomColor.lightGreyColorForDivider,
                                thickness: 2,
                              ),
                            ),
                            Text(
                              widget.vaccineDetail.dsProductSmsName ?? "dsproductsms",
                              style: CustomStyle.defaultStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Aşı Barkodu",
                              style: CustomStyle.kTitleStyle,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              child: Divider(
                                color: CustomColor.lightGreyColorForDivider,
                                thickness: 2,
                              ),
                            ),
                            Text(
                              widget.vaccineDetail.dsBarcode ?? "",
                              style: CustomStyle.defaultStyle,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "SKT",
                              style: CustomStyle.kTitleStyle,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              child: Divider(
                                color: CustomColor.lightGreyColorForDivider,
                                thickness: 2,
                              ),
                            ),
                            Text(
                              widget.vaccineDetail.dtExpiration ??
                                  "SKT Giriniz",
                              style: CustomStyle.defaultStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Kritik Stok",
                              style: CustomStyle.kTitleStyle,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              child: Divider(
                                color: CustomColor.lightGreyColorForDivider,
                                thickness: 2,
                              ),
                            ),
                            Text(
                              widget.vaccineDetail.mtCriticalStockCount
                                          .toString() ==
                                      "null"
                                  ? "0"
                                  : widget.vaccineDetail.mtCriticalStockCount
                                              .toString()
                                              .split(".")
                                              .last ==
                                          "0"
                                      ? widget.vaccineDetail
                                              .mtCriticalStockCount
                                              .toString()
                                              .split(".")
                                              .first +
                                          " ₺"
                                      : widget.vaccineDetail
                                              .mtCriticalStockCount
                                              .toString() +
                                          "₺",
                              style: CustomStyle.defaultStyle,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Vergi",
                              style: CustomStyle.kTitleStyle,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              child: Divider(
                                color: CustomColor.lightGreyColorForDivider,
                                thickness: 2,
                              ),
                            ),
                            Text(
                             "%" + widget.vaccineDetail.mtTaxRate.toString() ?? "",
                              style: CustomStyle.defaultStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Alış fiyatı",
                              style: CustomStyle.kTitleStyle,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              child: Divider(
                                color: CustomColor.lightGreyColorForDivider,
                                thickness: 2,
                              ),
                            ),
                            Text(
                              widget.vaccineDetail.mtPrice.toString() == "null"
                                  ? "0"
                                  : widget.vaccineDetail.mtPrice
                                              .toString()
                                              .split(".")
                                              .last ==
                                          "0"
                                      ? widget.vaccineDetail.mtPrice
                                              .toString()
                                              .split(".")
                                              .first +
                                          " ₺"
                                      : widget.vaccineDetail.mtPrice
                                              .toString() +
                                          "₺",
                              style: CustomStyle.defaultStyle,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Satış fiyatı",
                              style: CustomStyle.kTitleStyle,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              child: Divider(
                                color: CustomColor.lightGreyColorForDivider,
                                thickness: 2,
                              ),
                            ),
                            Text(
                              widget.vaccineDetail.mtPriceBuying.toString() ==
                                      "null"
                                  ? "0"
                                  : widget.vaccineDetail.mtPrice
                                              .toString()
                                              .split(".")
                                              .last ==
                                          "0"
                                      ? widget.vaccineDetail.mtPriceBuying
                                              .toString()
                                              .split(".")
                                              .first +
                                          " ₺"
                                      : widget.vaccineDetail.mtPriceBuying
                                              .toString() +
                                          "₺",
                              style: CustomStyle.defaultStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Birim",
                              style: CustomStyle.kTitleStyle,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              child: Divider(
                                color: CustomColor.lightGreyColorForDivider,
                                thickness: 2,
                              ),
                            ),
                            Text(
                            widget.vaccineDetail.dsProductSmsName ?? "dsunitlong",
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Kategori",
                              style: CustomStyle.kTitleStyle,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              child: Divider(
                                color: CustomColor.lightGreyColorForDivider,
                                thickness: 2,
                              ),
                            ),
                            Text(
                              widget.vaccineDetail.dsProductSmsName ?? "dsproductcategory",
                              style: CustomStyle.defaultStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                ],
              ),
            ),
          ),
           floatingActionButton: SpeedDial(
            // Ana düğme (FAB) özellikleri
            child: Icon(Icons.menu),
            backgroundColor: CustomColor.primaryColor,
            foregroundColor: Colors.white,
            elevation: 6,
            overlayColor: Colors.black,
            overlayOpacity: 0.5,
            direction: SpeedDialDirection.up,

            // Menü öğeleri
            children: [
              SpeedDialChild(
                child: Icon(Icons.edit_document),
                backgroundColor: CustomColor.accentColor,
                label: 'Düzenle',
                
                    
              ),
            ],
          ),
        );
      },
    );
  }
}
