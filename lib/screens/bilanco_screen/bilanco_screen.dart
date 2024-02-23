import 'package:bltvt_mobile_veterinary/data/responses/bilanco_response.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_widget.dart';
import 'package:bltvt_mobile_veterinary/screens/bilanco_screen/bilanco_screen_view_model.dart';
import 'package:bltvt_mobile_veterinary/utils/colors.dart';
import 'package:bltvt_mobile_veterinary/utils/custom_style.dart';
import 'package:bltvt_mobile_veterinary/utils/dimensions.dart';
import 'package:flutter/material.dart';

class BilancoScreen extends StatefulWidget {
  BilancoScreen({
    Key key,
  }) : super(key: key);

  @override
  State<BilancoScreen> createState() => _BilancoScreenState();
}

class _BilancoScreenState extends State<BilancoScreen> {
  BilancoScreenviewmodel _viewModel;
  Bilanco Animalname;

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
     int toplamValue = 0;
    return BaseWidget<BilancoScreenviewmodel>(
      viewModelBuilder: (p0) => BilancoScreenviewmodel(),
      builder: (context, vm) {
        
        for (int index = 0; index < vm.Animalname.length; index++) {
          final Bilanco contact = vm.Animalname[index];
          toplamValue += contact.value ?? 0;
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text("Bilanço"),
            backgroundColor: CustomColor.primaryColor,
            centerTitle: true,
            flexibleSpace: Image(
              image: AssetImage("assets/images/appbar1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 20.0,
                ),
                decoration: BoxDecoration(
                  color: CustomColor.accentColor,
                  border: Border.all(
                    color: CustomColor.primaryColor,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, 
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Toplam Stok Değeri",
                        style: CustomStyle.kTitleStyle,
                      ),
                    ),
                    SizedBox(height: 10), 
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .center, 
                      children: [
                        Text(
                          vm.hesaptablosu.totalStockPrice.toString()+"₺",
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width:
                        160, 
                    child: Card(
                      color: CustomColor.accentColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: CustomColor.primaryColor),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text(
                              "Günlük Ciro",
                              style: CustomStyle.kTitleStyle,
                            ),
                            SizedBox(height: 5),
                            Text(
                              vm.hesaptablosu.total.toString() + "₺",
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width:
                        170,
                    child: Card(
                      color: CustomColor.accentColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: CustomColor.primaryColor),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text(
                              "Günlük Müşteri ",
                              style: CustomStyle.kTitleStyle,
                            ),
                            SizedBox(height: 5),
                            Text(
                              vm.hesaptablosu.customerCount.toString(),
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width:
                        160, 
                    child: Card(
                      color: CustomColor.accentColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: CustomColor.primaryColor),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text(
                              "Sms Bakiyesi",
                              style: CustomStyle.kTitleStyle,
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Sms Bakiyesi: ${vm.smsBalance.toInt()}" "    "
           
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width:
                        170, 
                    child: Card(
                      color: CustomColor.accentColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: CustomColor.primaryColor),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text(
                              "Kayıtlı Müşteri ",
                              style: CustomStyle.kTitleStyle,
                            ),
                            SizedBox(height: 5),
                            Text(
                              vm.hesaptablosu.customerTotalCount.toString(),
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                     "    Kayıtlı hastalar ($toplamValue)",
                    style: CustomStyle.kTitleStyle,
                  ),
                  const SizedBox(height: 1),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      color: CustomColor.accentColor,
                      border: Border.all(
                        color: CustomColor.primaryColor,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    child: Column(
                      children: List.generate(
                        vm.Animalname.length,
                        (index) {
                          final Bilanco contact = vm.Animalname[index];
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    (contact.key ?? "").trim(),
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    (contact.value?.toString() ?? "").trim(),
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
