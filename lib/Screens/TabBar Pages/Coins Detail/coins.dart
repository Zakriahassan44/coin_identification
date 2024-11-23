import 'dart:io';
import 'package:coin_identification/Components/custom_listtile.dart';
import 'package:coin_identification/Model/coin_model.dart';
import 'package:coin_identification/Screens/TabBar%20Pages/Coins%20Detail/coins_detail_screen.dart';
import 'package:coin_identification/Services/coin_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Coins extends StatefulWidget {
  const Coins({super.key});

  @override
  State<Coins> createState() => _CoinsState();
}

class _CoinsState extends State<Coins> {
  late Future<List<CoinModel>> _coin;

  @override
  void initState() {
    super.initState();
    _coin = CoinServices().fetchCoin();
  }

  Future<void> _refreshCoins() async {
    setState(() {
      _coin = CoinServices().fetchCoin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: RefreshIndicator(
        onRefresh: _refreshCoins,
        backgroundColor: const Color(0xffFF7E5F),
        color: Colors.white,
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        child: FutureBuilder<List<CoinModel>>(
          future: _coin,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(
                    Color(0xffFF7E5F),
                  ),
                  strokeCap: StrokeCap.round,
                ),
              );
            } else if (snapshot.hasError) {
              if (snapshot.error is SocketException) {
                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/Images/noInternetConnection.svg",
                          width: 200,
                          height: 200,
                        ),
                        const Center(
                          child: Text(
                            "No Internet Connection.",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Center(
                  child: Text("Error: ${snapshot.error}"),
                );
              }
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment.center,
                  child: const Text("No data available."),
                ),
              );
            } else {
              final coins = snapshot.data!;
              return ListView.builder(
                itemCount: coins.length,
                itemBuilder: (context, index) {
                  final coin = coins[index];
                  return CustomListtile(
                    title: coin.title,
                    image:
                        'https://awamisolution.com/coins/picture/${coin.picture}',
                    description: "This Coin is from the 19th Century",
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  CoinsDetailScreen(coin: coin),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
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
              );
            }
          },
        ),
      ),
    );
  }
}
