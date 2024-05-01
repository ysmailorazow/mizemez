import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/local/key_value_storage_service.dart';
import '../../../core/states/statefull_data.dart';

import '../../../utils/show_snack.dart';
import '../../../utils/validator.dart';
import '../../account/controllers/auth_controller.dart';
import '../../account/repository/auth_repository.dart';
import '../models/login/login_account.dart';

class LoginController extends GetxController {
  final AuthRepository repository;
  final GlobalKey<FormState> key;
  final KeyValueStorageService _keyValueStorageService;

  LoginController(this.repository, this.key, this._keyValueStorageService);

  late final TextEditingController phoneController;
  late final TextEditingController passwordController;
  late final FocusNode phoneFocus;
  late final FocusNode passwordFocus;
  // bool isLoading = false;
  bool obscureText = true;

  StatefulData state = StatefulData.empty();

  final authController = Get.find<AuthController>();

  @override
  void onInit() {
    phoneController = TextEditingController();
    passwordController = TextEditingController();

    phoneFocus = FocusNode();
    passwordFocus = FocusNode();
    super.onInit();
  }

  void _updateToken(String newToken) {
    _keyValueStorageService.setAuthToken(newToken);
  }

  void onObscureTapped() {
    obscureText = !obscureText;
    update();
  }

  Future<LoginAccount> _addToModel() async {
    return LoginAccount(
      phone: phoneController.text,
      password: passwordController.text,
    );
  }

  void onLoginTap() async {
    if (key.currentState?.validate() ?? false) {
      state = StatefulData.loading();

      key.currentState!.save();
      update();

      final account = await _addToModel();
      await repository
          .loginUser(data: account.toJson(), updateTokenCallback: _updateToken)
          .then((value) {
        state = StatefulData.completed(null);
        authController.onAccountUpdate(value,
            // passwordController.text
        );
        ShowSnack.showSnack(r'login_success'.tr, SnackType.success);
      }).catchError((e) {
        state = StatefulData.error(e);
        update();
        ShowSnack.showSnack(r'error'.tr, SnackType.error);

        debugPrint(e.toString());
      });
    }
  }

  String? validatePhone() {
    if (phoneController.text.isEmpty) {
      return 'fill_field'.tr;
    } else if (!Validator.matchPhoneNumberWithoutPrefix(phoneController.text)) {
      return 'input_correct_number'.tr;
    }
    return null;
  }

  String? validatePassword() {
    if (passwordController.text.isEmpty) {
      return 'fill_field'.tr;
    } else if (passwordController.text.length < 8) {
      return 'password_must_be_8_chars'.tr;
    }
    return null;
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();

    phoneFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }
}
