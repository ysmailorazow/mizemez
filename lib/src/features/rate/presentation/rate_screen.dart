import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
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
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              elevation: 1,
              expandedHeight: 270,
              floating: true,
              title: Image.asset(
                AppAssets.logo_miz,
                height: 60,
                width: 150,
              ),
              actions: const [
                Icon(
                  Icons.person,
                  color: AppColors.white,
                ),
              ],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0.0),
                child: Container(
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: const [
                  StretchMode.blurBackground,
                  StretchMode.zoomBackground
                ],
                background: CarouselSlider.builder(
                  itemCount: 3,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.amber,
                      ),
                      width: 360,
                    );
                  },
                  options: CarouselOptions(
                    height: 150,
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
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Bölümlere görä derejeleri saýlap bilersiňiz.',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16)),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Welaýata görä',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        color: AppColors.grey,
                        height: 70,
                        width: double.maxFinite,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Iňlis dili derejesine görä',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                      const Align(
                        alignment: AlignmentDirectional.center,
                        child: TabBar(
                          isScrollable: true,
                          tabAlignment: TabAlignment.start,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorWeight: 3,
                          indicatorColor: AppColors.card_grey,
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
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Wagta görä saýlamak',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 10,
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
                            controller: GroupButtonController(
                              // selectedIndex: 0,
                            ),
                            onSelected: (value, index, isSelected) {
                              print('$value button is selected');
                            }),
                      ),
                      const SizedBox(
                        height: 20,
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
                          Text('data'),
                          Text('data'),
                          Text('data'),
                          Text('data'),
                          Text('data'),
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
