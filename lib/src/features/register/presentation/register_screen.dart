import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:x_market/src/features/login/presentation/login_screen.dart';
import 'package:x_market/src/features/register/presentation/widget/dropdown_widget.dart';
import '../../../core/globals.dart';
import '../../../core/local/key_value_storage_service.dart';
import '../../../core/states/statefull_data.dart';
import '../../../theme/constants/app_colors.dart';
import '../../../theme/constants/app_dimensions.dart';
import '../../../utils/constants/app_assets.dart';
import '../../../widgets/elevated_button_with_state.dart';
import '../../account/repository/auth_repository.dart';
import '../controller/register_controller.dart';

class RegisterScreen extends StatefulWidget {
  static const route = '/register';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: GetBuilder<RegisterController>(
        init: RegisterController(
          AuthRepository(apiService: ApiServices.apiService),
          _key,
          KeyValueStorageService(),
        ),
        builder: (controller) => CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Form(
                key: _key,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 35.h, right: 10.w),
                          child: TextButton(
                            onPressed: () {
                              Get.to(LoginScreen());
                            },
                            child: Text(
                              r'sign_in'.tr,
                              style: TextStyle(
                                  color: Colors.green.shade500,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      width: 274.w,
                      child: Text(
                        r'join'.tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    SizedBox(
                      width: 274.w,
                      child: Text(
                        r'subscribe'.tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          // color: AppColors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      height: 100.h,
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 42.r,
                            backgroundImage: controller.image == null
                                ? AssetImage(AppAssets.photo)
                                : FileImage((controller.image!))
                                    as ImageProvider?,
                          ),
                          Positioned(
                            bottom: 0.h,
                            right: 24.w,
                            child: InkWell(
                              onTap: () {
                                controller.getImage();
                              },
                              child: SvgPicture.asset(
                                AppAssets.edit_icon,
                                width: 30.w,
                                height: 30.h,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 25.w, bottom: 8.h),
                        child: Text(
                          r'name'.tr,
                          style: TextStyle(fontSize: 15.sp),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                      width: 330.w,
                      child: TextFormField(
                        controller: controller.nameController,
                        focusNode: controller.nameFocus,
                        keyboardType: TextInputType.text,
                        validator: (_) => controller.validateName(),
                        onTapOutside: (_) => controller.nameFocus.unfocus(),
                        decoration: InputDecoration(
                          fillColor:
                              Theme.of(context).colorScheme.inverseSurface,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(36.r))),
                          labelText: 'username'.tr,
                          labelStyle: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontSize: 15),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 25.w, bottom: 8.h),
                        child: Text(
                          r'phone'.tr,
                          style: TextStyle(fontSize: 15.sp),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                      width: 330.w,
                      child: TextFormField(
                        controller: controller.phoneController,
                        focusNode: controller.phoneFocus,
                        keyboardType: TextInputType.phone,
                        validator: (_) => controller.validatePhone(),
                        onTapOutside: (_) => controller.phoneFocus.unfocus(),
                        maxLength: 8,
                        decoration: InputDecoration(
                          fillColor:
                              Theme.of(context).colorScheme.inverseSurface,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(36.r))),
                          hintText: '6X XXXXXX',
                          counter: const SizedBox(),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: 'phone'.tr,
                          labelStyle: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontSize: 15),
                          prefixText: '+993 ',
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 25.w, bottom: 8.h),
                        child: Text(
                          'welaýat'.tr,
                          style: TextStyle(fontSize: 15.sp),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Ýaşaýan ýeriňi saýla',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.normal,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            items: controller.locations
                                .map((String item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ))
                                .toList(),
                            value: controller.selectedValue,
                            onChanged: (String? value) {
                              setState(() {
                                controller.selectedValue = value;
                                controller.showLocationValidationError = false;
                              });
                            },
                            buttonStyleData:controller.showLocationValidationError? ButtonStyleData(
                              height: 25.h,
                              width: 330.w,
                              padding: EdgeInsets.only(left: 14.w, right: 14.w),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.inverseSurface,
                                border: Border.all(color: controller.showLocationValidationError
                                    ? Colors.red.shade900
                                    : Colors.grey,),
                                borderRadius: BorderRadius.circular(36.r),
                              ),
                            )
                          : ButtonStyleData(
                    height: 45.h, // Original height
                    width: 330.w, // Original width
                              padding: EdgeInsets.only(left: 14.w, right: 14.w),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.inverseSurface,
                                border: Border.all(color: controller.showLocationValidationError
                                    ? Colors.red.shade900
                                    : Colors.grey,),
                                borderRadius: BorderRadius.circular(36.r),
                              ),
                    ),
                            iconStyleData: IconStyleData(
                              icon: const Icon(
                                Icons.keyboard_arrow_down_outlined,
                              ),
                              iconSize: 20.sp,
                              iconEnabledColor:
                                  Theme.of(context).colorScheme.onSurface,
                              iconDisabledColor: Colors.grey,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              direction: DropdownDirection.left,
                              maxHeight: 200.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14.r),
                                color: Theme.of(context).colorScheme.inverseSurface,
                              ),
                              scrollbarTheme: ScrollbarThemeData(
                                radius: Radius.circular(40.r),
                                thickness: MaterialStateProperty.all<double>(6),
                                thumbVisibility:
                                    MaterialStateProperty.all<bool>(true),
                              ),
                            ),
                            menuItemStyleData: MenuItemStyleData(
                              height: 30,
                              padding: EdgeInsets.only(left: 14.w, right: 14.w),
                            ),
                          ),
                        ),
                        if (controller.showLocationValidationError == true)
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(top: 5.h, left: 35.w),
                              child: Text(
                                r'fill_field'.tr,
                                style: TextStyle(
                                    color: Colors.red.shade900,
                                    fontSize: 12.sp),
                              ),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 25.w, bottom: 8.h),
                        child: Text(
                          r'password'.tr,
                          style: TextStyle(fontSize: 15.sp),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                      width: 330.w,
                      child: TextFormField(
                        controller: controller.passwordController,
                        obscureText: controller.obscureText,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (_) => controller.validatePassword(),
                        focusNode: controller.passwordFocus,
                        onTapOutside: (_) => controller.passwordFocus.unfocus(),
                        decoration: InputDecoration(
                          fillColor:
                              Theme.of(context).colorScheme.inverseSurface,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(36.r))),
                          labelText: r"password".tr,
                          labelStyle: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontSize: 15),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          suffixIcon: IconButton(
                            icon: Icon(controller.obscureText
                                ? Icons.visibility_rounded
                                : Icons.visibility_off_rounded),
                            onPressed: controller.onObscureTapped,
                          ),
                          counter: null,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 25.w, bottom: 8.h),
                        child: Text(
                          r'password'.tr,
                          style: TextStyle(fontSize: 15.sp),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                      width: 330.w,
                      child: TextFormField(
                        controller: controller.confirmPasswordController,
                        obscureText: controller.obscureTextConfirm,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (_) => controller.validateConfirmPassword(),
                        focusNode: controller.confirmPasswordFocus,
                        onTapOutside: (_) =>
                            controller.confirmPasswordFocus.unfocus(),
                        decoration: InputDecoration(
                          fillColor:
                              Theme.of(context).colorScheme.inverseSurface,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(36.r))),
                          labelText: r"confirm_password".tr,
                          labelStyle: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontSize: 15),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          suffixIcon: IconButton(
                            icon: Icon(controller.obscureTextConfirm
                                ? Icons.visibility_rounded
                                : Icons.visibility_off_rounded),
                            onPressed: controller.onObscureConfirmTapped,
                          ),
                          // counter: const SizedBox(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: 330.w,
                        height: 75.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.r),
                          child: ElevatedButtonWithState(
                            isLoading:
                                controller.state.status == Status.loading,
                            isError: controller.state.status == Status.error,
                            onPressed: () {
                              controller.onRegisterTap();
                            },
                            child: Text(
                              'create_account'.tr,
                              style: TextStyle(fontSize: 18.sp),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
