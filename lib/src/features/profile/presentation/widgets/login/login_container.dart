import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/globals.dart';
import '../../../../../core/local/key_value_storage_service.dart';
import '../../../../../core/states/statefull_data.dart';
import '../../../../../theme/constants/app_colors.dart';
import '../../../../../theme/constants/app_dimensions.dart';
import '../../../../../widgets/elevated_button_with_state.dart';
import '../../../../account/repository/auth_repository.dart';
import '../../../controllers/login_controller.dart';
import '../obscure_icon.dart';

class LoginContainer extends StatefulWidget {
  final void Function() onRegisterTapped;
  const LoginContainer({super.key, required this.onRegisterTapped});

  @override
  State<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(
        AuthRepository(apiService: ApiServices.apiService),
        _key,
        KeyValueStorageService(),
      ),
      builder: (controller) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingExtraLarge,
          vertical: AppDimensions.paddingLarge,
        ),
        child: Form(
          key: controller.key,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                r'login'.tr,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: AppDimensions.paddingLarge),
              const Divider(
                color: AppColors.grey,
                height: 1.0,
                thickness: 0.5,
              ),
              const SizedBox(height: AppDimensions.paddingExtraLarge),
              TextFormField(
                controller: controller.phoneController,
                focusNode: controller.phoneFocus,
                validator: (_) => controller.validatePhone(),
                onTapOutside: (event) {
                  controller.phoneFocus.unfocus();
                },
                maxLength: 8,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.phone,
                      color: AppColors.orange,
                    ),
                    hintText: ' 6X XXXXXX',
                    prefixText: '+993',
                    labelText: r'phone'.tr,
                    counter: const SizedBox()),
              ),
              const SizedBox(height: AppDimensions.paddingLarge),
              TextFormField(
                controller: controller.passwordController,
                focusNode: controller.passwordFocus,
                validator: (_) => controller.validatePassword(),
                onTapOutside: (event) {
                  controller.passwordFocus.unfocus();
                },
                obscureText: controller.obscureText,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.password,
                    color: AppColors.orange,
                  ),
                  suffixIcon: ObscureIcon(
                    onPressed: controller.onObscureTapped,
                    isObscure: controller.obscureText,
                  ),
                  labelText: r'password'.tr,
                ),
              ),
              const SizedBox(height: AppDimensions.paddingExtraLarge),
              ElevatedButtonWithState(
                  isLoading: controller.state.status == Status.loading,
                  isError: controller.state.status == Status.error,
                  onPressed: controller.onLoginTap,
                  child: Text('login'.tr)),
              TextButton(
                onPressed: widget.onRegisterTapped,
                child: Text(r'register'.tr),
              ),
              const SizedBox(height: AppDimensions.paddingMedium)
            ],
          ),
        ),
      ),
    );
  }
}
