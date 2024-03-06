import 'package:bltvt_mobile_veterinary/data/requests/save_customer_request.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_customer_search_response.dart';
import 'package:bltvt_mobile_veterinary/screens/Depobilgileri.dart/depo_look.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_widget.dart';
import 'package:bltvt_mobile_veterinary/screens/customers/customer_edit_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/customers/customer_profile_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/customers/customers_screen_view_model.dart';
import 'package:bltvt_mobile_veterinary/screens/main_menu/main_menu_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/profil/profil_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/searchpage/search_page_view_model.dart';
import 'package:bltvt_mobile_veterinary/utils/colors.dart';
import 'package:bltvt_mobile_veterinary/utils/dimensions.dart';
import 'package:bltvt_mobile_veterinary/utils/extensions/extensions.dart';
import 'package:bltvt_mobile_veterinary/widgets/no_image_widget.dart';
import 'package:bltvt_mobile_veterinary/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scroll_to_top/flutter_scroll_to_top.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
//SearchScreen
class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with ChangeNotifier {
  List<GetCustomerSearchResponse> customers, allCustomers;
  String query = '';
  SearchScreenViewModel viewModel;
  ScrollController scrollController = ScrollController();
  int _selectedIndex = 0; // Seçili sekmenin dizini

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<SearchScreenViewModel>(
      viewModelBuilder: (p0) => SearchScreenViewModel(),
      builder: (context, vm) {
        viewModel = vm;
        return Scaffold(
          appBar: buildAppBar(),
          body: Column(
            children: <Widget>[
              Container(
                child: buildSearch(context, vm),
              ),
              buildCustomerList(context, vm),
            ],
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
          ), floatingActionButton: SpeedDial(
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
                  label: "Depo",
                  onTap: () =>  Navigator.of(context)
                .push(MaterialPageRoute(
                    builder: (context) => DepoLookScreen()))
                .then((value) => setState(() {
                      vm.refreshState();
                    })),
                ), 
              ]
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          
        );
      },
    );
  }

  Widget buildAppBar() {
    return AppBar(
      title: const Text("Müşteriler"),
      backgroundColor: CustomColor.primaryColor,
      centerTitle: true,
      flexibleSpace: Image(
                image: AssetImage("assets/images/appbar1.jpg"),
                fit: BoxFit.cover,
              ),
    );
  }

  Widget buildSearch(BuildContext context,  SearchScreenViewModel vm) {
    allCustomers = vm.customerList;
    return SearchWidget(
      text: query,
      hintText: 'müşteri arama',
      onChanged: searchCustomer,
    );
  }

  void searchCustomer(String query) {
    this.query = query;
    viewModel.searchText(query);
  }
 


Widget buildCustomerList(BuildContext context, SearchScreenViewModel vm) {
  List<GetCustomerSearchResponse> displayedCustomers = query.isEmpty
      ? []
      : vm.customerList;

  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: ScrollWrapper(
          promptAlignment: Alignment.bottomLeft,
          scrollController: scrollController,
          promptTheme: const PromptButtonTheme(
            elevation: 30,
            color: CustomColor.primaryColor,
            icon: Icon(
              Icons.arrow_circle_up,
              size: 40,
              color: Colors.white,
            ),
          ),
          builder: (BuildContext context, ScrollViewProperties properties) {
            return LazyLoadScrollView(
              child: ListView.builder(
                controller: properties.scrollController,
                scrollDirection: properties.scrollDirection,
                itemCount: displayedCustomers.length,
                itemBuilder: (context, index) {
                  final GetCustomerSearchResponse contact =
                      displayedCustomers[index];

                  return GestureDetector(
                    onTap: () => Navigator.of(context)
                        .push(
                          MaterialPageRoute(
                            builder: (context) =>
                                CustomerProfileScreen(contact.dsGuidId),
                          ),
                        )
                        .then(
                          (value) => setState(
                            () {
                              vm.refreshState();
                            },
                          ),
                        ),
                    child: Container(
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
                     child:  Column(
                          children: [
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Hero(
                                            tag:
                                                "customerPhoto-${contact.dsGuidId}",
                                            child: ClipOval(
                                              child: Image.network(
                                                contact.dsCustomerPhoto ?? "",
                                                width: 70.scaleByWidth(),
                                                height: 70.scaleByWidth(),
                                                errorBuilder:
                                                    (context, obj, strace) {
                                                  return ClipOval(
                                                    child: NoImagePersonWidget(
                                                        70, 70),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                left: 10,
                                                top: 10,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          contact
                                                              .dsNameAndSurname
                                                              .trim(),
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 18),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          (contact.dsPhoneNo ??
                                                                  "")
                                                              .trim(),
                                                          textAlign:
                                                              TextAlign.left,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 15,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          (contact.dsEmail ??
                                                                  "")
                                                              .trim(),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 15,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                    ),  ] ) ] )
                  ) );
                },
              ),
              onEndOfPage: () =>
                  vm.loadMoreCustomers(query, displayedCustomers.length),
            );
          },
        ),
      ),
    ),
  );
}
 
  TextButton buildTextButton({
    VoidCallback onPressed,
    IconData icon,
    String label,
    Color color,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: 25,
          ),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }

  void navigateToEditCustomerScreen(BuildContext context,
      SearchScreenViewModel vm, GetCustomerSearchResponse contact) {
    Navigator.of(context)
        .push(
          MaterialPageRoute(
            builder: (context) => CustomerEditScreen(contact.dsGuidId),
          ),
        )
        .then((value) => setState(
              () {
                vm.refreshState();
              },
            ));
  }

  void showConfirmationDialog(BuildContext context,  SearchScreenViewModel vm,
      GetCustomerSearchResponse contact) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text(
            "Müşteri durumu pasif olacak onaylıyor musunuz?",
            style: TextStyle(fontSize: Dimensions.extraLargeTextSize),
          ),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                buildGestureDetector(
                  onTap: () async {
                    SaveCustomerRequest customerData =
                        await vm.getCustomerByGuid(contact.dsGuidId);
                    customerData.valid = false;
                    bool result = await vm.updateCustomerStatus(customerData);

                    if (result) {
                      showSuccessToast("Hasta durumu güncellendi");
                      setState(() {
                        Navigator.pop(context);
                        vm.refreshState();
                        viewModel.refreshState();
                      });
                    } else {
                      showErrorToast("Bir Hata Oluştu!");
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 70.0, right: 20.0), 
                    child: buildText(
                      "Evet",
                      Color.fromARGB(255, 2, 144, 59),
                      Dimensions.largeTextSize,
                    ),
                  ),
                ),
                buildGestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 35.0),
                    child: buildText(
                      "Hayır",
                      Colors.red,
                      Dimensions.largeTextSize,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  GestureDetector buildGestureDetector({VoidCallback onTap, Widget child}) {
    return GestureDetector(
      onTap: onTap,
      child: child,
    );
  }

  Text buildText(String text, Color color, double fontSize) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
      ),
    );
  }

  Padding buildPadding() {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 40),
    );
  }

  void showSuccessToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 20,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  void showErrorToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 20,
      toastLength: Toast.LENGTH_LONG,
    );
  }
}