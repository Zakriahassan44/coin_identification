import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double width;
  final double height;

  final IconData? icon;
  final Color? iconColor;
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.width,
    required this.height,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: Offset.fromDirection(2, 3),
            blurRadius: 2,
          ),
        ],
        gradient: const LinearGradient(
          colors: [
            Color(0xffFF7043),
            Color(0xffFF7E5F),
            Color(0xffFEB47B),
          ], // Pink to Orange
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: TextButton.icon(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          "assets/Icons/search.svg",
          matchTextDirection: true,
        ),
        label: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
