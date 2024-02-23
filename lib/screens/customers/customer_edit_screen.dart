// ignore_for_file: prefer_conditional_assignment, no_logic_in_create_state, prefer_if_null_operators
import 'package:bltvt_mobile_veterinary/data/responses/update_customer_response.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_widget.dart';
import 'package:bltvt_mobile_veterinary/screens/customers/customer_edit_screen_view_model.dart';
import 'package:bltvt_mobile_veterinary/screens/customers/customer_profile_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/patients/patient_edit_screen.dart';
import 'package:bltvt_mobile_veterinary/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: must_be_immutable
class CustomerEditScreen extends StatelessWidget {
  String guid = '';
  final _keyForm = GlobalKey<FormState>();

  CustomerEditScreen(this.guid, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<CustomerEditScreenViewModel>(
      viewModelBuilder: (p0) => CustomerEditScreenViewModel(guid),
      builder: (context, vm) {
        return DefaultTabController(
          length: 3,
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
                  if (vm.customer.dsFirstName == null)
                    vm.customer.dsFirstName = '';
                  if (vm.customer.dsLastName == null)
                    vm.customer.dsLastName = '';
                  if (vm.customer.dsCity == null) vm.customer.dsCity = '';
                  if (vm.customer.dsTaxOffice == null)
                    vm.customer.dsTaxOffice = '';
                  if (vm.customer.identityNo == null)
                    vm.customer.identityNo = '';
                  if (vm.customer.dsPhoneNo == null) vm.customer.dsPhoneNo = '';
                  if (vm.customer.dsPhoneNo2 == null)
                    vm.customer.dsPhoneNo2 = '';
                  if (vm.customer.dsEmail == null) vm.customer.dsEmail = '';
                  if (vm.customer.mtDiscountRate == null)
                    vm.customer.mtDiscountRate = 0;
                  if (vm.customer.dsNote == null) vm.customer.dsNote = '';
                  if (vm.customer.dsAddress == null) vm.customer.dsAddress = '';

                  var result = UpdateCustomerResponse();

                  if (flValid) {
                    if (guid == '') {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PatientEditScreen('', '',
                              vm.customer.idCustomer, vm.customer, true),
                        ),
                      );
                    } else {
                      result = await vm.saveCustomer();

                      if (result.dsGuidId != null) {
                        Fluttertoast.showToast(
                          msg: "Müşteri kaydedildi",
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 20,
                          toastLength: Toast.LENGTH_LONG,
                        );

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CustomerProfileScreen(guid)));
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
                    vm.refreshState();
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
                      text: "İLETİŞİM",
                    ),
                    Tab(
                      text: "DİĞER",
                    ),
                  ],
                ),
                title: const Text('Müşteri Bilgileri'),
                flexibleSpace: Image(
                image: AssetImage("assets/images/appbar1.jpg"),
                fit: BoxFit.cover,
              ),
              ),
              body: TabBarView(
                children: [
                  TabPage1(vm),
                  TabPage2(vm),
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
  final CustomerEditScreenViewModel vm;

  const TabPage1(this.vm, {Key key}) : super(key: key);

  @override
  State<TabPage1> createState() => _TabPage1State(vm);
}

class _TabPage1State extends State<TabPage1>
    with AutomaticKeepAliveClientMixin {
  CustomerEditScreenViewModel vm;

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
                initialValue: vm.customer.dsFirstName,
                // controller: _name,
                maxLength: 100,
                decoration: const InputDecoration(
                  hintText: 'İsim',
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (val) {
                  if (val.isEmpty) {
                    return "İsim boş olamaz";
                  }

                  widget.vm.customer.dsFirstName = val;
                  return null;
                },
                onSaved: (value) {
                  widget.vm.customer.dsFirstName = value ?? '';
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                initialValue: vm.customer.dsLastName,
                // controller: _name,
                maxLength: 100,
                decoration: const InputDecoration(
                  hintText: 'Soyad',
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (val) {
                  if (val.isEmpty) {
                    return "Soyad boş olamaz";
                  }

                  widget.vm.customer.dsLastName = val;
                  return null;
                },
                onSaved: (value) {
                  widget.vm.customer.dsLastName = value ?? '';
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                initialValue: vm.customer.dsEmail,
                // controller: _name,
                maxLength: 100,
                decoration: const InputDecoration(
                  hintText: 'E-Posta',
                  prefixIcon: Icon(Icons.mail),
                ),
                validator: (val) {
                  widget.vm.customer.dsEmail = val;
                  return null;
                },
                onSaved: (value) {
                  widget.vm.customer.dsEmail = value ?? '';
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                initialValue: vm.customer.dsTaxOffice,
                // controller: _name,
                maxLength: 100,
                decoration: const InputDecoration(
                  hintText: 'Vergi Dairesi',
                  prefixIcon: Icon(Icons.apartment),
                ),
                validator: (val) {
                  widget.vm.customer.dsTaxOffice = val;
                  return null;
                },
                onSaved: (value) {
                  widget.vm.customer.dsTaxOffice = value ?? '';
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                initialValue: vm.customer.identityNo,
                // controller: _name,
                maxLength: 11,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Vergi No',
                  prefixIcon: Icon(Icons.numbers),
                ),
                validator: (val) {
                  widget.vm.customer.identityNo = val;
                  return null;
                },
                onSaved: (value) {
                  widget.vm.customer.identityNo = value ?? '';
                },
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

class TabPage2 extends StatefulWidget {
  final CustomerEditScreenViewModel vm;

  const TabPage2(this.vm, {Key key}) : super(key: key);

  @override
  State<TabPage2> createState() => _TabPage2State(vm);
}

class _TabPage2State extends State<TabPage2>
    with AutomaticKeepAliveClientMixin {
  CustomerEditScreenViewModel vm;

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
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                initialValue: vm.customer.dsPhoneNo,
                // controller: _name,
                maxLength: 100,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: 'Telefon',
                  prefixIcon: Icon(Icons.phone),
                ),
                validator: (val) {
                  if (val.isEmpty) {
                    return "Telefon boş olamaz";
                  }

                  widget.vm.customer.dsPhoneNo = val;
                  return null;
                },
                onSaved: (value) {
                  widget.vm.customer.dsPhoneNo = value ?? '';
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                initialValue: vm.customer.dsPhoneNo2,
                // controller: _name,
                maxLength: 100,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: '2. Telefon',
                  prefixIcon: Icon(Icons.phone),
                ),
                validator: (val) {
                  widget.vm.customer.dsPhoneNo2 = val;
                  return null;
                },
                onSaved: (value) {
                  widget.vm.customer.dsPhoneNo2 = value ?? '';
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                initialValue: vm.customer.dsCity,
                // controller: _name,
                maxLength: 100,
                decoration: const InputDecoration(
                  hintText: 'İl',
                  prefixIcon: Icon(Icons.location_city),
                ),
                validator: (val) {
                  widget.vm.customer.dsCity = val;
                  return null;
                },
                onSaved: (value) {
                  widget.vm.customer.dsCity = value ?? '';
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                initialValue: vm.customer.dsTown,
                // controller: _name,
                maxLength: 100,
                decoration: const InputDecoration(
                  hintText: 'İlçe',
                  prefixIcon: Icon(Icons.location_city),
                ),
                validator: (val) {
                  widget.vm.customer.dsTown = val;
                  return null;
                },
                onSaved: (value) {
                  widget.vm.customer.dsTown = value ?? '';
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                initialValue: vm.customer.dsAddress,
                // controller: _name,
                maxLength: 200,
                keyboardType: TextInputType.multiline,

                decoration: const InputDecoration(
                  hintText: 'Adres',
                  prefixIcon: Icon(Icons.location_on),
                ),
                validator: (val) {
                  widget.vm.customer.dsAddress = val;
                  return null;
                },
                onSaved: (value) {
                  widget.vm.customer.dsAddress = value ?? '';
                },
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
  final CustomerEditScreenViewModel vm;

  const TabPage3(this.vm, {Key key}) : super(key: key);

  @override
  State<TabPage3> createState() => _TabPage3State(vm);
}

class _TabPage3State extends State<TabPage3>
    with AutomaticKeepAliveClientMixin {
  CustomerEditScreenViewModel vm;
  String selectedGroup = '';
  _TabPage3State(this.vm);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      // child: Text("Page 1")
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            
         
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                initialValue: vm.customer.mtDiscountRate == null
                    ? ""
                    : vm.customer.mtDiscountRate.toString(),
                // controller: _name,
                maxLength: 3,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Uygulanacak İskonto',
                  prefixIcon: Icon(Icons.discount),
                ),
                validator: (val) {
                  if (widget.vm.customer.mtDiscountRate != null) {
                    widget.vm.customer.mtDiscountRate = int.parse(val);
                  }
                  return null;
                },
                onSaved: (value) {
                  if (widget.vm.customer.mtDiscountRate != null) {
                    widget.vm.customer.mtDiscountRate = int.parse(value) ?? '';
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                initialValue: vm.customer.dsNote,
                // controller: _name,
                maxLength: 100,
                keyboardType: TextInputType.multiline,

                decoration: const InputDecoration(
                  hintText: 'Not',
                  prefixIcon: Icon(Icons.note),
                ),
                validator: (val) {
                  widget.vm.customer.dsNote = val;
                  return null;
                },
                onSaved: (value) {
                  widget.vm.customer.dsNote = value ?? '';
                },
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
