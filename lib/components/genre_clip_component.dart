// ignore_for_file: must_be_immutable

import "package:flutter/material.dart";

class GenreClipComponent extends StatelessWidget {
  final String text;
  bool clicked;
  GenreClipComponent({super.key, required this.text, required this.clicked});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(vertical: 12.5, horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: clicked ? Colors.amber : const Color.fromRGBO(37, 36, 36, 1)),
      child: Text(
        text,
        style: TextStyle(
            fontFamily: "go3",
            color: clicked ? Colors.black : Colors.white,
            fontSize: 15.5),
      ),
    );
  }
}
