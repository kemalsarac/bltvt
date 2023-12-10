/* import 'dart:async';
import 'package:bltvt_mobile_veterinary/data/responses/get_dashboards_appointments_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/search_calendar_response.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_view_model.dart';
import 'package:bltvt_mobile_veterinary/services/general_api_service.dart';

class MoreAdmissionsScreenViewModel extends BaseViewModel {
  List<SearchCalendarResponse> dashboardsAppointments;
  

  @override
  FutureOr<void> init() async {
    dashboardsAppointments = await apiService.getSearchCalendarResults();
  }

  List<SearchCalendarResponse> getAppointmentsLast30Days() {
    DateTime now = DateTime.now();
    DateTime thirtyDaysAgo = now.subtract(Duration(days: 30));
    List<SearchCalendarResponse> appointmentsLast30Days = [];

    for (var appointment in dashboardsAppointments) {
      DateTime appointmentDate = DateTime.tryParse(appointment.dtAdmissionTime);
      if (appointmentDate != null &&
          appointmentDate.isAfter(thirtyDaysAgo) &&
          appointmentDate.isBefore(now)) {
        appointmentsLast30Days.add(appointment);
      }
    }

    return appointmentsLast30Days;
  }
} */
