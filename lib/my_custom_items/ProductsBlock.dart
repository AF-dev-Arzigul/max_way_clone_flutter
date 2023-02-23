import 'package:flutter/material.dart';
import 'package:max_way/models/max_way_model.dart';
import 'package:max_way/my_custom_items/CustomImageItem.dart';
import 'package:max_way/product_detail_page.dart';

class ProductBlock extends StatelessWidget {
  final Category category;

  const ProductBlock({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(category.title.uz, style: const TextStyle(fontSize: 22)),
          ],
        ),
      ),
      GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: category.products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5),
          itemBuilder: (BuildContext context, int index2) {
            return GestureDetector(
              onTap: () {
                print(category.products[index2].title.uz);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProductDetailPage(product: category.products[index2]); //o'rniga details screen ochilishi kerak
                }));
              },
              child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      CustomImageItem(imagePath: category.products[index2].image),
                      Text(category.products[index2].title.uz),
                      const SizedBox(height: 10),
                      Text("${category.products[index2].outPrice} ${category.products[index2].currency.name}"),
                    ],
                  )),
            );
          })
    ]);
  }
}
