import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'buttom_provider.dart';

import 'cart_page.dart';
import 'favorites.dart';
import 'home_bottom_bar.dart';
import 'homescreen.dart';
import 'profile.dart';

class MainScreen extends StatelessWidget {
  List<Widget> pageList = [
    const HomeScreen(),
    const Favorites(),
     CartPage(),
    const Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<MainSecreenNotifier>(
        builder: (context, mainSecreenNotifier, child) {
      return Scaffold(
        backgroundColor: const Color(0xFF212325),
        body: pageList[mainSecreenNotifier.pageIndex],
        bottomNavigationBar: const BottonNavBar(),
      );
    });
  }
}
