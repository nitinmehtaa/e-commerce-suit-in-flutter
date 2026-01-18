import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HeroCarousel extends StatelessWidget {
  const HeroCarousel({super.key, required this.imageUrls});

  final List<String> imageUrls;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: CarouselSlider(
        items: imageUrls.map((url) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(url),
              ),
            ),
          );
        }).toList(),
        options: CarouselOptions(
          viewportFraction: 0.9,
          aspectRatio: 2.0,
          autoPlay: false,
          height: 210,
        ),
      ),
    );
  }
}
