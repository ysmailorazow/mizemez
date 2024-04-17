import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:group_button/group_button.dart';

import '../../../../theme/constants/app_colors.dart';

class RateWidget extends StatefulWidget {
  const RateWidget({super.key});

  @override
  State<RateWidget> createState() => _RateWidgetState();
}

class _RateWidgetState extends State<RateWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Container(
          height: 500,
          width: double.infinity,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Bölümlere görä derejeleri saýlap bilersiňiz.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 15),
                  child: Text(
                    'Welaýata görä',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  height: 70,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Iňlis dili derejesine görä',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                const TabBar(
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 3,
                    tabs: [
                      Tab(child: Text('Beginner')),
                      Tab(child: Text('Elementary')),
                      Tab(child: Text('Pre-intermediate')),
                      Tab(child: Text('Intermediate')),
                      Tab(child: Text('Upper')),
                      Tab(child: Text('Advanced')),
                    ]),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Wagta görä saýlamak',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Align(
                  child: GroupButton(
                      options: GroupButtonOptions(
                        borderRadius: BorderRadius.circular(15),
                        buttonHeight: 30,
                        buttonWidth: 100,
                        // crossGroupAlignment: CrossGroupAlignment.center,
                        // mainGroupAlignment: MainGroupAlignment.center,
                        // groupRunAlignment: GroupRunAlignment.spaceEvenly,
                        spacing: 15,
                        direction: Axis.horizontal,
                      ),
                      buttons: const [
                        'Günlük',
                        'Hepdelik',
                        'Aýlyk',
                        '3 aýlyk',
                        '6 aýlyk',
                        'Ýyllyk',
                      ],
                      onSelected: (value, index, isSelected) {
                        print('$value button is selected');
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Gatnaşyjynyň ady',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Dogry/Ýalňyş',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Ýeri',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                const Divider(),
                 Expanded(
                  child: TabBarView(children: [
                    ListView.builder(
                        itemCount:10,
                        itemBuilder: (context , index){
                      return const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // CircleAvatar(),
                        Text('Aman Amanow'),
                        Text('80/70'),
                        Text('7. ýer'),
                      ],
                      );
                    }),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                  ]),
                ),
                // ElevatedButton(onPressed: (){}, child: Text('Gunluk'),),
              ]),
        ),
      ),
    );
  }
}







//import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter/widgets.dart';
// import 'package:group_button/group_button.dart';
//
// import '../../../../theme/constants/app_colors.dart';
//
// class RateWidget extends StatefulWidget {
//   const RateWidget({super.key});
//
//   @override
//   State<RateWidget> createState() => _RateWidgetState();
// }
//
// class _RateWidgetState extends State<RateWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 6,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//         child: Container(
//           height: 500,
//           width: double.infinity,
//           child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               // mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 const Text(
//                   'Bölümlere görä derejeleri saýlap bilersiňiz.',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.only(top: 20, bottom: 15),
//                   child: Text(
//                     'Welaýata görä',
//                     style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
//                   ),
//                 ),
//                 Container(
//                   height: 70,
//                 ),
//                 const SizedBox(height: 10),
//                 const Text(
//                   'Iňlis dili derejesine görä',
//                   style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
//                 ),
//                 const TabBar(
//                     isScrollable: true,
//                     tabAlignment: TabAlignment.start,
//                     indicatorSize: TabBarIndicatorSize.tab,
//                     indicatorWeight: 3,
//                     tabs: [
//                       Tab(child: Text('Beginner')),
//                       Tab(child: Text('Elementary')),
//                       Tab(child: Text('Pre-intermediate')),
//                       Tab(child: Text('Intermediate')),
//                       Tab(child: Text('Upper')),
//                       Tab(child: Text('Advanced')),
//                     ]),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const Text(
//                   'Wagta görä saýlamak',
//                   style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 8,
//                 ),
//                 Align(
//                   child: GroupButton(
//                       options: GroupButtonOptions(
//                         borderRadius: BorderRadius.circular(15),
//                         buttonHeight: 30,
//                         buttonWidth: 100,
//                         // crossGroupAlignment: CrossGroupAlignment.center,
//                         // mainGroupAlignment: MainGroupAlignment.center,
//                         // groupRunAlignment: GroupRunAlignment.spaceEvenly,
//                         spacing: 15,
//                         direction: Axis.horizontal,
//                       ),
//                       buttons: const [
//                         'Günlük',
//                         'Hepdelik',
//                         'Aýlyk',
//                         '3 aýlyk',
//                         '6 aýlyk',
//                         'Ýyllyk',
//                       ],
//                       onSelected: (value, index, isSelected) {
//                         print('$value button is selected');
//                       }),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Gatnaşyjynyň ady',
//                       style: TextStyle(
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     Text(
//                       'Dogry/Ýalňyş',
//                       style: TextStyle(
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     Text(
//                       'Ýeri',
//                       style: TextStyle(
//                         fontWeight: FontWeight.w600,
//                       ),
//                     )
//                   ],
//                 ),
//                 const Divider(),
//                  Expanded(
//                   child: TabBarView(children: [
//                     ListView.builder(
//                         itemCount:10,
//                         itemBuilder: (context , index){
//                       return const Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         // CircleAvatar(),
//                         Text('Aman Amanow'),
//                         Text('80/70'),
//                         Text('7. ýer'),
//                       ],
//                       );
//                     }),
//                     Text('data'),
//                     Text('data'),
//                     Text('data'),
//                     Text('data'),
//                     Text('data'),
//                   ]),
//                 ),
//                 // ElevatedButton(onPressed: (){}, child: Text('Gunluk'),),
//               ]),
//         ),
//       ),
//     );
//   }
// }


