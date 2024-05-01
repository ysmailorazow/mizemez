import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/local/key_value_storage_service.dart';
import '../../../core/states/statefull_data.dart';

import '../../../utils/show_snack.dart';
import '../../../utils/validator.dart';
import '../../account/controllers/auth_controller.dart';
import '../../account/repository/auth_repository.dart';
import '../models/register/register_account.dart';

class RegisterController extends GetxController {
  final AuthRepository repository;
  final GlobalKey<FormState> key;
  final KeyValueStorageService _keyValueStorageService;

  RegisterController(this.repository, this.key, this._keyValueStorageService);

  late final TextEditingController nameController;
  late final TextEditingController phoneController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;

  late final FocusNode nameFocus;
  late final FocusNode phoneFocus;
  late final FocusNode passwordFocus;
  late final FocusNode confirmPasswordFocus;
  bool isLoading = false;
  bool obscureText = true;
  bool obscureTextConfirm = true;

  StatefulData state = StatefulData.empty();

  final authController = Get.find<AuthController>();

  @override
  void onInit() {
    nameController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    nameFocus = FocusNode();
    phoneFocus = FocusNode();
    passwordFocus = FocusNode();
    confirmPasswordFocus = FocusNode();

    super.onInit();
  }

  void _updateToken(String newToken) {
    _keyValueStorageService.setAuthToken(newToken);
  }

  void onObscureTapped() {
    obscureText = !obscureText;
    update();
  }

  void onObscureConfirmTapped() {
    obscureTextConfirm = !obscureTextConfirm;
    update();
  }

  Future<RegisterAccount> _addToModel() async {
    return RegisterAccount(
      firstName: nameController.text,
      // lastName: nameController.text,
      phone: phoneController.text,
      password: passwordController.text,
      passwordConfirmation: passwordController.text,
      // gender: '',
      // deviceName: await getDeviceName()
    );
  }

  void onRegisterTap() async {
    if (key.currentState?.validate() ?? false) {
      state = StatefulData.loading();

      key.currentState!.save();
      update();

      final account = await _addToModel();

      await repository
          .registerUser(
              data: account.toJson(), updateTokenCallback: _updateToken)
          .then((value) {
        state = StatefulData.completed(null);
        authController.onAccountUpdate(value,
            // passwordController.text
        );
        ShowSnack.showSnack(r'register_success'.tr, SnackType.success);
      }).catchError((e) {
        state = StatefulData.error(e);
        update();
        ShowSnack.showSnack(r'error'.tr, SnackType.error);

        debugPrint(e.toString());
      });
    }
  }

  String? validateName() {
    if (nameController.text.isEmpty) {
      return 'fill_field'.tr;
    } else if (!Validator.matchAsciiTextWithSymbols(nameController.text)) {
      return 'only_text'.tr;
    }
    return null;
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

  String? validateConfirmPassword() {
    if (confirmPasswordController.text.isEmpty) {
      return 'fill_field'.tr;
    } else if (confirmPasswordController.text != passwordController.text) {
      return 'password_is_not_equal'.tr;
    }
    return null;
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    nameFocus.dispose();
    phoneFocus.dispose();
    passwordFocus.dispose();
    confirmPasswordFocus.dispose();
    super.dispose();
  }
}
