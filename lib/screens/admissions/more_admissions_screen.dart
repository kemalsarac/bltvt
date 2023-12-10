/* import 'package:bltvt_mobile_veterinary/data/responses/get_dashboards_appointments_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/search_calendar_response.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_widget.dart';
import 'package:bltvt_mobile_veterinary/screens/admissions/more_admissions_screen_view_model.dart';
import 'package:bltvt_mobile_veterinary/utils/colors.dart';
import 'package:bltvt_mobile_veterinary/utils/custom_style.dart';
import 'package:bltvt_mobile_veterinary/utils/dimensions.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class MoreAdmissionsScreen extends StatefulWidget {
  const MoreAdmissionsScreen({Key key}) : super(key: key);

  @override
  State<MoreAdmissionsScreen> createState() => _MoreAdmissionsScreenState();
}

class _MoreAdmissionsScreenState extends State<MoreAdmissionsScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<MoreAdmissionsScreenViewModel>(
      viewModelBuilder: (p0) => MoreAdmissionsScreenViewModel(),
      builder: (context, vm) {
        List<SearchCalendarResponse> appointmentsLast30Days =
            vm.getAppointmentsLast30Days();
        return Scaffold(
          appBar: AppBar(
            title: const Text("Son 30 Günlük Randevular"),
            backgroundColor: CustomColor.primaryColor,
          ),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: appointmentsLast30Days.length,
              itemBuilder: (context, index) {
                SearchCalendarResponse appointment =
                    appointmentsLast30Days[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
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
                                    (appointment.dsCustomerAndPatient ?? "").length > 15
                                        ? "${appointment.dsCustomerAndPatient.substring(0, 15)}..."
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
                                    appointment.dsCustomerAndPatient ?? "",
                                    style: CustomStyle.textStyle,
                                  ),
                                ],
                              ),
                              Visibility(
                                  visible: appointment.. == 1,
                                  child: const SizedBox(
                                    height: 5,
                                  )),
                              Visibility(
                                visible: appointment.idSmsStatus == 1,
                                child: Row(
                                  children: [
                                    Text(
                                      "SMS Gönderilmeyi Bekliyor",
                                      style: TextStyle(
                                        fontSize: Dimensions.defaultTextSize,
                                        color: Colors.amber[700],
                                      ),
                                    ),
                                  ],
                                ),
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
                                                appointment.dtAdmission))
                                            .toString() ??
                                        "",
                                    style: CustomStyle.defaultStyle,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    appointment.dsProduct ?? "",
                                    style: CustomStyle.textStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
*/