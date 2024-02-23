// ignore_for_file: prefer_conditional_assignment, no_logic_in_create_state, prefer_if_null_operators, use_build_context_synchronously
import 'package:bltvt_mobile_veterinary/data/requests/save_customer_request.dart';
import 'package:bltvt_mobile_veterinary/data/responses/save_patient_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/update_customer_response.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_widget.dart';
import 'package:bltvt_mobile_veterinary/screens/customers/customer_profile_screen.dart';
import 'package:bltvt_mobile_veterinary/utils/custom_style.dart';
import 'patient_edit_screen_view_model.dart';
import 'package:bltvt_mobile_veterinary/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class PatientEditScreen extends StatelessWidget {
  String customerGuid = '';
  String patientGuid = '';
  int idCustomer;
  SaveCustomerRequest customer;
  bool isContinue;

  final _keyForm = GlobalKey<FormState>();

  PatientEditScreen(this.customerGuid, this.patientGuid, this.idCustomer,
      this.customer, this.isContinue,
      {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<PatientEditScreenViewModel>(
      viewModelBuilder: (p0) => PatientEditScreenViewModel(
          customerGuid, patientGuid, idCustomer, customer, isContinue),
      builder: (context, vm) {
        return DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Form(
            key: _keyForm,
            child: Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: FloatingActionButton.extended(
                onPressed: () async {
                  var flValid = _keyForm.currentState.validate();
                  _keyForm.currentState.save();

                  if (vm.patient.dsPatientName == null)
                    vm.patient.dsPatientName = '';
                  if (vm.patient.idType == null) vm.patient.idType = 0;
                  if (vm.patient.idCustomer == null)
                    vm.patient.idCustomer = idCustomer;
                  // if (vm.patient.idSpecies == null) vm.patient.idSpecies = 0;
                  // if (vm.patient.idColor == null) vm.patient.idColor = 0;
                  // if (vm.patient.dtBirthDate == null) vm.patient.dtBirthDate = '';
                  // if (vm.patient.dsCarneNo == null) vm.patient.dsCarneNo = '';
                  // if (vm.patient.dsChipNo == null) vm.patient.dsChipNo = '';
                  // if (vm.patient.dsNote == null) vm.patient.dsNote = '';
                  // if (vm.patient.dsPatientSpecialStatus == null) vm.patient.dsPatientSpecialStatus = '';
                  // if (vm.patient.idGender == null) vm.patient.idGender = 0;

                  var result = SavePatientResponse();
                  var customerResult = UpdateCustomerResponse();

                  if (flValid) {
                    if (isContinue) {
                      customerResult = await vm.saveCustomerAndPatient();
                    } else {
                      result = await vm.savePatient();
                    }

                    if (result.dsGuidId != null ||
                        customerResult.dsGuidId != null) {
                      if (isContinue) {
                        Fluttertoast.showToast(
                          msg: "Müşteri kaydedildi",
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 20,
                          toastLength: Toast.LENGTH_LONG,
                        );
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                CustomerProfileScreen(customerResult.dsGuidId),
                          ),
                        );
                      } else {
                        Fluttertoast.showToast(
                          msg: "Hasta kaydedildi",
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 20,
                          toastLength: Toast.LENGTH_LONG,
                        );
                        Navigator.pop(context);
                        vm.refreshState();

                        /* Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PatientProfileScreen(customer, result.dsGuidId),
                          ),
                        ); */
                      }
                      vm.refreshState();
                    } else {
                      if (isContinue) {
                        for (var element in customerResult.messageList) {
                          Fluttertoast.showToast(
                            msg: element.message,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 20,
                            toastLength: Toast.LENGTH_LONG,
                          );
                        }
                      } else {
                        for (var element in result.messageList) {
                          Fluttertoast.showToast(
                            msg: element.message,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 20,
                            toastLength: Toast.LENGTH_LONG,
                          );
                        }
                      }
                    }
                  } else {
                    Fluttertoast.showToast(
                      msg: "Lütfen Eksik Bilgileri Doldurunuz!",
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 20,
                      toastLength: Toast.LENGTH_LONG,
                    );
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
                      text: "TANIM",
                    ),
                    Tab(
                      text: "DİĞER",
                    ),
                  ],
                ),
                title: const Text('Hasta Bilgileri'),
                flexibleSpace: Image(
                image: AssetImage("assets/images/appbar1.jpg"),
                fit: BoxFit.cover,
              ),
              ),
              body: TabBarView(
                children: [
                  TabPage1(vm),
                  TabPage3(vm),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class TabPage1 extends StatefulWidget {
  final PatientEditScreenViewModel vm;

  const TabPage1(this.vm, {Key key}) : super(key: key);

  @override
  State<TabPage1> createState() => _TabPage1State(vm);
}

class _TabPage1State extends State<TabPage1>
    with AutomaticKeepAliveClientMixin {
  PatientEditScreenViewModel vm;

  _TabPage1State(this.vm);

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
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                initialValue: vm.patient.dsPatientName,
                // controller: _name,
                maxLength: 100,
                decoration: const InputDecoration(
                  hintText: 'Hasta Adı',
                  prefixIcon: Icon(Icons.pets),
                ),
                validator: (val) {
                  if (val.isEmpty) {
                    return "Hasta Adı boş olamaz";
                  }

                  widget.vm.patient.dsPatientName = val;
                  return null;
                },
                onSaved: (value) {
                  widget.vm.patient.dsPatientName = value ?? '';
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: FormField<String>(
                builder: (FormFieldState<String> state) {
                  return InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    isEmpty: vm.selectedType == null ?? true,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: vm.selectedType,
                        isDense: true,
                        onChanged: (String newValue) async {
                          setState(() {
                            vm.selectedType = newValue;
                            vm.idSpecies = vm.allPatientTypeData
                                .where((element) =>
                                    element.dsPatientType == newValue)
                                .first
                                .idPatientType;
                            state.didChange(newValue);
                          });

                          vm.allSpeciesById = await vm.getSpeciesById();
                          setState(() {
                            vm.refreshState();
                          });
                        },
                        items: vm.allPatientType.map((String value) {
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
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: FormField<String>(
                builder: (FormFieldState<String> state) {
                  return InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    isEmpty: true,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: vm.selectedSpecies,
                        isDense: true,
                        onChanged: (String newValue) {
                          setState(() {
                            vm.selectedSpecies = newValue;
                            vm.idSpecies = vm.allSpeciesByIdData
                                .where(
                                    (element) => element.dsSpecies == newValue)
                                .first
                                .idSpecies;
                            state.didChange(newValue);
                          });
                        },
                        items: vm.allSpeciesById.map((String value) {
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
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: FormField<String>(
                builder: (FormFieldState<String> state) {
                  return InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    isEmpty: vm.selectedColor == null ?? true,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: vm.selectedColor,
                        isDense: true,
                        onChanged: (String newValue) {
                          setState(() {
                            vm.selectedColor = newValue;
                            state.didChange(newValue);
                          });
                        },
                        items: vm.allColor.map((String value) {
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
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: MaterialButton(
                onPressed: () async {
                  final DateTime picked = await showDatePicker(
                    context: context,
                    initialDate: vm.pickerDate,
                    firstDate: DateTime(1970),
                    lastDate: DateUtils.dateOnly(
                        DateTime.now().add(const Duration(days: 1))),
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
                      DateFormat("dd/MM/y").format(vm.pickerDate).toString(),
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
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class TabPage3 extends StatefulWidget {
  final PatientEditScreenViewModel vm;

  const TabPage3(this.vm, {Key key}) : super(key: key);

  @override
  State<TabPage3> createState() => _TabPage3State(vm);
}

class _TabPage3State extends State<TabPage3>
    with AutomaticKeepAliveClientMixin {
  PatientEditScreenViewModel vm;

  _TabPage3State(this.vm);

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
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Karne No:",
                          style: CustomStyle.defaultStyle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  TextFormField(
                    initialValue: vm.patient.dsCarneNo,
                    // controller: _name,
                    maxLength: 50,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Karne No',
                      prefixIcon: Icon(Icons.numbers),
                    ),
                    validator: (val) {
                      widget.vm.patient.dsCarneNo = val;
                      return null;
                    },
                    onSaved: (value) {
                      widget.vm.patient.dsCarneNo = value ?? '';
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
                          "Çip No:",
                          style: CustomStyle.defaultStyle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  TextFormField(
                    initialValue: vm.patient.dsChipNo,
                    // controller: _name,
                    maxLength: 50,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Çip No',
                      prefixIcon: Icon(Icons.numbers),
                    ),
                    validator: (val) {
                      widget.vm.patient.dsChipNo = val;
                      return null;
                    },
                    onSaved: (value) {
                      widget.vm.patient.dsChipNo = value ?? '';
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
                          "Hasta Notu:",
                          style: CustomStyle.defaultStyle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  TextFormField(
                    initialValue: vm.patient.dsNote,
                    // controller: _name,
                    maxLength: 100,
                    keyboardType: TextInputType.multiline,

                    decoration: const InputDecoration(
                      hintText: 'Not',
                      prefixIcon: Icon(Icons.note),
                    ),
                    validator: (val) {
                      widget.vm.patient.dsNote = val;
                      return null;
                    },
                    onSaved: (value) {
                      widget.vm.patient.dsNote = value ?? '';
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
                          "Cinsiyet:",
                          style: CustomStyle.defaultStyle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: RadioListTile(
                          title: const Text("Erkek"),
                          value: "Erkek",
                          groupValue: vm.gender,
                          onChanged: (value) {
                            setState(() {
                              widget.vm.gender = value.toString();
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile(
                          title: const Text("Dişi"),
                          value: "Dişi",
                          groupValue: vm.gender,
                          onChanged: (value) {
                            setState(() {
                              widget.vm.gender = value.toString();
                            });
                          },
                        ),
                      ),
                    ],
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
                          "Hasta Özel Durumu:",
                          style: CustomStyle.defaultStyle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  TextFormField(
                    initialValue: vm.patient.dsPatientSpecialStatus,
                    // controller: _name,
                    maxLength: 100,
                    keyboardType: TextInputType.multiline,

                    decoration: const InputDecoration(
                      hintText: 'Hasta Özel Durumu',
                      prefixIcon: Icon(Icons.note),
                    ),
                    validator: (val) {
                      widget.vm.patient.dsPatientSpecialStatus = val;
                      return null;
                    },
                    onSaved: (value) {
                      widget.vm.patient.dsPatientSpecialStatus = value ?? '';
                    },
                  ),
                ],
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
