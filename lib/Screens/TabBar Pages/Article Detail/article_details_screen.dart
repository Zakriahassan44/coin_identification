import 'package:coin_identification/Constants/app_fonts.dart';
import 'package:flutter/material.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final String title;
  final String description;

  const ArticleDetailsScreen({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF9E6),
      appBar: AppBar(
        title: Text(title, style: AppFonts.size18),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    // boxShadow: [
                    //   // BoxShadow(
                    //   //   color: Colors.black.withOpacity(0.1),
                    //   //   spreadRadius: 1,
                    //   //   blurRadius: 8,
                    //   //   offset: const Offset(0, 3),
                    //   // ),
                    // ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      "assets/Images/gold Coin.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(
                color: Colors.grey,
                height: 20,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: AppFonts.size20,
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: AppFonts.size14,
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
