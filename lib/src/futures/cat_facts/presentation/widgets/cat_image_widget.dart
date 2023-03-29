import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../config/constaints/ui_constaints.dart';

class CatImageWidget extends StatelessWidget {
  final String imageUrl;
  final String itemId;
  const CatImageWidget({Key? key, required this.imageUrl, required this.itemId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      cacheKey: itemId,
        width: double.infinity,
        height: double.infinity,
        placeholder: (context, url) => const Center(
          child: SizedBox(
          width: DEFAULT_LOADING_INDICATOR_SIZE,
          height: DEFAULT_LOADING_INDICATOR_SIZE,
          child: CircularProgressIndicator(),
        ),
      ),
      errorWidget: (context, url, error) => Icon(Icons.warning_amber, color: Theme.of(context).colorScheme.error, size: DEFAULT_IMAGE_ICON_SIZE,),
    );
  }
}
