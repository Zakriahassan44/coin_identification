import 'package:coin_identification/Constants/app_fonts.dart';
import 'package:flutter/material.dart';

class InfoContainer extends StatelessWidget {
  final double width;
  // final double height;
  final String mainTitle;
  final Widget? child;
  const InfoContainer({
    super.key,
    required this.width,
    //  required this.height,
    required this.mainTitle,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset.fromDirection(2, 4),
            blurRadius: 1.5,
          ),
        ],
        gradient: const LinearGradient(
          transform: GradientRotation(23),
          colors: [
            Color(0xffFFF9E7),
            Color(0xffF0F0F0),
            Color(0xffE0E0E0),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            mainTitle,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: "Montserrat"),
          ),
          const SizedBox(
            height: 15,
          ),
          if (child != null) child!,
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 2),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Text(
                label,
                textAlign: TextAlign.start,
                style: AppFonts.size14,
              ),
            ),
            Container(
              width: .7,
              color: Colors.grey,
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 5,
              child: Text(
                value,
                textAlign: TextAlign.left,
                style: AppFonts.size12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
