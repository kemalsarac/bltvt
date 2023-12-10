import 'package:bltvt_mobile_veterinary/data/responses/login_response.dart';
import 'package:bltvt_mobile_veterinary/services/general_api_service.dart';
import 'package:bltvt_mobile_veterinary/services/local_storage_service.dart';

final AuthenticationService authenticationService = AuthenticationService._();

class AuthenticationService {
  LoginResponse account;

  AuthenticationService._();

  Future<bool> hasToken() async {
    account = await localStorageService.getCredentialAccounts();
    return ((account.token.length) ?? 0) > 0;
  }

  Future<LoginResponse> login(String email, String password) async {
    var result = await apiService.login(email, password);

    if (result.flActive && result.idCompany != null) {
      account = result;
      localStorageService.saveCredentialAccounts(account);
      account = result;
    }

    return result;
  }
}
