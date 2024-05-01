import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/local/key_value_storage_service.dart';
import '../../../core/states/statefull_data.dart';
import '../../../utils/device_info.dart';
import '../../../utils/validator.dart';
import '../../account/controllers/auth_controller.dart';
import '../../account/repository/auth_repository.dart';
import '../models/register_account.dart';

class RegisterController extends GetxController {
  File? _image;
  final picker = ImagePicker();

  Future<void> getImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _image = File(pickedImage.path);
      update();
    }
  }

  File? get image => _image;

  final AuthRepository repository;
  final GlobalKey<FormState> key;
  final KeyValueStorageService _keyValueStorageService;
  var selectedItem = ''.obs;

  void updateSelectedItem(String value) {
    selectedItem.value = value;
  }

  RegisterController(this.repository, this.key, this._keyValueStorageService);

  late final TextEditingController nameController;
  late final TextEditingController phoneController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  late final TextEditingController dropdownController;

  late final FocusNode nameFocus;
  late final FocusNode phoneFocus;
  late final FocusNode passwordFocus;
  late final FocusNode confirmPasswordFocus;
  late final FocusNode dropdownFocus;

  bool isLoading = false;
  bool obscureText = true;
  bool obscureTextConfirm = true;

  StatefulData state = StatefulData.empty();

  final authController = Get.find<AuthController>();

  String? selectedValue;
  bool showLocationValidationError = false;

  final List<String> locations = [
    'Aşgabat',
    'Balkan',
    'Ahal',
    'Mary',
    'Lebap',
    'Daşoguz'
  ];

  @override
  void onInit() {
    nameController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    dropdownController = TextEditingController();

    nameFocus = FocusNode();
    phoneFocus = FocusNode();
    passwordFocus = FocusNode();
    confirmPasswordFocus = FocusNode();
    dropdownFocus = FocusNode();
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
        lastName: nameController.text,
        phone: phoneController.text,
        password: passwordController.text,
        dropdown: dropdownController.text,
        deviceName: await getDeviceName());
  }

  void onRegisterTap() async {
    if (selectedValue == null) {
      showLocationValidationError = true;
      update();
    }
    if (key.currentState!.validate()) {
      if (selectedValue != null) {
        print(selectedValue);
        state = StatefulData.loading();

        key.currentState!.save();
        update();

        final account = await _addToModel();

        await repository
            .registerUser(
                data: account.toJson(), updateTokenCallback: _updateToken)
            .then((value) {
          state = StatefulData.completed(null);
          authController.onAccountUpdate(value);
          update();
          Get.until((route) => route.isFirst);
        }).catchError((e) {
          state = StatefulData.error(e);
          update();
          debugPrint(e.toString());
        });
      }
    }
  }

  String? validateName() {
    if (nameController.text.isEmpty) {
      return r'fill_field'.tr;
    } else if (!Validator.matchAsciiTextWithSymbols(nameController.text)) {
      return r'only_text'.tr;
    }
    return null;
  }

  String? validatePhone() {
    if (phoneController.text.isEmpty) {
      return r'fill_field'.tr;
    } else if (!Validator.matchPhoneNumberWithoutPrefix(phoneController.text)) {
      return r'input_correct_number'.tr;
    }
    return null;
  }


  String? validatePassword() {
    if (passwordController.text.isEmpty) {
      return r'fill_field'.tr;
    } else if (passwordController.text.length < 6) {
      return r'password_must_be_6_chars'.tr;
    }
    return null;
  }

  String? validateConfirmPassword() {
    if (confirmPasswordController.text.isEmpty) {
      return r'fill_field'.tr;
    } else if (confirmPasswordController.text != passwordController.text) {
      return r'password_is_not_equal'.tr;
    }
    return null;
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    dropdownController.dispose();

    nameFocus.dispose();
    phoneFocus.dispose();
    passwordFocus.dispose();
    confirmPasswordFocus.dispose();
    dropdownController.dispose();
    super.dispose();
  }
}
