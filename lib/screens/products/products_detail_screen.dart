
import 'package:bltvt_mobile_veterinary/data/responses/depohak_response.dart';
import 'package:bltvt_mobile_veterinary/screens/Depobilgileri.dart/depo_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/Depobilgileri.dart/depo_transfer.dart';
import 'package:bltvt_mobile_veterinary/screens/main_menu/main_menu_screen.dart';

import 'products_detail_view_model.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_all_products_response.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_widget.dart';
import 'package:bltvt_mobile_veterinary/utils/colors.dart';
import 'package:bltvt_mobile_veterinary/utils/custom_style.dart';
import 'package:bltvt_mobile_veterinary/utils/dimensions.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductDetailScreen extends StatefulWidget {
 
  String guid;
 
  GetAllProductsResponse productDetail;
  String productG = '';
  List<depohak> depotur = [];
  dynamic dsGuidId;

  final String depoguid;
  ProductDetailScreen(this.productDetail, {this.depoguid, this.guid, Key key})
      : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  Productdetailscreenviewmodel _viewModel;
  int Productkod;
  int warehousekod;
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<Productdetailscreenviewmodel>(
      viewModelBuilder: (p0) => Productdetailscreenviewmodel(
          _viewModel = Productdetailscreenviewmodel(widget.dsGuidId)),
      builder: (context, vm) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Ürün Detayı"),
            backgroundColor: CustomColor.primaryColor,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context)
                                  .push(
                                    MaterialPageRoute(
                                      builder: (context) => MainMenuScreen()
                                    ),
                                  )
                                  .then(
                                    (value) => setState(
                                      () {
                                        vm.refreshState();
                                      },
                                    ),
                                  );
              },
            ),
            flexibleSpace: Image(
              image: AssetImage("assets/images/appbar1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(Dimensions.defaultPaddingSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      const SizedBox(width: 5),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Ürün Barkod",
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
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Alış Fiyatı",
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
                              widget.productDetail.mtPrice?.toString() == "null"
                                  ? "0"
                                  : widget.productDetail.mtPriceBuying
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
                      const SizedBox(width: 5),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                              widget.productDetail.mtPriceBuying?.toString() ==
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
                  const SizedBox(height: 10),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Depolar",
                          style: CustomStyle.kTitleStyle,
                        ),
                        const SizedBox(height: 1),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ListView.separated(
                                    shrinkWrap: true,
                                    separatorBuilder: (context, index) =>
                                        SizedBox(height: 4),
                                    itemCount: vm.depopList.length,
                                    itemBuilder: (context, index) => Center(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          String depoguid =
                                              vm.depoTuru[index].dsGuidId;
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => DepoScreen(
                                                depoguid,
                                              ),
                                            ),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: CustomColor.accentColor,
                                          onPrimary: Colors.white,
                                          padding: EdgeInsets.all(20),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          side: BorderSide(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        child: Container(
                                          width: double.infinity,
                                          child: Text(
                                            vm.depopList[index].toString(),
                                            style: CustomStyle.defaultStyle,
                                            textAlign: TextAlign.center,
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
                      ]),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const SizedBox(height: 30),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red),
                              ),
                              onPressed: () => Navigator.of(context)
                                  .push(MaterialPageRoute(
                                      builder: (context) => WarehouseTransfer(
                                          widget.productDetail)))
                                  .then((value) => setState(() {
                                        vm.refreshState();
                                      })),
                              /* onPressed: () => Navigator.of(context)
                                  .push(
                                    MaterialPageRoute(
                                      builder: (context) => WarehouseTransfer(
                                        
                                      ),
                                    ),
                                  )
                                  .then(
                                    (value) => setState(
                                      () {
                                        vm.refreshState();
                                      },
                                    ),
                                  ), */
                              child: const Text('Depolar arası transfer'),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
