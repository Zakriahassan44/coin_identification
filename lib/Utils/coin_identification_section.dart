import 'dart:io';

import 'package:coin_identification/Components/custom_button.dart';
import 'package:coin_identification/Constants/app_fonts.dart';
import 'package:coin_identification/Utils/picker.dart';
import 'package:flutter/material.dart';

class CoinIdentificationSection extends StatefulWidget {
  const CoinIdentificationSection({super.key});

  @override
  State<CoinIdentificationSection> createState() =>
      _CoinIdentificationSectionState();
}

class _CoinIdentificationSectionState extends State<CoinIdentificationSection> {
  File? image;
// Camera
  Future<void> _camera() async {
    File? image = await Picker.pickImageFromCamera();
    if (image != null) {
      setState(() {
        image = image;
      });
    }
  }

  // Gallery
  Future<void> _gallery() async {
    File? image = await Picker.pickImageFromGallery();
    if (image != null) {
      setState(() {
        image = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            top: 50,
            child: Container(
              width: 400,
              height: 250,
              decoration: BoxDecoration(
                //color: const Color(0xffFFF4E1),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 2,
                    offset: Offset.fromDirection(2, 4),
                  ),
                ],
                gradient: const LinearGradient(
                  colors: [
                    Color(0xffFFDAB9), // Light Peach
                    Color(0xffE3F2FD), // Light Mint
                    Color(0xffFFB6C1), // Light Pink
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "Identify Coins",
                    style: AppFonts.size18,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Click the Identify button to Start \n Seeing Coin Information",
                    style: AppFonts.size14,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    title: "Find Coins",
                    onPressed: dialog,
                    height: 60,
                    width: 350,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              "assets/Images/gold Coin.png",
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  void dialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: 300,
                padding: const EdgeInsets.only(
                  top: 50,
                  left: 20,
                  right: 20,
                  bottom: 20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xffFFDAB9), // Light Peach
                      Color(0xffE3F2FD), // Light Mint
                      Color(0xffFFB6C1), // Light Pink
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Select Image Source",
                      style: AppFonts.size20,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    const Text("Please select an option",
                        style: AppFonts.size16),
                    const SizedBox(height: 26),
                    button(
                      title: "Gallery",
                      onPressed: () {
                        _gallery();
                        Navigator.of(context).pop();
                      },
                      icon: Icons.filter_hdr_rounded,
                    ),
                    const SizedBox(height: 20),
                    button(
                      title: "Camera",
                      onPressed: () {
                        _camera();
                        Navigator.of(context).pop();
                      },
                      icon: Icons.camera_alt_outlined,
                    )
                  ],
                ),
              ),
              Positioned(
                top: -50,
                child: Image.asset(
                  "assets/Images/gold Coin.png",
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget button(
      {required VoidCallback onPressed,
      required String title,
      required IconData icon}) {
    return Container(
      width: 190,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset.fromDirection(2, 3),
            blurRadius: 1,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 28,
          ),
          const SizedBox(
            width: 20,
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: " assets/fonts/Montserrat-Regular.ttf",
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
