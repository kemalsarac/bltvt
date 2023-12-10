import 'dart:async';
import 'package:bltvt_mobile_veterinary/data/requests/save_customer_request.dart';
import 'package:bltvt_mobile_veterinary/data/responses/search_calendar_response.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_view_model.dart';
import 'package:bltvt_mobile_veterinary/services/general_api_service.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_dashboards_appointments_response.dart';
import 'package:flutter/material.dart';

class AdmissionsScreenViewModel extends BaseViewModel {
  String guid;
  TextEditingController searchController = TextEditingController();
  List<SearchCalendarResponse> filteredAppointments = [];
  List<SearchCalendarResponse> appointments = [];
  SaveCustomerRequest customerDetail;

  @override
  FutureOr<void> init() async {
    appointments= await apiService.getSearchCalendarResults();
    filteredAppointments = List.from(appointments);
  }

  void filterAppointmentsByUserName(String userName) {
    if (userName.isEmpty) {
      filteredAppointments = List.from(appointments);
    } else {
      filteredAppointments = appointments
          .where((appointment) => appointment.dsCustomerAndPatient
              .toLowerCase()
              .contains(userName.toLowerCase()))
          .toList();
    }
    refreshState();
  }

  List<SearchCalendarResponse> getFutureAppointments() {
    DateTime now = DateTime.now();
    List<SearchCalendarResponse> futureAppointments = [];

    for (var appointment in filteredAppointments) {
      DateTime appointmentDate = DateTime.tryParse(appointment.dtAdmissionDate);
      if (appointmentDate != null && appointmentDate.isAfter(now)) {
        futureAppointments.add(appointment);
      }
    }

    return futureAppointments;
  }

  List<SearchCalendarResponse > getPastAppointments() {
    DateTime now = DateTime.now();
    List<SearchCalendarResponse > pastAppointments = [];

    for (var appointment in filteredAppointments) {
      DateTime appointmentDate = DateTime.tryParse(appointment.dtAdmissionDate);
      if (appointmentDate != null && appointmentDate.isBefore(now)) {
        pastAppointments.add(appointment);
      }
    }
    pastAppointments.sort((a, b) {
      DateTime dateA = DateTime.tryParse(a.dtAdmissionDate);
      DateTime dateB = DateTime.tryParse(b.dtAdmissionDate);
      if (dateA == null || dateB == null) {
        return 0;
      }
      return dateA.compareTo(dateB);
    });

    return pastAppointments;
  }
}
