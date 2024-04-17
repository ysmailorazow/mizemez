import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/control_state_variable_mixin.dart';
import '../../../core/local/key_value_storage_service.dart';
import '../../../core/networking/custom_exception.dart';
import '../../../core/states/statefull_data.dart';
import '../../../utils/show_snack.dart';
import '../models/account.dart';
import '../repository/auth_repository.dart';
import 'account_status_controller.dart';

class AuthController extends GetxController
    with ControlStateMixinVariables<Account> {
  Account account = const Account();
  final _accountLoginStatusController =
      Get.put(AccountLoginStatusController(), permanent: true);

  final _keyValueStorageService = KeyValueStorageService();
  final AuthRepository _authRepository;

  void onAccountUpdate(Account account, String password) {
    state = StatefulData.completed(account);
    this.account = account;
    _keyValueStorageService.setAuthUser(account);
    _keyValueStorageService.setAuthPassword(password);
    update();
    _accountLoginStatusController.getAccountStatus(state);
  }

  AuthController({required AuthRepository authRepository})
      : _authRepository = authRepository;

  void getAccount() async {
    if ((await _keyValueStorageService.getAuthToken()).isNotEmpty) {
      state = StatefulData.loading();
      _accountLoginStatusController.getAccountStatus(state);
      update();
      _authRepository.getAccount().then((value) {
        state = StatefulData.completed(value);
        account = value;
        update();
        _accountLoginStatusController.getAccountStatus(state);
      }).onError((error, stackTrace) {
        state = StatefulData.error(error);
        update();
        _accountLoginStatusController.getAccountStatus(state);
        debugPrint(error.toString());
      });
    } else {
      _accountLoginStatusController.getAccountStatus(
          StatefulData.error(ExceptionType.UnauthorizedException));
    }
  }

  void logout() {
    _keyValueStorageService.resetKeys();
    _accountLoginStatusController.getAccountStatus(
        StatefulData.error(ExceptionType.UnauthorizedException));
    ShowSnack.showSnack(r'logout_success'.tr, SnackType.warning);
    update();
  }

  @override
  void onInit() {
    getAccount();
    super.onInit();
  }
}
