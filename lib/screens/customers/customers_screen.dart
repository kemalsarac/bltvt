import 'package:bltvt_mobile_veterinary/data/requests/save_customer_request.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_customer_search_response.dart';
import 'package:bltvt_mobile_veterinary/screens/Depobilgileri.dart/depo_look.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_widget.dart';
import 'package:bltvt_mobile_veterinary/screens/customers/customer_edit_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/customers/customer_profile_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/customers/customers_screen_view_model.dart';
import 'package:bltvt_mobile_veterinary/screens/main_menu/main_menu_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/profil/profil_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/searchpage/search_page.dart';
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

class CustomersScreen extends StatefulWidget {
  const CustomersScreen({Key key}) : super(key: key);

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> with ChangeNotifier {
  List<GetCustomerSearchResponse> customers, allCustomers;
  String query = '';
  CustomersScreenViewModel viewModel;
  ScrollController scrollController = ScrollController();
  int _selectedIndex = 0; 

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<CustomersScreenViewModel>(
      viewModelBuilder: (p0) => CustomersScreenViewModel(),
      builder: (context, vm) {
        viewModel = vm;
        return Scaffold(
          body: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/welcome page-5.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                margin: EdgeInsets.only(top: 0),
              ),
              Container(
                margin: EdgeInsets.only(top: 0, left: 30, right: 10),
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
                              builder: (context) => MainMenuScreen()),
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
                              builder: (context) => SearchScreen()),
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
                Text('            '),
                IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    Navigator.of(context)
                        .push(
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen()),
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
                  onPressed: () {},
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
              backgroundColor: Color.fromARGB(255, 26, 49, 182),
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
                  onTap: () => Navigator.of(context)
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
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(
                          builder: (context) => DepoLookScreen()))
                      .then((value) => setState(() {
                            vm.refreshState();
                          })),
                ),
              ]),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }

  Widget buildSearch(BuildContext context, CustomersScreenViewModel vm) {
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

  Widget buildCustomerList(BuildContext context, CustomersScreenViewModel vm) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 120),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(80.0),
            topRight: Radius.circular(0.0),
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
              color: Color.fromARGB(255, 40, 40, 40),
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
                  itemCount: vm.customerList.length,
                  itemBuilder: (context, index) {
                    final GetCustomerSearchResponse contact =
                        vm.customerList[index];

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
                        margin:
                            const EdgeInsets.only(left: 10, top: 10, right: 0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.transparent,
                            width: 0,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 35, top: 5, right: 30),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
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
                                                        contact.dsCustomerPhoto ??
                                                            "",
                                                        width: 100.0,
                                                        height: 100.0,
                                                        errorBuilder: (context,
                                                            obj, strace) {
                                                          return ClipOval(
                                                            child:
                                                                NoImagePersonWidget(
                                                                    50.0, 50.0),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        left: 10,
                                                        top: 10,
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  contact
                                                                      .dsNameAndSurname
                                                                      .trim(),
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          12),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  (contact.dsPhoneNo ??
                                                                          "")
                                                                      .trim(),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style:
                                                                      const TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .grey,
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
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 27,
                              right: 10,
                              child: GestureDetector(
                                onTap: () => navigateToEditCustomerScreen(
                                    context, vm, contact),
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red,
                                  ),
                                  child: Icon(
                                    Icons.edit_document,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                onEndOfPage: () =>
                    vm.loadMoreCustomers(query, vm.customerList.length),
              );
            },
          ),
        ),
      ),
    );
  }
  /* Center(
          child: Container(
            width: 200.0,
            height: 200.0,
            color: Colors.blue,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Siyah renk
                    width: 5.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
} */

  Widget buildIconButtonWithCircleAvatar({
    VoidCallback onPressed,
    IconData icon,
    String label,
    Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: CircleAvatar(
        backgroundColor: color,
        child: IconButton(
          icon: Icon(icon),
          color: Colors.white,
          onPressed: onPressed,
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
      CustomersScreenViewModel vm, GetCustomerSearchResponse contact) {
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

  void showConfirmationDialog(BuildContext context, CustomersScreenViewModel vm,
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
                    padding: EdgeInsets.only(left: 70.0, right: 20.0),
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
