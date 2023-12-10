import 'package:bltvt_mobile_veterinary/data/requests/get_sms_balance_request.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_company_parameter_values_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_dashboards_response.dart';
import 'package:bltvt_mobile_veterinary/data/responses/get_sms_settings_response.dart';
import 'package:bltvt_mobile_veterinary/screens/_base/base_view_model.dart';
import 'package:bltvt_mobile_veterinary/services/general_api_service.dart';

class MainMenuViewModel extends BaseViewModel {
  double smsBalance;
  GetSmsSettingsResponse smsSettings;
  List<GetCompanyParameterValues> companyParameters;
  GetDashboardsResponse dashboardsResponse;

  @override
  void init() async {
    companyParameters = await apiService.getCompanyParameters();
    smsSettings = await apiService
        .getSmsSettings(companyParameters.where((element) => element.idCompanyParameter == 2).first.mtValue);
    smsBalance = await apiService.getSmsBalance(GetSmsBalanceRequest(
        username: smsSettings.dsUserName, password: smsSettings.dsPassword, idProvider: smsSettings.idProvider));
    dashboardsResponse = await apiService.getDashboards();
  }
}
