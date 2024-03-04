import 'package:bltvt_mobile_veterinary/data/requests/save_customer_request.dart';
import 'package:bltvt_mobile_veterinary/data/requests/update_admission_status_request.dart';
import 'package:bltvt_mobile_veterinary/data/requests/update_patient_status_request.dart';
import 'package:bltvt_mobile_veterinary/data/requests/update_request.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_appointment_by_id_patient_response.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_widget.dart';
import 'package:bltvt_mobile_veterinary/screens/admissions/admission_edit_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/admissions/admission_test_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/main_menu/main_menu_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/patients/patient_edit_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/patients/patient_profile_screen_view_model.dart';
import 'package:bltvt_mobile_veterinary/screens/profil/profil_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/searchpage/search_page.dart';
import 'package:bltvt_mobile_veterinary/screens/sellingscreen/selling_screen.dart';
import 'package:bltvt_mobile_veterinary/utils/colors.dart';
import 'package:bltvt_mobile_veterinary/utils/custom_style.dart';
import 'package:bltvt_mobile_veterinary/utils/dimensions.dart';
import 'package:bltvt_mobile_veterinary/utils/extensions/extensions.dart';
import 'package:bltvt_mobile_veterinary/widgets/no_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class PatientProfileScreen extends StatefulWidget {
  String patientGuid;
  SaveCustomerRequest customerDetail;

  PatientProfileScreen(this.customerDetail, this.patientGuid, {Key key})
      : super(key: key);

  @override
  State<PatientProfileScreen> createState() => _PatientProfileScreenState();
}

class _PatientProfileScreenState extends State<PatientProfileScreen> {
  String selectedAppointmentStatus = "Bekleyen";
  ScrollController scrollController = ScrollController();
  ValueNotifier<bool> isDialOpen = ValueNotifier(true);
  final _keyForm = GlobalKey<FormState>();
  List<GetAppointmentByIdPatientResponse> filteredList = [];

  @override
  Widget build(BuildContext context) {
    return BaseWidget<PatientProfileScreenViewModel>(
      viewModelBuilder: (p0) => PatientProfileScreenViewModel(
          widget.patientGuid, widget.customerDetail),
      builder: (context, vm) {
        filteredList = vm.appointments
            .where(
              (element) =>
                  element.idStatus ==
                  (selectedAppointmentStatus == "Onaylanan"
                      ? 1
                      : selectedAppointmentStatus == "Bekleyen"
                          ? 2
                          : 3),
            )
            .toList();
        return Form(
          key: _keyForm,
          child: Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
                      ),
                ),
                SpeedDialChild(
                  child: const Icon(Icons.edit_document),
                  backgroundColor: CustomColor.accentColor,
                  foregroundColor: Colors.blue,
                  label: "Düzenle",
                  onTap: () => Navigator.of(context)
                      .push(
                        MaterialPageRoute(
                          builder: (context) => PatientEditScreen(
                            vm.customerDetail.dsGuidId,
                            vm.patientDetail.dsGuidId,
                            vm.customerDetail.idCustomer,
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
                ),
                SpeedDialChild(
                  child: const Icon(Icons.delete),
                  backgroundColor: CustomColor.accentColor,
                  foregroundColor: CustomColor.blueColor,
                  label: "Sil",
                  onTap: () async {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          title: Text(
                            "Hasta durumu pasif olacak onaylıyor musunuz?",
                            style: TextStyle(
                                fontSize: Dimensions.extraLargeTextSize),
                          ),
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () async {
                                    bool result =
                                        await vm.updateHayvan(updateRequest(
                                      dsGuidId: vm.patientDetail.dsGuidId,
                                      idCustomer: vm.patientDetail.idCustomer,
                                      dsPatientName:
                                          vm.patientDetail.dsPatientName,
                                      idPatient: vm.patientDetail.idPatient,
                                      valid: false,
                                    ));

                                    if (result) {
                                      Fluttertoast.showToast(
                                        msg: "Hasta durumu güncellendi",
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white,
                                        fontSize: 20,
                                        toastLength: Toast.LENGTH_LONG,
                                      );
                                      setState(() {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                        vm.refreshState();
                                      });
                                    } else {
                                      Fluttertoast.showToast(
                                        msg: "Bir Hata Oluştu!",
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 20,
                                        toastLength: Toast.LENGTH_LONG,
                                      );
                                    }
                                  },
                                  child: Text(
                                    "Evet",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: Dimensions.largeTextSize,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 20, left: 40),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Hayır",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: Dimensions.largeTextSize,
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
                ),
              ],
            ),
            appBar: AppBar(
              title: const Text("Hasta Detayı"),
              backgroundColor: CustomColor.primaryColor,
              centerTitle: true,
              flexibleSpace: Image(
                image: AssetImage("assets/images/appbar1.jpg"),
                fit: BoxFit.cover,
              ),
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
                            vm.patientDetail.dsProfileImageUrl ?? "",
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
                                "İsim",
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
                                vm.patientDetail.dsPatientName ?? "",
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
                                "Cinsi",
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
                                vm.patientDetail.dsSpecies ?? "",
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
                                "Karne No",
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
                                vm.patientDetail.dsCarneNo ?? "",
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
                                "Çip No",
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
                                vm.patientDetail.dsChipNo ?? "",
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
                                "Rengi",
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
                                vm.patientDetail.dsColor ?? "",
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
                                    vm.patientDetail.mtBalance.toString() ==
                                            "null"
                                        ? "0"
                                        : vm.patientDetail.mtBalance
                                                    .toString()
                                                    .split(".")
                                                    .last ==
                                                "0"
                                            ? vm.patientDetail.mtBalance
                                                .toString()
                                                .split(".")
                                                .first
                                            : vm.patientDetail.mtBalance
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
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "Not",
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
                                children: [
                                  Expanded(
                                    child: Text(
                                      vm.patientDetail.dsNote ?? "",
                                      maxLines: 1,
                                      style: CustomStyle.defaultStyle,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Visibility(
                                    visible: vm.patientDetail.dsNote == null ||
                                            vm.patientDetail.dsNote.isEmpty
                                        ? false
                                        : true,
                                    child: TextButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return SimpleDialog(
                                              title: Text(
                                                "Hasta Notu",
                                                style: TextStyle(
                                                  color:
                                                      CustomColor.primaryColor,
                                                  fontSize: Dimensions
                                                      .extraLargeTextSize,
                                                ),
                                              ),
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20, right: 20),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              vm.patientDetail
                                                                  .dsNote,
                                                              style: CustomStyle
                                                                  .defaultStyle,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(20.0),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Text(
                                                                "Kapat",
                                                                style:
                                                                    TextStyle(
                                                                  color: CustomColor
                                                                      .primaryColor,
                                                                  fontSize:
                                                                      Dimensions
                                                                          .largeTextSize,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Text(
                                        "Göster",
                                        style: TextStyle(
                                          fontSize: Dimensions.largeTextSize,
                                          color: CustomColor.primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
                                "Özel Durumu",
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
                                children: [
                                  Expanded(
                                    child: Text(
                                      vm.patientDetail.dsPatientSpecialStatus ??
                                          "",
                                      maxLines: 1,
                                      style: CustomStyle.defaultStyle,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Visibility(
                                    visible: vm.patientDetail
                                                    .dsPatientSpecialStatus ==
                                                null ||
                                            vm.patientDetail
                                                .dsPatientSpecialStatus.isEmpty
                                        ? false
                                        : true,
                                    child: TextButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return SimpleDialog(
                                              title: Text(
                                                "Hasta Özel Durumu",
                                                style: TextStyle(
                                                  color:
                                                      CustomColor.primaryColor,
                                                  fontSize: Dimensions
                                                      .extraLargeTextSize,
                                                ),
                                              ),
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20, right: 20),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              vm.patientDetail
                                                                  .dsPatientSpecialStatus,
                                                              style: CustomStyle
                                                                  .defaultStyle,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(20.0),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Text(
                                                                "Kapat",
                                                                style:
                                                                    TextStyle(
                                                                  color: CustomColor
                                                                      .primaryColor,
                                                                  fontSize:
                                                                      Dimensions
                                                                          .largeTextSize,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Text(
                                        "Göster",
                                        style: TextStyle(
                                          fontSize: Dimensions.largeTextSize,
                                          color: CustomColor.primaryColor,
                                        ),
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
                    const SizedBox(
                      height: 40,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "Yakın Randevular",
                                style: CustomStyle.kTitleStyle,
                              ),
                            ),
                            Expanded(
                              child: FormField<String>(
                                builder: (FormFieldState<String> state) {
                                  filteredList.sort((a, b) {
                                    DateTime dateA =
                                        DateTime.tryParse(a.dtAdmission);
                                    DateTime dateB =
                                        DateTime.tryParse(b.dtAdmission);
                                    if (dateA == null || dateB == null) {
                                      return 0;
                                    }
                                    return dateB.compareTo(dateA);
                                  });
                                  return InputDecorator(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                    isEmpty:
                                        selectedAppointmentStatus == null ??
                                            true,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        value: selectedAppointmentStatus,
                                        isDense: true,
                                        onChanged: (String newValue) {
                                          setState(() {
                                            selectedAppointmentStatus =
                                                newValue;
                                            state.didChange(newValue);
                                          });
                                        },
                                        items: vm.appointmentTypes.map(
                                          (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          },
                                        ).toList(),
                                      ),
                                    ),
                                  );
                                },
                              ),
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
                          itemCount: filteredList.length,
                          itemBuilder: (context, index) {
                            filteredList.sort((a, b) {
                              DateTime dateA = DateTime.tryParse(a.dtAdmission);
                              DateTime dateB = DateTime.tryParse(b.dtAdmission);
                              if (dateA == null || dateB == null) {
                                return 0;
                              }
                              return dateB.compareTo(dateA);
                            });
                            GetAppointmentByIdPatientResponse appointment =
                                filteredList[index];

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
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
                                                    DateFormat("dd/MM/yyyy").format(
                                                            DateTime.tryParse(
                                                                appointment
                                                                    .dtAdmission)) ??
                                                        "",
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    appointment.idStatus == 1
                                                        ? Icons.check
                                                        : appointment
                                                                    .idStatus ==
                                                                2
                                                            ? Icons
                                                                .timelapse_rounded
                                                            : appointment
                                                                        .idStatus ==
                                                                    3
                                                                ? Icons.close
                                                                : Icons,
                                                    color: appointment
                                                                .idStatus ==
                                                            1
                                                        ? Colors.green
                                                        : appointment
                                                                    .idStatus ==
                                                                2
                                                            ? Colors.yellow
                                                            : appointment
                                                                        .idStatus ==
                                                                    3
                                                                ? Colors.red
                                                                : Colors,
                                                    size: 30,
                                                  ),
                                                  const SizedBox(
                                                    width: 2,
                                                  ),
                                                  Text(
                                                    appointment.idStatus == 1
                                                        ? "Onaylanan"
                                                        : appointment
                                                                    .idStatus ==
                                                                2
                                                            ? "Bekleyen"
                                                            : appointment
                                                                        .idStatus ==
                                                                    3
                                                                ? "İptal"
                                                                : "",
                                                    style: TextStyle(
                                                      fontSize: Dimensions
                                                          .largeTextSize,
                                                      color: appointment
                                                                  .idStatus ==
                                                              1
                                                          ? Colors.green
                                                          : appointment
                                                                      .idStatus ==
                                                                  2
                                                              ? Colors.yellow
                                                              : appointment
                                                                          .idStatus ==
                                                                      3
                                                                  ? Colors.red
                                                                  : Colors,
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
                                                    appointment.dsProduct ?? "",
                                                    style: CustomStyle
                                                        .defaultStyle,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Visibility(
                                          visible: appointment.idStatus != 3,
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.of(context)
                                                            .push(
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        AdmissionEditScreen(
                                                                  appointment
                                                                      .dsGuidId,
                                                                  appointment,
                                                                  vm.customerDetail
                                                                      .dsGuidId,
                                                                  widget
                                                                      .patientGuid,
                                                                ),
                                                              ),
                                                            )
                                                            .then(
                                                              (value) =>
                                                                  setState(
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
                                                              "Randevu iptal edilecek onaylıyor musunuz?",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      Dimensions
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
                                                                              .updateAdmissionStatus(
                                                                        UpdateAdmissionStatusRequest(
                                                                          idPatientAdmission:
                                                                              appointment.idPatientAdmission,
                                                                          idCustomer: vm
                                                                              .customerDetail
                                                                              .idCustomer,
                                                                          dsGuidId:
                                                                              appointment.dsGuidId,
                                                                          idAdmissionType:
                                                                              appointment.idAdmissionType,
                                                                          idCompany: vm
                                                                              .customerDetail
                                                                              .idCompany,
                                                                          idPatient:
                                                                              appointment.idPatient,
                                                                          idUser:
                                                                              appointment.idUser,
                                                                          dsUser:
                                                                              appointment.dsUser,
                                                                          idStatus:
                                                                              3,
                                                                          dsNote:
                                                                              "",
                                                                          dsPeriod:
                                                                              appointment.dsPeriod,
                                                                          dsProduct:
                                                                              appointment.dsProduct,
                                                                          dsTreatment:
                                                                              appointment.dsTreatment,
                                                                          idRefDocument:
                                                                              appointment.idRefDocument,
                                                                          idVaccient:
                                                                              appointment.idVaccient,
                                                                          mtTotal:
                                                                              appointment.mtTotal,
                                                                          mtRemainingDebt:
                                                                              appointment.mtRemainingDebt,
                                                                          dsJson:
                                                                              appointment.dsJson,
                                                                          dsAdmissionTime:
                                                                              appointment.dsAdmissionTime,
                                                                          flDetail:
                                                                              false,
                                                                        ),
                                                                      );

                                                                      if (result) {
                                                                        Fluttertoast
                                                                            .showToast(
                                                                          msg:
                                                                              "Randevu iptal edildi",
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
                                                                            Dimensions.largeTextSize,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            20,
                                                                        left:
                                                                            40),
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        "Hayır",
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.red,
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
                                                          Icons.close,
                                                          color: CustomColor
                                                              .redColor,
                                                          size: 25,
                                                        ),
                                                        Text(
                                                          "İptal Et",
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
                                        ),
                                      ],
                                    ),
                                  ],
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
            ),  bottomNavigationBar: BottomAppBar(
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
          ),
        );
      },
    );
  }
}
