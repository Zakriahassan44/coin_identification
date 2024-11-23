import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'Model/coin_model.dart';
import 'Provider/favorite_coins_provider.dart';
import 'Screens/splash_screen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CoinModelAdapter());
  await Hive.openBox<CoinModel>("coinCollection");

  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoriteCoinsProvider(),
      child:  CoinApp(),
    ),
  );
}

class CoinApp extends StatelessWidget {
  const CoinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
        );
      },
    );
  }
}
