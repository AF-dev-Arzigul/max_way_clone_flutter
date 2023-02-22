import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:max_way/branches_page.dart';
import 'package:max_way/models/max_way_model.dart';
import 'package:max_way/my_custom_items/carousel_slider.dart';
import 'package:max_way/my_custom_items/searchview.dart';
import 'api/Api.dart';
import 'my_custom_items/ProductsBlock.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHomePage> {
  final api = Api();
  late MaxWay _maxWay;
  late bool response = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    _maxWay = await api.getData();
    response = true;
    print(_maxWay.pageProps.categories.length);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (response) {
      List<String> tags = [];
      List<String> products = [];

      var categories = _maxWay.pageProps.categories;

      for (int i = 0; i < categories.length; i++) {
        products.add(categories[i].title.uz);
      }

      return SafeArea(
          child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xff51267D),
          title: const Text("Max Way"),
        ),
        body: Column(
          children: [
            Container(
                padding: const EdgeInsets.only(top: 20, right: 15, left: 15, bottom: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Expanded(flex: 1, child: SearchView(text: "123")),
                    const SizedBox(width: 15),
                    GestureDetector(child: const Icon(Icons.location_pin, color: Colors.red), onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const BranchesPage();
                      }));
                    }),
                  ],
                )),
            ChipsChoice.multiple(
              value: tags,
              onChanged: (val) => setState(() => tags = val),
              choiceItems: C2Choice.listFrom<String, String>(
                source: products,
                value: (i, v) => v,
                label: (i, v) => v,
              ),
            ),
            const SizedBox(height: 10),
            CustomCarouselSlider(banner: _maxWay.pageProps.banners),
            const SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index1) {
                  return ProductBlock(category: categories[index1]);
                },
              ),
            ),
          ],
        ),
      ));
    } else {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
  }
}
