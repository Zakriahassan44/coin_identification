import 'package:coin_identification/Components/custom_listtile.dart';
import 'package:coin_identification/Screens/TabBar%20Pages/Article%20Detail/article_details_screen.dart';
import 'package:flutter/material.dart';

class Articles extends StatelessWidget {
  const Articles({super.key});

  @override
  Widget build(BuildContext context) {
    String description = '''
                      Coins are not just a means of exchange but also a fascinating window into history, culture, and craftsmanship. Among these, rare coins hold a special place in the world of numismatics (coin collecting), valued not just for their age but for their rarity, condition, and historical significance. These coins can be incredibly valuable, often fetching high prices at auctions, and are coveted by collectors around the world.\n\n
                      What Makes a Coin Rare?\n
                      A coin becomes rare for several reasons. Low mintage numbers, errors during production, or coins that were part of a limited series can increase their scarcity. Additionally, some coins were withdrawn from circulation early or were never widely distributed, making them hard to find. Coins that were minted in certain locations or during significant historical periods, such as war or economic turmoil, may also carry increased value due to their backstory.\n\n
                      Types of Rare Coins\n
                      Rare coins come in many forms. Some are historical pieces from ancient civilizations, like Roman or Greek coins, while others might be more modern but feature minting errors, unique designs, or special editions. Some rare coins are made from precious metals like gold, silver, or platinum, adding to their value. Coins that were once in circulation but are no longer minted, such as discontinued denominations or currency from defunct nations, are also prized among collectors.\n\n
                      The Importance of Condition\n
                      The condition, or grade, of a rare coin plays a major role in its value. Coins are graded on a scale that assesses their wear, scratches, and overall appearance. Coins in mint or uncirculated condition—meaning they have never been used—are often the most sought after, especially if they remain in pristine condition over the years. A well-preserved coin can fetch a much higher price than one that shows significant wear, even if it’s the same coin from the same year.
                    ''';
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return CustomListtile(
            title: 'Rare Coin',
            description: 'There are many types of Rare Coins',
            image:
                'https://images.pexels.com/photos/129492/pexels-photo-129492.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', // Ensure the image path is correct
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondryAnimation) =>
                      ArticleDetailsScreen(
                    title: "Rare Coins",
                    description: description,
                  ),
                  transitionsBuilder:
                      (context, animation, secondryAnimation, child) {
                    var begin = const Offset(0.0, 1.0);
                    var end = Offset.zero;
                    var curve = Curves.ease;

                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
