import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'products_detail_view_model.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_all_products_response.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_widget.dart';
import 'package:bltvt_mobile_veterinary/utils/colors.dart';
import 'package:bltvt_mobile_veterinary/utils/custom_style.dart';
import 'package:bltvt_mobile_veterinary/utils/dimensions.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductDetailScreen extends StatefulWidget {
  GetAllProductsResponse productDetail;

  ProductDetailScreen(this.productDetail, {Key key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BaseWidget<Productdetailscreen>(
      viewModelBuilder: (p0) => Productdetailscreen(),
      builder: (context, vm) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Ürün Detayı"),
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
                          Icons.warehouse,
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
                              "Ürün Adı",
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
                              widget.productDetail.dsProduct ?? "",
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
                              widget.productDetail.dsProductSmsName ?? "",
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
                              "Ürün Barkodu",
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
                              widget.productDetail.dsBarcode ?? "",
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
                              widget.productDetail.dtExpiration ??
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
                              widget.productDetail.mtCriticalStockCount
                                          .toString() ==
                                      "null"
                                  ? "0"
                                  : widget.productDetail.mtCriticalStockCount
                                              .toString()
                                              .split(".")
                                              .last ==
                                          "0"
                                      ? widget.productDetail
                                              .mtCriticalStockCount
                                              .toString()
                                              .split(".")
                                              .first +
                                          " ₺"
                                      : widget.productDetail
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
                               "%" + widget.productDetail.mtTaxRate.toString()  ?? "",
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
                              widget.productDetail.mtPrice.toString() == "null"
                                  ? "0"
                                  : widget.productDetail.mtPrice
                                              .toString()
                                              .split(".")
                                              .last ==
                                          "0"
                                      ? widget.productDetail.mtPrice
                                              .toString()
                                              .split(".")
                                              .first +
                                          " ₺"
                                      : widget.productDetail.mtPrice
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
                              widget.productDetail.mtPriceBuying.toString() ==
                                      "null"
                                  ? "0"
                                  : widget.productDetail.mtPrice
                                              .toString()
                                              .split(".")
                                              .last ==
                                          "0"
                                      ? widget.productDetail.mtPriceBuying
                                              .toString()
                                              .split(".")
                                              .first +
                                          " ₺"
                                      : widget.productDetail.mtPriceBuying
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
                              widget.productDetail.dtExpiration ?? "dsunitlong",
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
                              widget.productDetail.dbStatus == true
                                  ? "Aktif"
                                  : widget.productDetail.dbStatus == false
                                      ? "Pasif"
                                      : "null",
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
