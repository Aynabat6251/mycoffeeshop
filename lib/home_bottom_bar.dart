import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'bottom_nav.dart';
import 'buttom_provider.dart';


class BottonNavBar extends StatelessWidget {
  const BottonNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MainSecreenNotifier>(
        builder: (context, mainSecreenNotifier, child) {
      return SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: const BoxDecoration(
              color:  Color.fromARGB(255, 50, 54, 56),
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            BotomNavWidget(
              onTap: () {
                mainSecreenNotifier.pageIndex = 0;
              },
              icon: mainSecreenNotifier.pageIndex == 0
                  ? Icons.home
                  : Icons.home_outlined,
            ),
           
            BotomNavWidget(
              onTap: () {
                mainSecreenNotifier.pageIndex = 1;
              },
              icon: mainSecreenNotifier.pageIndex == 1
                  ? Icons.favorite
                  : Icons.favorite_border,
            ),
            BotomNavWidget(
              onTap: () {
                mainSecreenNotifier.pageIndex = 2;
              },
              icon: mainSecreenNotifier.pageIndex == 2
                  ? Icons.shopping_cart
                  : Icons.shopping_cart_outlined,
            ),
            BotomNavWidget(
              onTap: () {
                mainSecreenNotifier.pageIndex = 3;
              },
              icon: mainSecreenNotifier.pageIndex == 3
                  ? Icons.person
                  : Icons.person_outline,
            ),
          ]),
        ),
      ));
    });
  }
}

