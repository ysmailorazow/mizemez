import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_button/group_button.dart';
import 'package:x_market/src/features/register/presentation/widget/dropdown_widget.dart';
import '../../../theme/constants/app_colors.dart';
import '../../../utils/constants/app_assets.dart';

class RateScreen extends StatefulWidget {
  static const route = r'/rate';

  const RateScreen({super.key});

  @override
  State<RateScreen> createState() => _RateScreenState();
}

class _RateScreenState extends State<RateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: DefaultTabController(
        length: 6,
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              expandedHeight: 270.h,
              floating: true,
              title: Image.asset(
                AppAssets.logo_miz,
                height: 60.h,
                width: 150.w,
              ),
              actions: const [
                Icon(
                  Icons.person,
                  color: AppColors.white,
                ),
              ],
              bottom: PreferredSize(
                preferredSize:  Size.fromHeight(0.0.h),
                child: Container(
                  height: 30.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius:  BorderRadius.only(
                        topLeft: Radius.circular(30.r),
                        topRight: Radius.circular(30.r),
                      )),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: CarouselSlider.builder(
                  itemCount: 3,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: Colors.amber,
                      ),
                      width: 330.w,
                      height: 110.h,
                    );
                  },
                  options: CarouselOptions(
                    height: 150.h,
                    viewportFraction: 0.9,
                  ),
                ),
               ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: MediaQuery.of(context).size.height,
                color: Theme.of(context).colorScheme.background,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text('Bölümlere görä derejeleri saýlap bilersiňiz.',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16.sp)),
                       SizedBox(
                        height: 15.h,
                      ),
                       Text(
                        'Welaýata görä',
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.w400),
                      ),
                       SizedBox(
                        height: 15.h,
                      ),
                     DropdownWidget(),
                       SizedBox(
                        height: 15.h,
                      ),
                       Text(
                        'Iňlis dili derejesine görä',
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.w400),
                      ),
                      const Align(
                        alignment: AlignmentDirectional.center,
                        child: TabBar(
                          isScrollable: true,
                          tabAlignment: TabAlignment.start,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorWeight: 3,
                          indicatorColor: AppColors.transparent,
                          tabs: [
                            Tab(child: Text('Beginner')),
                            Tab(child: Text('Elementary')),
                            Tab(child: Text('Pre-intermediate')),
                            Tab(child: Text('Intermediate')),
                            Tab(child: Text('Upper')),
                            Tab(child: Text('Advanced')),
                          ],
                        ),
                      ),
                       SizedBox(
                        height: 10.h,
                      ),
                       Text(
                        'Wagta görä saýlamak',
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.w400),
                      ),
                       SizedBox(
                        height: 10.h,
                      ),
                      Align(
                        child: GroupButton(
                            options: GroupButtonOptions(
                              unselectedColor: Theme.of(context).colorScheme.onBackground,
                              unselectedTextStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface),
                              borderRadius: BorderRadius.circular(15.r),
                              buttonHeight: 30.h,
                              buttonWidth: 100.w,
                              // crossGroupAlignment: CrossGroupAlignment.center,
                              // mainGroupAlignment: MainGroupAlignment.center,
                              // groupRunAlignment: GroupRunAlignment.spaceEvenly,
                              spacing: 15.sp,
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
                            controller: GroupButtonController(
                              selectedIndex: 0,
                            ),
                            onSelected: (value, index, isSelected) {
                              print('$value button is selected');
                            }),
                      ),
                       SizedBox(
                        height: 20.h,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return const Card(
                                  child: ListTile(
                                    title: Text('Amanow Amna'),
                                    leading: Icon(Icons.person),
                                    trailing: Text('70/80'),
                                  ),
                                );
                              }),
                          ListView.builder(
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return const Card(
                                  child: ListTile(
                                    title: Text('Amanow Amna'),
                                    leading: Icon(Icons.person),
                                    trailing: Text('70/80'),
                                  ),
                                );
                              }),
                          ListView.builder(
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return const Card(
                                  child: ListTile(
                                    title: Text('Amanow Amna'),
                                    leading: Icon(Icons.person),
                                    trailing: Text('70/80'),
                                  ),
                                );
                              }),
                          ListView.builder(
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return const Card(
                                  child: ListTile(
                                    title: Text('Amanow Amna'),
                                    leading: Icon(Icons.person),
                                    trailing: Text('70/80'),
                                  ),
                                );
                              }),
                          ListView.builder(
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return const Card(
                                  child: ListTile(
                                    title: Text('Amanow Amna'),
                                    leading: Icon(Icons.person),
                                    trailing: Text('70/80'),
                                  ),
                                );
                              }),
                          ListView.builder(
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return const Card(
                                  child: ListTile(
                                    title: Text('Amanow Amna'),
                                    leading: Icon(Icons.person),
                                    trailing: Text('70/80'),
                                  ),
                                );
                              }),
                        ]),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// CustomScrollView(
// headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
// return [
//
// SliverToBoxAdapter(
// child: Container(
// decoration: BoxDecoration(
// border: Border.all(
// color: Theme.of(context).colorScheme.background,
// ),
// borderRadius: const BorderRadius.only(
// topRight: Radius.circular(30),
// topLeft: Radius.circular(30)),
// color: Theme.of(context).colorScheme.background,
// ),
// alignment: Alignment.centerLeft,
// // height: 200,
// child: Padding(
// padding:
// const EdgeInsets.only(left: 15.0, top: 15, right: 15.0),
// child: Column(
// // mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
//
// ],
// ),
// ),
// ),
// ),
// SliverAppBar(
// elevation: 0,
// backgroundColor: Theme.of(context).colorScheme.background,
// title: const Align(
// alignment: AlignmentDirectional.center,
// child:
// ),
// ),
// DecoratedSliver(
// decoration: BoxDecoration(
// color: Theme.of(context).colorScheme.background,
// ),
// sliver: SliverFixedExtentList(
// delegate: SliverChildListDelegate([
// Column(
// children: [
// const SizedBox(
// height: 8,
// ),
//
// ],
// ),
// ]),
// itemExtent: 135,
// ),
// ),
// ];
// },
// body:  Container(
// color: Colors.red,
// child:
// ),
// ),
