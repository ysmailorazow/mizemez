import 'dart:async';

import '../../../core/control_state_variable_mixin.dart';
import '../../../core/local/key_value_storage_service.dart';
import '../../../core/networking/custom_exception.dart';
import '../../../core/states/statefull_data.dart';
import 'package:get/get.dart';

import '../models/account.dart';
import '../repository/auth_repository.dart';
import 'account_status_controller.dart';

class AuthController extends GetxController with StateControlMixin {
  Account account = const Account();
  final _accountLoginStatusController =
      Get.put(AccountLoginStatusController(), permanent: true);

  final _keyValueStorageService = KeyValueStorageService();
  final AuthRepository _authRepository;

  StatefulData<Account> state = StatefulData.empty();

  void onAccountUpdate(Account account) {
    state = StatefulData.completed(account);
    status = Status.loading;
    this.account = account;
    _keyValueStorageService.setAuthUser(account);
    _keyValueStorageService.setAuthPassword(account.password ?? '');
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
        _accountLoginStatusController.getAccountStatus(state);
        update();
      }).onError((error, stackTrace) {
        state = StatefulData.error(error);
        _accountLoginStatusController.getAccountStatus(state);
        update();
      });
    } else {
      _accountLoginStatusController.getAccountStatus(
          StatefulData.error(ExceptionType.UnauthorizedException));
      update();
    }
  }

  void logout() {
    _keyValueStorageService.resetKeys();
    _accountLoginStatusController.getAccountStatus(
      StatefulData.error(ExceptionType.UnauthorizedException),
    );
    update();
  }

  @override
  void onInit() {
    getAccount();
    super.onInit();
  }
}
