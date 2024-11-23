import 'package:coin_identification/Constants/app_fonts.dart';
import 'package:coin_identification/Utils/coin_identification_section.dart';
import 'package:coin_identification/Screens/TabBar%20Pages/Coins%20Detail/coins.dart';
import 'package:coin_identification/Screens/TabBar%20Pages/Collection/collection.dart';
import 'package:coin_identification/Screens/TabBar%20Pages/Article%20Detail/articles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF9E6),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Column(
            children: [
              const CoinIdentificationSection(),
              const SizedBox(
                height: 20,
              ),
              _buildTabBar(),
              _tabBarView(),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for TabBar
  Widget _buildTabBar() {
    return TabBar(
      controller: tabController,
      tabs: const [
        Tab(text: "Coin"),
        Tab(text: "Articles"),
        Tab(text: "Collection"),
      ],
      labelStyle: AppFonts.size14,
      labelColor: const Color(0xffffb74d),
      indicatorColor: const Color(0xffffb74d),
      dividerHeight: 0,
      dragStartBehavior: DragStartBehavior.start,
      unselectedLabelColor: const Color(0xff757575),
    );
  }

  Widget _tabBarView() {
    return Expanded(
      child: TabBarView(
        controller: tabController,
        children: const [
          Coins(),
          Articles(),
          Collection(),
        ],
      ),
    );
  }
}
