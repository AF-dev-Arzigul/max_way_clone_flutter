import 'package:flutter/material.dart';
import 'package:max_way/slider_page_item.dart';


class SliderExamplePage extends StatefulWidget {
  const SliderExamplePage({Key? key}) : super(key: key);

  @override
  State<SliderExamplePage> createState() => _SliderExamplePageState();
}

class _SliderExamplePageState extends State<SliderExamplePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliderPageItem(
        list: [Colors.red, Colors.green],
      ),
    );
  }

}
