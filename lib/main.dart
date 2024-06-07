import "package:flutter/material.dart";
import "package:manga_reader_app/components/button_component.dart";
import "package:manga_reader_app/pages/home_page.dart";
import "package:percent_indicator/linear_percent_indicator.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
