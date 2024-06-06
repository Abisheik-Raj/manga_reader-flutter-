import "package:flutter/material.dart";

class ButtonComponent extends StatelessWidget {
  String text;
  ButtonComponent({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width * 0.49,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.amber,
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
              fontFamily: "go3", color: Colors.black, fontSize: 15.5),
        ),
      ),
    );
  }
}
