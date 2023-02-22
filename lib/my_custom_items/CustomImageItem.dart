import 'package:flutter/material.dart';


class CustomImageItem extends StatelessWidget {
  final String imagePath;

  const CustomImageItem({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imagePath.isNotEmpty) {
      return ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          child: Image(image: NetworkImage("https://cdn.delever.uz/delever/$imagePath"), width: 200, height: 120, fit: BoxFit.fill));
    } else {
      return Container(
        padding: EdgeInsets.all(10),
        child: Image.asset(
          "assets/images/empty_product_image.png",
          width: 200,
          height: 100,
          fit: BoxFit.fill,
        ),
      );
    }
  }

}
