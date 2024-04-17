import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../theme/constants/app_colors.dart';
import '../utils/constants/app_assets.dart';

class CachingImage extends StatelessWidget {
  final String? imageUrl;
  final BoxFit? fit;
  final Color? color;

  const CachingImage(this.imageUrl, {Key? key, this.fit, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const assetLogo = AppAssets.lightModeLogo;
    // final assetLogo =
    //     true ? AppAssets.lightModeLogo : 'assets/images/dark_mode_logo.png';
    return imageUrl == null
        ? Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(assetLogo),
          )
        : CachedNetworkImage(
            fit: fit ?? BoxFit.contain,
            imageUrl: imageUrl!,
            width: double.infinity,
            color: color,
            errorWidget: (context, _, __) =>
                const ColoredBox(color: AppColors.lightGrey),
            progressIndicatorBuilder: (context, _, progress) =>
                const ColoredBox(color: AppColors.lightGrey),
          );
  }
}
