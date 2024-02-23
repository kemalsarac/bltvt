import 'package:bltvt_mobile_veterinary/data/responses/get_appointment_by_id_patient_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/save_appointment_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/save_patient_response.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_widget.dart';
import 'package:bltvt_mobile_veterinary/screens/admissions/admission_test_screen_view.dart';
import 'package:bltvt_mobile_veterinary/utils/colors.dart';
import 'package:bltvt_mobile_veterinary/utils/custom_style.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class AdmissionTestScreen extends StatefulWidget {
  final String admissionGuid, customerGuid, patientGuid, patientName;
  final GetAppointmentByIdPatientResponse selectedAppointment;

  String _selectedPatient;
  String get selectedPatient => _selectedPatient;

  AdmissionTestScreen(
    this.patientName,
    this.admissionGuid,
    this.selectedAppointment,
    this.customerGuid,
    this.patientGuid,
    String dsPatientName, {
    Key key,
  })  : _selectedPatient = dsPatientName,
        super(key: key);

  @override
  _AdmissionTestScreenState createState() => _AdmissionTestScreenState();
}

class _AdmissionTestScreenState extends State<AdmissionTestScreen> {
  String selectedOption;
  String selectedPatient;
  @override
  Widget build(BuildContext context) {
    return BaseWidget<AdmissionEditTestScreenViewModel>(
      viewModelBuilder: (p0) => AdmissionEditTestScreenViewModel(
        widget.admissionGuid,
        widget.selectedAppointment,
        widget.customerGuid,
        widget.patientGuid,
      ),
      builder: (context, vm) {
        return DefaultTabController(
          length: 1,
          initialIndex: 0,
          child: Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () async {
                var result = SaveAppointmentResponse();
                if (vm.customerDetail.patients != null) {
                  Fluttertoast.showToast(
                    msg: "randevu kaydedildi",
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 20,
                    toastLength: Toast.LENGTH_LONG,
                  );
                  Navigator.pop(context);
                  vm.refreshState();
                }
                if (widget.admissionGuid != '') {
                  await vm.updateAppointment();
                } else {
                  await vm.saveAppointment();
                }
              },
              backgroundColor: CustomColor.primaryColor,
              label: const Text("KAYDET"),
              icon: const Icon(
                Icons.save,
                color: Colors.white,
                size: 30,
              ),
            ),
            appBar: AppBar(
              backgroundColor: CustomColor.primaryColor,
              bottom: const TabBar(
                labelColor: Colors.white,
                indicatorColor: CustomColor.primaryColor,
                tabs: [
                  Tab(
                    text: "DETAYLAR",
                  ),
                ],
              ),
              title: const Text('Randevu Bilgileri'),
              flexibleSpace: Image(
                image: AssetImage("assets/images/appbar1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: TabBarView(
                    children: [
                      TabPage1(vm, widget.patientName),
                      //TabPage2(vm),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class TabPage1 extends StatefulWidget {
  final AdmissionEditTestScreenViewModel vm;
  final String selectedPatient;

  const TabPage1(this.vm, this.selectedPatient, {Key key}) : super(key: key);

  @override
  State<TabPage1> createState() =>
      _TabPage1State(vm, selectedPatient: selectedPatient);
}

class _TabPage1State extends State<TabPage1>
    with AutomaticKeepAliveClientMixin {
  AdmissionEditTestScreenViewModel vm;
  String selectedPatient;

  _TabPage1State(this.vm, {this.selectedPatient});

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Hasta Seçimi:",
                          style: CustomStyle.kTitleStyle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                   FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        isEmpty: vm.selectedPatient == null ?? true,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: vm.selectedPatient,
                            isDense: true,
                            onChanged: (String newValue) async {
                              if (newValue != null) {
                                setState(() {
                                  vm.selectedPatient = newValue;
                                  state.didChange(newValue);
                                  vm.refreshState();
                                });
                              }
                            },
                            items: vm.customerPatients
                                .map((SavePatientResponse data) {
                              return DropdownMenuItem<String>(
                                value: data.dsGuidId.toString(),
                                child: Text(
                                  data.dsPatientName,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            //
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Randevu Türü:",
                          style: CustomStyle.kTitleStyle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        isEmpty: vm.selectedAdmissionType == null ?? true,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: vm.selectedAdmissionType,
                            isDense: true,
                            onChanged: (String newValue) async {
                              setState(() {
                                vm.selectedAdmissionType = newValue;
                                state.didChange(newValue);
                                vm.refreshState();
                              });
                            },
                            items: vm.admissionTypes.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Randevu Tarihi:",
                          style: CustomStyle.kTitleStyle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    onPressed: () async {
                      final DateTime picked = await showDatePicker(
                        context: context,
                        initialDate: vm.pickerDate,
                        firstDate: DateTime(1970),
                        lastDate: DateUtils.dateOnly(
                            DateTime.now().add(const Duration(days: 365))),
                        initialEntryMode: DatePickerEntryMode.calendarOnly,
                        confirmText: "Seç",
                        cancelText: "Kapat",
                        builder: (context, child) {
                          return Theme(
                            data: ThemeData.light().copyWith(
                              primaryColor: CustomColor.primaryColor,
                              buttonTheme: const ButtonThemeData(
                                textTheme: ButtonTextTheme.primary,
                              ),
                              colorScheme: const ColorScheme.light(
                                primary: CustomColor.primaryColor,
                              ).copyWith(
                                secondary: CustomColor.primaryColor,
                              ),
                            ),
                            child: child,
                          );
                        },
                      );
                      if (picked != null && picked != vm.pickerDate) {
                        setState(() {
                          vm.pickerDate = picked;
                          vm.saveRequest.dsTime = picked.timeZoneName;
                        });
                      }
                    },
                    height: 60,
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(
                        width: 0,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    minWidth: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat("dd/MM/y")
                              .format(vm.pickerDate)
                              .toString(),
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        const Icon(
                          Icons.chevron_right_rounded,
                          size: 40,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: vm.selectedAdmissionType == "Aşı" ? true : false,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Aşı Seçimi:",
                            style: CustomStyle.kTitleStyle,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FormField<String>(
                      builder: (FormFieldState<String> state) {
                        return InputDecorator(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          isEmpty: vm.selectedVaccine == null ?? true,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: vm.selectedVaccine,
                              isDense: true,
                              onChanged: (String newValue) async {
                                setState(() {
                                  vm.selectedVaccine = newValue;
                                  state.didChange(newValue);
                                  vm.refreshState();
                                });
                              },
                              items: vm.productList
                                  .map<DropdownMenuItem<String>>((product) {
                                return DropdownMenuItem<String>(
                                  value: product.dsProduct,
                                  child: Text(
                                    product.dsProduct,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        );
                      }, //onSaved: (value) {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

/*class TabPage2 extends StatefulWidget {
  final AdmissionEditScreenViewModel vm;

  const TabPage2(this.vm, {Key key}) : super(key: key);

  @override
  State<TabPage2> createState() => _TabPage2State(vm);
}

class _TabPage2State extends State<TabPage2>
    with AutomaticKeepAliveClientMixin {
  AdmissionEditScreenViewModel vm;

  _TabPage2State(this.vm);

  @override
  Widget build(BuildContext context) {
   super.build(context);
    return Center(
      // child: Text("Page 1")
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: ColoredBox(
                color: Colors.green,
                child: Material(
                  child: CheckboxListTile(
                    tileColor: CustomColor.accentColor,
                    title: const Text('Ruminant'),
                    value: true,
                    onChanged: (bool value) {},
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true; 
} */
