import 'package:flutter/material.dart';
import 'package:max_way/models/max_way_model.dart';
import 'package:carousel_slider/carousel_slider.dart';


class CustomCarouselSlider extends StatelessWidget {
  final List<Bannerr> banner;

  const CustomCarouselSlider({Key? key, required this.banner}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: banner.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            ClipRRect(borderRadius: BorderRadius.circular(15), child: Image.network(banner[itemIndex].image, fit: BoxFit.fill)),
        options: CarouselOptions(
          height: 140,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.25,
          scrollDirection: Axis.horizontal,
        )
    );
  }
}
