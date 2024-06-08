import "package:flutter/material.dart";

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black,
                  Colors.black.withOpacity(0.4),
                  Colors.white.withOpacity(0.6),
                ],
                stops: const [
                  0.1,
                  0.5,
                  0.7,
                ],
              ),
            ),
          ),
          // Halftone pattern
          CustomPaint(
            painter: HalftonePainter(dotSpacing: 6, dotRadius: 1.5),
            child: Container(),
          ),
        ],
      ),
    );
  }
}

class HalftonePainter extends CustomPainter {
  final int dotSpacing;
  final double dotRadius;

  HalftonePainter({this.dotSpacing = 10, this.dotRadius = 2.0});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    for (double y = 0; y < size.height; y += dotSpacing) {
      for (double x = 0; x < size.width; x += dotSpacing) {
        final offset = Offset(x, y);
        canvas.drawCircle(offset, dotRadius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
