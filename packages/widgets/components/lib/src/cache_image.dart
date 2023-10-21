import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final String? url;
  final double? height;
  final double? width;
  final Widget? placeholder;
  final Widget? errorWidget;

  const CachedImage({
    super.key,
    this.url,
    this.height,
    this.width,
    this.placeholder,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    if (url != null) {
      return CachedNetworkImage(
        imageUrl: url!,
        height: height,
        placeholder:
            placeholder != null ? (context, url) => placeholder! : null,
        errorWidget:
            errorWidget != null ? (context, url, error) => errorWidget! : null,
      );
    } else {
      return SizedBox(
        height: height,
        width: width,
        child: errorWidget,
      );
    }
  }
}
