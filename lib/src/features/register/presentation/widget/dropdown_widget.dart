// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../../../../theme/constants/app_colors.dart';
//
// class DropdownWidget extends StatefulWidget {
//  DropdownWidget({super.key});
//
//   @override
//   State<DropdownWidget> createState() => _DropdownWidgetState();
// }
//
// class _DropdownWidgetState extends State<DropdownWidget> {
//   final List<String> items = [
//     'Aşgabat',
//     'Balkan',
//     'Ahal',
//     'Mary',
//     'Lebap',
//     'Daşoguz'
//   ];
//
//   String? selectedValue;
//   String? errorText;
//
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonHideUnderline(
//       child: DropdownButton2<String>(
//         isExpanded: true,
//         hint: const Row(
//           children: [
//             Expanded(
//               child: Text(
//                 'Ýaşaýan ýeriňi saýla',
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.normal,
//                   color: Colors.black38,
//                 ),
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//           ],
//         ),
//         items: items
//             .map((String item) => DropdownMenuItem<String>(
//           value: item,
//           child: Text(
//             item,
//             style: const TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.normal,
//               color: AppColors.black,
//             ),
//             overflow: TextOverflow.ellipsis,
//           ),
//         ))
//             .toList(),
//         value: selectedValue,
//         onChanged: (String? value) {
//           setState(() {
//             selectedValue = value;
//
//           });
//         },
//         buttonStyleData: ButtonStyleData(
//           height: 45,
//           width: 330,
//           padding: const EdgeInsets.only(left: 14, right: 14),
//           decoration: BoxDecoration(
//             border: Border.all(color: AppColors.grey),
//             color: AppColors.white,
//             borderRadius: BorderRadius.circular(30),
//           ),
//
//         ),
//         iconStyleData: const IconStyleData(
//           icon: Icon(
//             Icons.keyboard_arrow_down_outlined,
//           ),
//           iconSize: 20,
//           iconEnabledColor: AppColors.black,
//           iconDisabledColor: Colors.grey,
//         ),
//         dropdownStyleData: DropdownStyleData(
//           direction: DropdownDirection.left,
//           maxHeight: 200,
//           width: 100,
//           decoration: BoxDecoration(
//
//             borderRadius: BorderRadius.circular(14),
//             color: AppColors.lightGrey,
//           ),
//           // offset: const Offset(-20, 0),
//           scrollbarTheme: ScrollbarThemeData(
//             radius: const Radius.circular(40),
//             thickness:
//             MaterialStateProperty.all<double>(6),
//             thumbVisibility:
//             MaterialStateProperty.all<bool>(true),
//           ),
//         ),
//         menuItemStyleData: const MenuItemStyleData(
//           height: 30,
//           padding: EdgeInsets.only(left: 14, right: 14),
//         ),
//       ),
//     );
//   }
// }
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropdownWidget extends StatefulWidget {
  DropdownWidget({Key? key}) : super(key: key);

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  final List<String> items = [
    'Aşgabat',
    'Balkan',
    'Ahal',
    'Mary',
    'Lebap',
    'Daşoguz'
  ];

  String? selectedValue;
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint:  Row(
              children: [
                Expanded(
                  child: Text(
                    'Ýaşaýan ýeriňi saýla',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            items: items
                .map((String item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style:  TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ))
                .toList(),
            value: selectedValue,
            onChanged: (String? value) {
              setState(() {
                selectedValue = value;
                errorText = null; // Reset error text when a selection is made
              });
            },
            buttonStyleData: ButtonStyleData(
              height: 50.h,
              width: 330.w,
              padding:  EdgeInsets.only(left: 14.w, right: 14.w),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inverseSurface,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(30.r),
              ),
            ),
            iconStyleData:  IconStyleData(
              icon: const Icon(
                Icons.keyboard_arrow_down_outlined,
              ),
              iconSize: 20.sp,
              iconEnabledColor: Colors.black,
              iconDisabledColor: Colors.grey,
            ),
            dropdownStyleData: DropdownStyleData(
              direction: DropdownDirection.left,
              maxHeight: 240.h,
              width: 130.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.r),
                color: Colors.grey[200],
              ),
              scrollbarTheme: ScrollbarThemeData(
                radius:  Radius.circular(40.r),
                thickness: MaterialStateProperty.all<double>(6),
                thumbVisibility: MaterialStateProperty.all<bool>(true),
              ),
            ),
            menuItemStyleData:  MenuItemStyleData(
              height: 30.h,
              padding: EdgeInsets.only(left: 14.w, right: 14.w),
            ),
          ),
        ),
        if (errorText != null)
          Text(
            errorText!,
            style: TextStyle(color: Colors.red),
          ),
        SizedBox(height: 10.h),
      ],
    );
  }
}