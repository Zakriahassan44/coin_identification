import 'package:coin_identification/Components/custom_listtile.dart';
import 'package:coin_identification/Provider/favorite_coins_provider.dart';
import 'package:coin_identification/Screens/TabBar%20Pages/Coins%20Detail/coins_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Collection extends StatelessWidget {
  const Collection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Consumer<FavoriteCoinsProvider>(
        builder: (context, favorite, child) {
          final favoriteCoins = favorite.getFavorite();
          if (favoriteCoins.isEmpty) {
            return const Center(
              child: Text("No Collection Exists"),
            );
          }
          return ListView.builder(
            itemCount: favoriteCoins.length,
            itemBuilder: (context, index) {
              final coin = favoriteCoins[index];
              return CustomListtile(
                title: coin.title,
                image:
                    'https://awamisolution.com/coins/picture/${coin.picture}',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => CoinsDetailScreen(coin: coin)));
                },
                description: "This is Temporary Description ",
              );
            },
          );
        },
      ),
    );
  }
}
