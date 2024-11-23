import 'package:flutter/material.dart';

class CoinSizeDiagram extends StatelessWidget {
  final String imagePath;

  const CoinSizeDiagram({required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.contain,
        ),
        Positioned(
          left: 20,
          top: 60,
          child: CustomPaint(
            size: const Size(200, 200),
            painter: LinePainter(),
          ),
        ),
        const Positioned(
          left: 15,
          top: 25,
          child: Text(
            'Weight\n3.92 g',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
        const Positioned(
          left: 140,
          bottom: 0,
          child: Text(
            'Thickness\n1.67 mm',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
        const Positioned(
          right: 15,
          top: 50,
          child: Text(
            'Diameter\n21.25 mm',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1;

    // Line for Weight
    canvas.drawLine(const Offset(40, 10), const Offset(102, 95), paint);
    canvas.drawLine(const Offset(40, 10), const Offset(-10, 10), paint);

    // Line for Thickness
    canvas.drawLine(const Offset(150, 120), const Offset(150, 180), paint);

    // Line for Diameter
    canvas.drawLine(const Offset(270, 30), const Offset(212, 86), paint);
    canvas.drawLine(const Offset(330, 30), const Offset(270, 30), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
