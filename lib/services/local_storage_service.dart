import 'dart:convert';
import 'package:bltvt_mobile_veterinary/data/responses/login_response.dart';
import 'package:localstorage/localstorage.dart';

LocalStorageService localStorageService = LocalStorageService._();

class LocalStorageService {
  static const String _credentialAccountsFilename = "credential_accounts_content.json";
  static const String _credentialAccountsContentKey = "credential_accounts_content";

  final LocalStorage storage = LocalStorage('localstorage_app');

  LocalStorageService._();

  LocalStorage _credentialAccountsStorage;

  Future<LocalStorage> getCredentialAccountsStorage() async {
    // ignore: prefer_conditional_assignment
    if (_credentialAccountsStorage == null) {
      _credentialAccountsStorage = LocalStorage(_credentialAccountsFilename);
    }

    var storageReady = await _credentialAccountsStorage.ready;
    return storageReady ? _credentialAccountsStorage : null;
  }

  Future saveCredentialAccounts(LoginResponse credentialAccounts) async {
    var credentialAccountsStorage = await getCredentialAccountsStorage();
    if (credentialAccountsStorage != null) {
      return credentialAccountsStorage.setItem(_credentialAccountsContentKey, json.encode(credentialAccounts));
    }
  }

  Future<LoginResponse> getCredentialAccounts() async {
    var accounts = LoginResponse();
    var credentialAccountsStorage = await getCredentialAccountsStorage();

    if (credentialAccountsStorage != null) {
      dynamic content = credentialAccountsStorage.getItem(_credentialAccountsContentKey);
      accounts = LoginResponse.fromJson(json.decode(content));
      return accounts;
    }
    return LoginResponse();
  }
}
