import 'package:bltvt_mobile_veterinary/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class RegisteredCustomerScreen extends StatefulWidget {
  String guid = '';

  RegisteredCustomerScreen(this.guid, {Key key}) : super(key: key);

  @override
  _RegisteredCustomerScreenState createState() => _RegisteredCustomerScreenState();
}

class _RegisteredCustomerScreenState extends State<RegisteredCustomerScreen> {
  DateTime selectedDate = DateTime.now();
  TextEditingController customerSearchController = TextEditingController();
  TextEditingController productSearchController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  String selectedTransactionType;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          TypeAheadFormField(
              textFieldConfiguration: TextFieldConfiguration(
              controller: customerSearchController,
              decoration: InputDecoration(
                labelText: 'Hasta Sahibi veya Hasta',
                border: OutlineInputBorder(),
              ),
              ),
            suggestionsCallback: (pattern) async {
            },
            ),
            SizedBox(height: 20),
            TextField(
              readOnly: true,
              onTap: () => _selectDate(context),
              controller: TextEditingController(
                text: DateFormat('dd.MM.yyyy').format(selectedDate.toLocal()),
              ),
              decoration: InputDecoration(
                labelText: 'Satış Tarihi',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: selectedTransactionType,
                      hint: Text("Ödeme Yöntemi Seçiniz"),
                      onChanged: (String newValue) {
                        setState(() {
                          selectedTransactionType = newValue;
                        });
                      },
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 50,
                      underline: SizedBox(),
                      items: <String>[
                        'Nakit Tahsil Et',
                        'Kredi Kartı Tahsil Et',
                        'Banka Havalesi Tahsil Et',
                        'Açık Hesap Kaydet',
                      ].map<DropdownMenuItem<String>>((String value) {
                        IconData icon;
                        if (value == 'Nakit Tahsil Et') {
                          icon = FontAwesomeIcons.moneyBillAlt ;
                        } else if (value == 'Kredi Kartı Tahsil Et') {
                          icon = FontAwesomeIcons.creditCard;
                        } else if (value == 'Banka Havalesi Tahsil Et') {
                          icon = FontAwesomeIcons.creditCard;
                        }else if (value == 'Açık Hesap Kaydet') {
                          icon = FontAwesomeIcons.check;
                        }
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Row(
                            children: [
                              Icon(icon),
                              SizedBox(width: 8),
                              Text(
                                value,
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            TypeAheadFormField(
              textFieldConfiguration: TextFieldConfiguration(
              controller: productSearchController,
              decoration: InputDecoration(
                labelText: 'Ürün Arama',
                border: OutlineInputBorder(),
              ),
              ),
              suggestionsCallback: (pattern) async {
              },
            ),
            SizedBox(height: 20),
            TextField(
              controller: noteController,
              maxLines: 6,
              maxLength: 100,
              decoration: InputDecoration(
                labelText:'Satış Notu' ,
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Center(
                child: ElevatedButton.icon(
                  onPressed:(){},
                  label: Text('KAYDET'),
                  icon: Icon(FontAwesomeIcons.save),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFF5e72e4)),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                   ),
                  ),
               ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildAppBar() {
  return AppBar(
    title: const Text("Kayıtlı Müşteriye Satış"),
    backgroundColor: CustomColor.primaryColor,
    centerTitle: true,
    flexibleSpace: Image(
      image: AssetImage("assets/images/appbar1.jpg"),
      fit: BoxFit.cover,
    ),
  );
}