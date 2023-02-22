import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


class SliderPageItem extends StatelessWidget {
  final List<Color> list;

  const SliderPageItem({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: 2,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            Container(color: list[itemIndex], width: double.infinity),
        options: CarouselOptions(
          height: double.infinity,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: false,
          reverse: false,
          autoPlay: false,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.25,
          scrollDirection: Axis.horizontal,
        ));
  }
}
