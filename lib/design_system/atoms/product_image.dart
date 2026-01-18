import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  bool get _isNetworkImage =>
      imageUrl.startsWith('http://') || imageUrl.startsWith('https://');

  @override
  Widget build(BuildContext context) {
    final placeholder = Container(
      height: height,
      width: width,
      color: Colors.grey.shade100,
    );
    final errorWidget = Container(
      height: height,
      width: width,
      color: Colors.grey.shade200,
      alignment: Alignment.center,
      child: const Icon(Icons.broken_image),
    );

    final image = imageUrl.isEmpty
        ? Container(
            height: height,
            width: width,
            color: Colors.grey.shade200,
            alignment: Alignment.center,
            child: const Icon(Icons.image_not_supported),
          )
        : _isNetworkImage
            ? CachedNetworkImage(
                imageUrl: imageUrl,
                height: height,
                width: width,
                fit: fit,
                placeholder: (_, __) => placeholder,
                errorWidget: (_, __, ___) => errorWidget,
              )
            : Image.asset(
                imageUrl,
                height: height,
                width: width,
                fit: fit,
                errorBuilder: (_, __, ___) => errorWidget,
              );

    if (borderRadius == null) {
      return image;
    }
    return ClipRRect(borderRadius: borderRadius!, child: image);
  }
}
