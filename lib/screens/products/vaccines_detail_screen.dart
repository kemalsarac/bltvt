import 'package:bltvt_mobile_veterinary/data/responses/get_all_products_response.dart';
import 'package:bltvt_mobile_veterinary/screens/Depobilgileri.dart/depo_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/Depobilgileri.dart/depo_transfer.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_widget.dart';
import 'package:bltvt_mobile_veterinary/screens/main_menu/main_menu_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/products/vaccines_detail_view_model.dart';
import 'package:bltvt_mobile_veterinary/utils/colors.dart';
import 'package:bltvt_mobile_veterinary/utils/custom_style.dart';
import 'package:bltvt_mobile_veterinary/utils/dimensions.dart';
import 'package:flutter/material.dart';

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
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context)
                    .push(
                      MaterialPageRoute(builder: (context) => MainMenuScreen()),
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
          body:  Padding(
              padding: const EdgeInsets.all(Dimensions.defaultPaddingSize),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                controller: scrollController,
                child: Column(
                  children: <Widget>[
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
                                widget.vaccineDetail.mtPrice.toString() ==
                                        "null"
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
                    const SizedBox(height: 30),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Depolar",
                            style: CustomStyle.kTitleStyle,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ListView.separated(
                                      shrinkWrap: true,
                                      separatorBuilder: (context, index) =>
                                          SizedBox(height: 10),
                                      itemCount: vm.depopList.length,
                                      itemBuilder: (context, index) => Center(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            String depoguid =
                                                vm.depoTuru[index].dsGuidId;
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DepoScreen(
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
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WarehouseTransfer(
                                              widget.vaccineDetail,
                                            )),
                                  );
                                },
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
