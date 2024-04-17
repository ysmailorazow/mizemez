import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:x_market/src/theme/constants/app_colors.dart';
import 'package:x_market/src/features/home/presentation/widget/grid_content_widget.dart';
import '../../../utils/constants/app_assets.dart';

class HomeScreen extends StatefulWidget {
  static const route = r'/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: CustomScrollView(
            slivers: [
               SliverAppBar(
                 backgroundColor:Theme.of(context).colorScheme.primary,
                expandedHeight: 270,
                floating: true,
                title:Image.asset(
                  AppAssets.logo_miz,
                  height: 60,
                  width: 150,
                ),
                actions: const [
                   Icon(Icons.person,color: AppColors.white,),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background:  CarouselSlider.builder(
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
                  decoration:BoxDecoration(
                    border: Border.all(color: Theme.of(context).colorScheme.background),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30)),
                      color: Theme.of(context).colorScheme.background),
                  alignment: Alignment.centerLeft,
                  // height: 200,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 15),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Which level are you?',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          'Select from below.',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              DecoratedSliver(
                decoration:  BoxDecoration(
                  color: Theme.of(context).colorScheme.background
                ),
                sliver: const GridContentWidget(),
              ),

            ]),
      ),
    );
  }
}