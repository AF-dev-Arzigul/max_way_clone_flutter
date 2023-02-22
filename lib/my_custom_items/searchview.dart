import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  final String text;

  const SearchView({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 12, left: 12),
      height: 50,
      decoration: BoxDecoration(color: const Color(0xFFF7F5F9), borderRadius: BorderRadius.circular(15)),
      child: const TextField(
          cursorColor: Color(0xff51267D),
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(fontSize: 14),
            prefixIcon: Icon(Icons.search, size: 20, color: Color(0xff51267D)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          )),
    );
  }
}
