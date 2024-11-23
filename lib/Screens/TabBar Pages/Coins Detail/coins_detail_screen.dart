import 'package:coin_identification/Constants/app_fonts.dart';
import 'package:coin_identification/Model/coin_model.dart';
import 'package:coin_identification/Provider/favorite_coins_provider.dart';
import 'package:coin_identification/Screens/TabBar%20Pages/Coins%20Detail/coin_diagram.dart';
import 'package:coin_identification/Screens/TabBar%20Pages/Coins%20Detail/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoinsDetailScreen extends StatelessWidget {
  final CoinModel coin;

  const CoinsDetailScreen({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF9E6),
      appBar: AppBar(
        title: const Text("Coin", style: AppFonts.size18),
        elevation: 0,
        backgroundColor: const Color(0xffFFF9E6),
        actions: [
          Consumer<FavoriteCoinsProvider>(
            builder: (context, favorite, child) {
              return IconButton(
                onPressed: () {
                  favorite.toggleFavorite(coin);
                },
                icon: Icon(
                  favorite.isFavorite(coin)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  size: 24,
                  color: favorite.isFavorite(coin) ? Colors.red : Colors.grey,
                ),
                padding: const EdgeInsets.only(right: 10),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Center(
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    color: const Color(0xFFFFF7E9),
                    alignment: Alignment.center,
                    child: Image.network(
                      'https://awamisolution.com/coins/picture/${coin.picture}',
                      width: 200,
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                InfoContainer(
                  width: double.infinity,
                  mainTitle: coin.title,
                  child: Column(
                    children: [
                      InfoRow(label: "Country", value: coin.country),
                      InfoRow(label: "Years", value: coin.years),
                      InfoRow(label: "Coin Type", value: coin.coinType),
                      InfoRow(label: "Shape", value: coin.shape),
                      InfoRow(label: "Category", value: coin.category),
                      InfoRow(label: "Orientation", value: coin.orientation),
                    ],
                  ),
                ),

                // Composition
                InfoContainer(
                  width: double.infinity,
                  mainTitle: "Composition",
                  child: Column(
                    children: [
                      Text(coin.composition, style: AppFonts.size12),
                    ],
                  ),
                ),

                // Obverse
                InfoContainer(
                  width: double.infinity,
                  mainTitle: "Obverse",
                  child: Column(
                    children: [
                      Text(coin.obverse, style: AppFonts.size12)
                      // InfoRow(
                      //     label: "Engravers", value: "Heikki Aulis Haivoaja"),
                      // InfoRow(
                      //     label: "Description",
                      //     value:
                      //         "The Finnish heraldic lion\nwith year  on the left and \nmint master initial below \nand twelve five-pointed\nstars representing the."),
                      // InfoRow(label: "Lettering", value: "2006 M"),
                    ],
                  ),
                ),

                // Reverse
                InfoContainer(
                  width: double.infinity,
                  mainTitle: "Reverse",
                  child: Column(
                    children: [
                      Text(coin.reverse, style: AppFonts.size12)
                      // InfoRow(label: "Engravers", value: "Luc Luycx"),
                      // InfoRow(
                      //     label: "Description",
                      //     value:
                      //         "The Finnish heraldic lion\nwith year  on the left and \nmint master initial below."),
                      // InfoRow(label: "Lettering", value: "1 Euro CENT LL"),
                    ],
                  ),
                ),

                // New Minting Information Section
                InfoContainer(
                  width: double.infinity,
                  mainTitle: "Minting Information",
                  child: Column(
                    children: [
                      InfoRow(label: "Mint Location", value: coin.minting),
                      InfoRow(label: "Mint Year", value: coin.years),
                      const InfoRow(label: "Total Mintage", value: "1,000,000"),
                      const InfoRow(
                          label: "Minting Process", value: "Modern Coinage"),
                    ],
                  ),
                ),

                // New Market Value Section
                InfoContainer(
                  width: double.infinity,
                  mainTitle: "Market Value",
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(coin.marketValue, style: AppFonts.size12),
                    ],
                  ),
                ),

                // New Rarity Section
                InfoContainer(
                  width: double.infinity,
                  mainTitle: "Rarity",
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(coin.rarity, style: AppFonts.size12),
                    ],
                  ),
                ),
                const InfoContainer(
                  width: double.infinity,
                  mainTitle: "Size",
                  child: CoinSizeDiagram(
                    imagePath: "assets/Images/Coin.png",
                  ),
                ),
                InfoContainer(
                  width: double.infinity,
                  mainTitle: "Size",
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(coin.size, style: AppFonts.size12),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
