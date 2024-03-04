import 'dart:ui';

import 'package:bltvt_mobile_veterinary/data/responses/get_appointment_by_id_patient_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/search_calendar_response.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_widget.dart';
import 'package:bltvt_mobile_veterinary/screens/admissions/admission_edit_screen.dart';
import 'package:bltvt_mobile_veterinary/screens/admissions/admissions_screen_view_model.dart';
import 'package:bltvt_mobile_veterinary/utils/colors.dart';
import 'package:bltvt_mobile_veterinary/utils/custom_style.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class AdmissionsScreen extends StatelessWidget {
  const AdmissionsScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<AdmissionsScreenViewModel>(
      viewModelBuilder: (p0) => AdmissionsScreenViewModel(),
      builder: (context, vm) {
        return DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Scaffold(
            
            appBar: AppBar(
              title: const Text("Gelecek Randevular"),
              backgroundColor: CustomColor.primaryColor,
              bottom: const TabBar(
                labelColor: Colors.white,
                indicatorColor: CustomColor.primaryColor,
                
                tabs: [
                  Tab(
                    text: "Gelecek Randevular",
                  ),
                  Tab(
                    text: "Geçmiş Randevular",
                  ),
                ],
              ),
              flexibleSpace: Image(
                image: AssetImage("assets/images/appbar1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            body: Column(
              children: [
                SearchTextWidget(vm),
                Expanded(
                  child: TabBarView(
                    children: [
                      TabPage1(vm),
                      TabPage2(vm),
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

class SearchTextWidget extends StatelessWidget {
  final AdmissionsScreenViewModel vm;

  SearchTextWidget(this.vm);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
      child: Container(
        width: 320.0,
        height: 35.0,
        child: TextField(
          controller: vm.searchController,
          decoration: InputDecoration(
            hintText: 'Kullanıcı Adı Ara...',
            hintStyle: TextStyle(color: Color.fromARGB(133, 57, 57, 57)),
            prefixIcon:
                Icon(Icons.search, color: Color.fromARGB(133, 57, 57, 57)),
            contentPadding: EdgeInsets.symmetric(vertical: 0.01),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          onChanged: vm.filterAppointmentsByUserName,
        ),
      ),
    );
  }
}

class TabPage1 extends StatefulWidget {
  final AdmissionsScreenViewModel vm;
  final String patientGuid;
  final SearchCalendarResponse appointment;
  final bool isRandevuOnaylandi;

  const TabPage1(this.vm,
      {Key key, this.patientGuid, this.appointment, this.isRandevuOnaylandi})
      : super(key: key);

  @override
  State<TabPage1> createState() => _TabPage1State();
}

class _TabPage1State extends State<TabPage1>
    with AutomaticKeepAliveClientMixin
     {
  AdmissionsScreenViewModel vm;
  List<bool> isRandevuOnaylandiList;

  

  @override
  Widget build(BuildContext context) {
    super.build(context);
    List<SearchCalendarResponse> futureAppointments =
        vm.getFutureAppointments() ;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: futureAppointments.length,
        itemBuilder: (context, index) {
          SearchCalendarResponse appointment = futureAppointments[index];

          return Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isRandevuOnaylandiList[index] =
                      !isRandevuOnaylandiList[index];
                });
              },
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
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                (appointment.dsCustomerAndPatient ?? "")
                                            .length >
                                        13
                                    ? "${appointment.dsCustomerAndPatient.substring(0, 11)}..."
                                    : appointment.dsCustomerAndPatient,
                                style: CustomStyle.defaultStyle,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                "Telefon:" + appointment.dsPhoneNo ?? "",
                                style: CustomStyle.textStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                DateFormat("dd/MM/y")
                                    .format(DateTime.tryParse(
                                            appointment.dtAdmissionDate) ??
                                        DateTime.now())
                                    .toString(),
                                style: CustomStyle.defaultStyle,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                   
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}


class TabPage2 extends StatefulWidget {
  final AdmissionsScreenViewModel vm;

  const TabPage2(this.vm, {Key key}) : super(key: key);

  @override
  State<TabPage2> createState() => _TabPage2State(vm);
}

class _TabPage2State extends State<TabPage2>
    with AutomaticKeepAliveClientMixin {
  AdmissionsScreenViewModel vm;

  _TabPage2State(this.vm);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    List<SearchCalendarResponse> pastAppointments = vm.getPastAppointments();
    pastAppointments.sort((a, b) {
      DateTime dateA = DateTime.tryParse(a.dtAdmissionDate);
      DateTime dateB = DateTime.tryParse(b.dtAdmissionDate);
      if (dateA == null || dateB == null) {
        return 0;
      }
      return dateB.compareTo(dateA);
    });

    return Padding(
      padding: const EdgeInsets.all(15),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: pastAppointments.length,
        itemBuilder: (context, index) {
          SearchCalendarResponse appointment = pastAppointments[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: GestureDetector(
              onTap: () {
             
              },
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
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                (appointment.dsCustomerAndPatient ?? "")
                                            .length >
                                        13
                                    ? "${appointment.dsCustomerAndPatient.substring(0, 13)}..."
                                    : appointment.dsCustomerAndPatient,
                                style: CustomStyle.defaultStyle,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                "Telefon:" + appointment.dsPhoneNo ?? "",
                                style: CustomStyle.textStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                DateFormat("dd/MM/y")
                                    .format(DateTime.tryParse(
                                            appointment.dtAdmissionDate) ??
                                        DateTime.now())
                                    .toString(),
                                style: CustomStyle.defaultStyle,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
