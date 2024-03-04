import 'package:bltvt_mobile_veterinary/data/responses/get_all_products_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/gethavedepo_response.dart';
import 'package:bltvt_mobile_veterinary/screens/Depobilgileri.dart/depo_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/Depobilgileri.dart/depo_transfer.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_widget.dart';
import 'package:bltvt_mobile_veterinary/screens/customers/customer_edit_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/main_menu/main_menu_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/products/vaccines_detail_view_model.dart';
import 'package:bltvt_mobile_veterinary/screens/profil/profil_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/searchpage/search_page.dart';
import 'package:bltvt_mobile_veterinary/screens/sellingscreen/selling_screen.dart';
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
      viewModelBuilder: (p0) => Vaccinesdetailview(widget.vaccineDetail),
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
                   
                         Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Mevcut depo",
                        style: CustomStyle.kTitleStyle,
                      ),
                      const SizedBox(height: 1),
                      SizedBox(
                        height: 150,
                        child: ListView.builder(
                          itemCount: vm.havedepo.length,
                          itemBuilder: (context, index) {
                            String depoguid = vm.havedepo[index].dsWarehouse;
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: ElevatedButton(
                                onPressed: () {
                             
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: CustomColor.accentColor,
                                  onPrimary: Colors.white,
                                  padding: EdgeInsets.all(20),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  side: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                child: Text(
                                  vm.havedepo[index].dsWarehouse.toString(),
                                  style: CustomStyle.defaultStyle,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                
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
             bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.home),
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
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    Navigator.of(context)
                      .push(
                        MaterialPageRoute(
                          builder: (context) => SearchScreen()
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
                ), Text('            '),
                 IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    Navigator.of(context)
                      .push(
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen()
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
                 IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                  },
                ),
             
              ],
            ),
          ),
          floatingActionButton: SpeedDial(
              icon: Icons.menu,
              activeIcon: Icons.close,
              spacing: 3,
              childPadding: const EdgeInsets.all(5),
              spaceBetweenChildren: 4,
              visible: true,
              direction: SpeedDialDirection.up,
              elevation: 8,
              animationCurve: Curves.elasticInOut,
              isOpenOnStart: false,
              backgroundColor: CustomColor.primaryColor,
              foregroundColor: Colors.white,
              buttonSize: const Size(60, 60),
              childrenButtonSize: const Size(60, 60),
              children: [
               
                   SpeedDialChild(
                  
                  backgroundColor: CustomColor.primaryColor,
                  foregroundColor: Colors.white,
                  label: "Hızlı Satış",
                /*  onTap: () => Navigator.of(context)
                      .push(
                        MaterialPageRoute(
                          builder: (context) => AdmissionTestScreen(
                              vm.patientDetail.dsPatientName ?? "",
                              "",
                              GetAppointmentByIdPatientResponse(),
                              vm.customerDetail.dsGuidId,
                              widget.patientGuid,
                              vm.patientDetail.dsPatientName),
                        ),
                      )
                      .then(
                        (value) => setState(
                          () {
                            vm.refreshState();
                          },
                        ),
                      ), */
                ),
                   SpeedDialChild(
                  backgroundColor: CustomColor.primaryColor,
                  foregroundColor: Colors.white,
                  label: "Hızlı müşteri ekle",
                  onTap: () =>  Navigator.of(context)
                .push(MaterialPageRoute(
                    builder: (context) => CustomerEditScreen('')))
                .then((value) => setState(() {
                      vm.refreshState();
                    })),
                ), SpeedDialChild(
                  backgroundColor: CustomColor.primaryColor,
                  foregroundColor: Colors.white,
                  label: "Depolar",
                  onTap: () =>  Navigator.of(context)
                .push(MaterialPageRoute(
                    builder: (context) => CustomerEditScreen('')))
                .then((value) => setState(() {
                      vm.refreshState();
                    })),
                ),
                  
              ]
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          
        /*  floatingActionButton: FloatingActionButton(
            onPressed: () async {
              List<GethavewareResponse> secilenDepolar =
                  await _depoyuSecmeDialogunuGoster(context,vm);
            },
            tooltip: 'Depolarınızı görüntüleyin',
            child: Icon(Icons.add),
          ), */
        ); 
      },
    );
  }

  Future<List<GethavewareResponse>> _depoyuSecmeDialogunuGoster(
    BuildContext context, Vaccinesdetailview vm) async {
  return await showDialog<List<GethavewareResponse>>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Depolarınız"),
        content: SizedBox(
          height: 150,
          child: ListView.builder(
            itemCount: vm.depopList.length,
            itemBuilder: (context, index) {
              String depoguid = vm.depopList[index];
              return ListTile(
                title: Text(
                  vm.depopList[index].toString(),
                  style: CustomStyle.defaultStyle,
                ),
                onTap: () {

                                          String depoguid =
                                              vm.depoTuru[index].dsGuidId;
                  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DepoScreen( depoguid
        ),
      ),
    );
                },
              );
            },
          ),
        ),
      );
    },
  );
}
}
       
