import 'package:bltvt_mobile_veterinary/data/responses/depohak_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/gethavedepo_response.dart';
import 'package:bltvt_mobile_veterinary/screens/Depobilgileri.dart/depo_look_view_model.dart';
import 'package:bltvt_mobile_veterinary/screens/Depobilgileri.dart/depo_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/Depobilgileri.dart/depo_transfer.dart';
import 'package:bltvt_mobile_veterinary/screens/customers/customer_edit_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/main_menu/main_menu_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/profil/profil_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/searchpage/search_page.dart';
import 'package:bltvt_mobile_veterinary/screens/sellingscreen/selling_screen.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_all_products_response.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_widget.dart';
import 'package:bltvt_mobile_veterinary/utils/colors.dart';
import 'package:bltvt_mobile_veterinary/utils/custom_style.dart';
import 'package:bltvt_mobile_veterinary/utils/dimensions.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DepoLookScreen extends StatefulWidget {
  GetAllProductsResponse Productkod;
  String guid;
  GetAllProductsResponse productDetail;
  String productG = '';
  List<depohak> depotur = [];
  dynamic dsGuidId;

  final dynamic depoguid;
  DepoLookScreen( {this.depoguid, this.guid, Key key})
      : super(key: key);

  @override
  State<DepoLookScreen> createState() => _DepoLookScreenState();
}

class _DepoLookScreenState extends State<DepoLookScreen> {
  DepoLookScreenviewmodel _viewModel;
  int Productkod;
  int warehousekod;
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<DepoLookScreenviewmodel>(
      viewModelBuilder: (p0) {
        _viewModel = DepoLookScreenviewmodel();
        return _viewModel;
      },
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
         body: SingleChildScrollView(
  child: Padding(
    padding: const EdgeInsets.all(Dimensions.defaultPaddingSize),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Depolarınız",
              style: CustomStyle.kTitleStyle,
            ),
             SizedBox(height: 10),
            SizedBox(
              height: 9000,
              child: ListView.builder(
                itemCount: vm.depoTuru.length,
                itemBuilder: (context, index) {
                  String depoguid = vm.depopList[index];
                  return ElevatedButton(
                    onPressed: () {
                      String depoguid = vm.depoTuru[index].dsGuidId;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DepoScreen(depoguid),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: CustomColor.accentColor,
                                  onPrimary: Colors.white,
                                  padding: EdgeInsets.all(20),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  side: BorderSide(
                                    color: Colors.grey,
                                  ),
                    ),
                    child: Text(
                      vm.depopList[index].toString(),
                      style: CustomStyle.defaultStyle,
                    ),
                    
                  );
                  
                },
              ),
            )
          ],
        ),
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
                ),
                    
                   SpeedDialChild(
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
    BuildContext context,DepoLookScreenviewmodel vm) async {
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