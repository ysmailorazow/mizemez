import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/globals.dart';
import '../../../../../core/local/key_value_storage_service.dart';
import '../../../../../core/states/statefull_data.dart';
import '../../../../../theme/constants/app_colors.dart';
import '../../../../../theme/constants/app_dimensions.dart';
import '../../../../../widgets/elevated_button_with_state.dart';
import '../../../../account/repository/auth_repository.dart';
import '../../../controllers/register_controller.dart';
import '../obscure_icon.dart';

class RegisterContainer extends StatefulWidget {
  final void Function() onLoginTapped;
  const RegisterContainer({super.key, required this.onLoginTapped});

  @override
  State<RegisterContainer> createState() => _RegisterContainerState();
}

class _RegisterContainerState extends State<RegisterContainer> {
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      init: RegisterController(
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
                r'register'.tr,
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
                controller: controller.nameController,
                focusNode: controller.nameFocus,
                maxLength: 25,
                validator: (_) => controller.validateName(),
                onTapOutside: (event) {
                  controller.nameFocus.unfocus();
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.person_outline_rounded,
                    color: AppColors.orange,
                  ),
                  labelText: r'username'.tr,
                  counter: const SizedBox(),
                ),
              ),
              const SizedBox(height: AppDimensions.paddingLarge),
              TextFormField(
                controller: controller.phoneController,
                focusNode: controller.phoneFocus,
                keyboardType: TextInputType.phone,
                maxLength: 8,
                validator: (_) => controller.validatePhone(),
                onTapOutside: (event) {
                  controller.phoneFocus.unfocus();
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.phone,
                    color: AppColors.orange,
                  ),
                  prefixText: '+993',
                  labelText: r'phone'.tr,
                  counter: const SizedBox(),
                ),
              ),
              const SizedBox(height: AppDimensions.paddingLarge),
              TextFormField(
                controller: controller.passwordController,
                focusNode: controller.passwordFocus,
                obscureText: controller.obscureText,
                keyboardType: TextInputType.visiblePassword,
                validator: (_) => controller.validatePassword(),
                onTapOutside: (event) {
                  controller.passwordFocus.unfocus();
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.phone,
                    color: AppColors.orange,
                  ),
                  suffixIcon: ObscureIcon(
                    isObscure: controller.obscureText,
                    onPressed: controller.onObscureTapped,
                  ),
                  labelText: r'password'.tr,
                ),
              ),
              const SizedBox(height: AppDimensions.paddingLarge),
              TextFormField(
                controller: controller.confirmPasswordController,
                focusNode: controller.confirmPasswordFocus,
                obscureText: controller.obscureTextConfirm,
                keyboardType: TextInputType.visiblePassword,
                validator: (_) => controller.validateConfirmPassword(),
                onTapOutside: (event) {
                  controller.confirmPasswordFocus.unfocus();
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.password,
                    color: AppColors.orange,
                  ),
                  suffixIcon: ObscureIcon(
                    isObscure: controller.obscureTextConfirm,
                    onPressed: controller.onObscureConfirmTapped,
                  ),
                  labelText: r'confirm_password'.tr,
                ),
              ),
              const SizedBox(height: AppDimensions.paddingExtraLarge),
              ElevatedButtonWithState(
                isError: controller.state.status == Status.error,
                isLoading: controller.state.status == Status.loading,
                onPressed: () => controller.onRegisterTap(),
                child: Text(r'register'.tr),
              ),
              TextButton(
                onPressed: widget.onLoginTapped,
                child: Text(r'login'.tr),
              ),
              const SizedBox(
                height: AppDimensions.paddingExtraLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
