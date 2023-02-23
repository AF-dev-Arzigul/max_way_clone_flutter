import 'package:flutter/material.dart';
import 'package:max_way/models/max_way_model.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff51267D),
        title: const Text("Product detail screen"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Image.network("https://cdn.delever.uz/delever/${product.image}"),
          const SizedBox(height: 20),
          Text(product.title.uz, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
          const SizedBox(height: 20),
          Container(padding: const EdgeInsets.symmetric(horizontal: 20), child: Text(product.description.uz, style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16))),
          const SizedBox(height: 20),
          Text("${product.outPrice} ${product.currency.name}", style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
        ],
      ),
    );
  }
}
