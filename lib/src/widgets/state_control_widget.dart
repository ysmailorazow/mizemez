import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/constants/app_colors.dart';
import '../theme/constants/app_dimensions.dart';
import '../utils/constants/app_assets.dart';
import 'error_widget.dart';

class StateControlWidget extends StatelessWidget {
  final String? title;
  final Widget? leading;
  final Widget? titleWidget;
  final TextStyle? style;
  final List<Widget> slivers;
  final bool isEmpty;
  final bool isLoading;
  final bool isError;
  final VoidCallback? onError;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final ScrollController? scrollController;
  final String? emptyImage;
  final String? emptyText;

  const StateControlWidget({
    Key? key,
    this.title,
    required this.slivers,
    this.isEmpty = false,
    required this.onError,
    this.actions,
    this.style,
    this.backgroundColor,
    this.titleWidget,
    this.leading,
    this.scrollController,
    this.isLoading = false,
    this.isError = false,
    this.emptyImage,
    this.emptyText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          backgroundColor:Theme.of(context).colorScheme.background,
          floating: true,
          // automaticallyImplyLeading: false,
          title: titleWidget ?? Text(title ?? ''),
          actions: actions,
        ),
        if (isLoading)
          SliverFillViewport(
            viewportFraction: 0.8,
            padEnds: false,
            delegate: SliverChildListDelegate([
              const Center(
                  child: CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.orange),
              )),
            ]),
          ),
        if (isEmpty)
          SliverFillViewport(
            viewportFraction: 0.8,
            padEnds: false,
            delegate: SliverChildListDelegate([
              Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(emptyImage ?? AppAssets.lightModeLogo),
                  const SizedBox(height: AppDimensions.paddingMedium),
                  Text(
                    emptyText ?? '',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                  ),
                ],
              )),
            ]),
          ),
        if (isError)
          SliverFillViewport(
            viewportFraction: 0.8,
            padEnds: false,
            delegate: SliverChildListDelegate([
              CustomErrorWidget(onError: onError),
            ]),
          ),
        if (!isLoading && !isError && !isEmpty) ...slivers,
      ],
    );
  }
}
