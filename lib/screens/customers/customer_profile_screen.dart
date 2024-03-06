import 'package:bltvt_mobile_veterinary/data/requests/save_customer_request.dart';
import 'package:bltvt_mobile_veterinary/data/requests/update_patient_status_request.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_customer_search_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/save_patient_response.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_widget.dart';
import 'package:bltvt_mobile_veterinary/screens/customers/customer_edit_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/customers/customer_profile_screen_view_model.dart';
import 'package:bltvt_mobile_veterinary/screens/customers/customers_screen_view_model.dart';
import 'package:bltvt_mobile_veterinary/screens/main_menu/main_menu_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/patients/patient_edit_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/patients/patient_profile_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/profil/profil_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/searchpage/search_page.dart';
import 'package:bltvt_mobile_veterinary/utils/colors.dart';
import 'package:bltvt_mobile_veterinary/utils/custom_style.dart';
import 'package:bltvt_mobile_veterinary/utils/dimensions.dart';
import 'package:bltvt_mobile_veterinary/utils/extensions/extensions.dart';
import 'package:bltvt_mobile_veterinary/widgets/no_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_appointment_by_id_patient_response.dart';
import 'package:bltvt_mobile_veterinary/screens/admissions/admission_edit_screen.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';

// ignore: must_be_immutable
class CustomerProfileScreen extends StatefulWidget {
  String guid;
  String patientGuid;

  CustomerProfileScreen(this.guid, {Key key}) : super(key: key);

  @override
  State<CustomerProfileScreen> createState() => _CustomerProfileScreenState();
}

class _CustomerProfileScreenState extends State<CustomerProfileScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<CustomerProfileScreenViewModel>(
      viewModelBuilder: (p0) => CustomerProfileScreenViewModel(widget.guid),
      builder: (context, vm) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Müşteri Detayı"),
            backgroundColor: CustomColor.primaryColor,
            centerTitle: true,
            flexibleSpace: Image(
              image: AssetImage("assets/images/appbar1.jpg"),
              fit: BoxFit.cover,
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () { },
              ),
            ],
          ),
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(Dimensions.defaultPaddingSize),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              controller: scrollController,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Image.network(
                          vm.customerDetail.dsCustomerPhoto ?? "",
                          width: 120.scaleByWidth(),
                          height: 120.scaleByWidth(),
                          errorBuilder: (context, obj, strace) {
                            return ClipOval(
                              child: NoImagePersonWidget(120, 120),
                            );
                          },
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
                              "Ad",
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
                              vm.customerDetail.dsFirstName ?? "",
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
                              "Soyad",
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
                              vm.customerDetail.dsLastName ?? "",
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
                              "Telefon",
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
                              vm.customerDetail.dsPhoneNo ?? "",
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
                              "TCKN / VKN",
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
                              vm.customerDetail.identityNo ?? "",
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
                              "E-Posta",
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
                              vm.customerDetail.dsEmail ?? "",
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
                              "Bakiye",
                              style: CustomStyle.kTitleStyle,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              child: Divider(
                                color: CustomColor.lightGreyColorForDivider,
                                thickness: 2,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  vm.customerDetail.mtBalance.toString() ==
                                          "null"
                                      ? "0"
                                      : vm.customerDetail.mtBalance
                                                  .toString()
                                                  .split(".")
                                                  .last ==
                                              "0"
                                          ? vm.customerDetail.mtBalance
                                              .toString()
                                              .split(".")
                                              .first
                                          : vm.customerDetail.mtBalance
                                              .toString(),
                                  style: CustomStyle.defaultStyle,
                                ),
                                Text(
                                  " ₺",
                                  style: CustomStyle.defaultStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Kayıtlı Hastalar",
                            style: CustomStyle.kTitleStyle,
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        child: Divider(
                          color: CustomColor.lightGreyColorForDivider,
                          thickness: 5,
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: vm.customerDetail.patients.length,
                        itemBuilder: (context, index) {
                          SavePatientResponse patient =
                              vm.customerDetail.patients[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: GestureDetector(
                              onTap: () => Navigator.of(context)
                                  .push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PatientProfileScreen(
                                              vm.customerDetail,
                                              patient.dsGuidId),
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
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    patient.dsPatientName ?? "",
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 2,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      patient.idType != 0
                                                          ? "(${vm.patientTypes.where((element) => element.idPatientType == patient.idType).first.dsPatientType})"
                                                          : "",
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.grey,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Bakiyesi: ",
                                                    style: CustomStyle
                                                        .defaultStyle,
                                                  ),
                                                  Text(
                                                    patient.mtBalance
                                                                .toString() ==
                                                            "null"
                                                        ? "0"
                                                        : patient.mtBalance
                                                                    .toString()
                                                                    .split(".")
                                                                    .last ==
                                                                "0"
                                                            ? patient.mtBalance
                                                                .toString()
                                                                .split(".")
                                                                .first
                                                            : patient.mtBalance
                                                                .toString(),
                                                    style: CustomStyle
                                                        .defaultStyle,
                                                  ),
                                                  Text(
                                                    " ₺",
                                                    style: CustomStyle
                                                        .defaultStyle,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.of(context)
                                                          .push(
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  PatientEditScreen(
                                                                vm.customerDetail
                                                                    .dsGuidId,
                                                                patient
                                                                    .dsGuidId,
                                                                vm.customerDetail
                                                                    .idCustomer,
                                                                SaveCustomerRequest(),
                                                                false,
                                                              ),
                                                            ),
                                                          )
                                                          .then(
                                                            (value) => setState(
                                                              () {
                                                                vm.refreshState();
                                                              },
                                                            ),
                                                          ),
                                                  child: Column(
                                                    children: const [
                                                      Icon(
                                                        Icons.edit_document,
                                                        color: CustomColor
                                                            .primaryColor,
                                                        size: 25,
                                                      ),
                                                      Text(
                                                        "Düzenle",
                                                        style: TextStyle(
                                                          color: CustomColor
                                                              .primaryColor,
                                                          fontSize: 13,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () async {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return SimpleDialog(
                                                          title: Text(
                                                            "Hasta durumu pasif olacak onaylıyor musunuz?",
                                                            style: TextStyle(
                                                                fontSize: Dimensions
                                                                    .extraLargeTextSize),
                                                          ),
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: <
                                                                  Widget>[
                                                                GestureDetector(
                                                                  onTap:
                                                                      () async {
                                                                    bool
                                                                        result =
                                                                        await vm
                                                                            .updatePatientStatus(
                                                                      UpdatePatientStatusRequest(
                                                                        dsGuidId:
                                                                            patient.dsGuidId,
                                                                        idCustomer:
                                                                            patient.idCustomer,
                                                                        dsPatientName:
                                                                            patient.dsPatientName,
                                                                        idPatient:
                                                                            patient.idPatient,
                                                                        valid:
                                                                            false,
                                                                      ),
                                                                    );

                                                                    if (result) {
                                                                      Fluttertoast
                                                                          .showToast(
                                                                        msg:
                                                                            "Hasta durumu güncellendi",
                                                                        backgroundColor:
                                                                            Colors.green,
                                                                        textColor:
                                                                            Colors.white,
                                                                        fontSize:
                                                                            20,
                                                                        toastLength:
                                                                            Toast.LENGTH_LONG,
                                                                      );
                                                                      setState(
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                        vm.refreshState();
                                                                      });
                                                                    } else {
                                                                      Fluttertoast
                                                                          .showToast(
                                                                        msg:
                                                                            "Bir Hata Oluştu!",
                                                                        backgroundColor:
                                                                            Colors.red,
                                                                        textColor:
                                                                            Colors.white,
                                                                        fontSize:
                                                                            20,
                                                                        toastLength:
                                                                            Toast.LENGTH_LONG,
                                                                      );
                                                                    }
                                                                  },
                                                                  child: Text(
                                                                    "Evet",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .green,
                                                                      fontSize:
                                                                          Dimensions
                                                                              .largeTextSize,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      right: 20,
                                                                      left: 40),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child: Text(
                                                                      "Hayır",
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .red,
                                                                        fontSize:
                                                                            Dimensions.largeTextSize,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Column(
                                                    children: [
                                                      Icon(
                                                        Icons.delete,
                                                        color: CustomColor
                                                            .redColor,
                                                        size: 25,
                                                      ),
                                                      Text(
                                                        "Sil",
                                                        style: TextStyle(
                                                          color: CustomColor
                                                              .redColor,
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          /* floatingActionButton: SpeedDial(
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
                child: Icon(Icons.date_range_outlined),
                backgroundColor: CustomColor.accentColor,
                label: 'Randevu oluştur',
                onTap: () => Navigator.of(context)
                    .push(
                      MaterialPageRoute(
                        builder: (context) => AdmissionEditScreen(
                          "",
                          GetAppointmentByIdPatientResponse(),
                          vm.customerDetail.dsGuidId,
                          widget.patientGuid,
                        ),
                      ),
                    )
                    .then(
                      (value) => setState(
                        () {
                          vm.refreshState();
                        },
                      ),
                    ),
              ),
              SpeedDialChild(
                child: Icon(Icons.add),
                backgroundColor: CustomColor.accentColor,
                label: 'Hasta ekle',
                onTap: () => Navigator.of(context)
                    .push(
                      MaterialPageRoute(
                        builder: (context) => PatientEditScreen(
                          '',
                          '',
                          vm.customerDetail.idCustomer,
                          vm.customerDetail,
                          false,
                        ),
                      ),
                    )
                    .then(
                      (value) => setState(
                        () {
                          vm.refreshState();
                        },
                      ),
                    ),
              ),
            ],
          ), */
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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
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
                child: const Icon(Icons.date_range_outlined),
                backgroundColor: CustomColor.accentColor,
                foregroundColor: Colors.blue,
                label: "Randevu Oluştur",
                onTap: () => Navigator.of(context)
                    .push(
                      MaterialPageRoute(
                        builder: (context) => AdmissionEditScreen(
                          "",
                          GetAppointmentByIdPatientResponse(),
                          vm.customerDetail.dsGuidId,
                          widget.patientGuid,
                        ),
                      ),
                    )
                    .then(
                      (value) => setState(
                        () {
                          vm.refreshState();
                        },
                      ),
                    ),
              ),
              SpeedDialChild(
                child: const Icon(Icons.edit_document),
                backgroundColor: CustomColor.accentColor,
                foregroundColor: Colors.blue,
                label: "Hasta ekle",
                onTap: () => Navigator.of(context)
                    .push(
                      MaterialPageRoute(
                        builder: (context) => PatientEditScreen(
                          '',
                          '',
                          vm.customerDetail.idCustomer,
                          vm.customerDetail,
                          false,
                        ),
                      ),
                    )
                    .then(
                      (value) => setState(
                        () {
                          vm.refreshState();
                        },
                      ),
                    ),
              ),
            ],
          ),
        );
      },
    );
  }  void showConfirmationDialog(BuildContext context, CustomersScreenViewModel vm,
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
 