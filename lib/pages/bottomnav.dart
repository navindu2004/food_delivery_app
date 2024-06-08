import 'package:flutter/material.dart';
import 'package:flutterapp_02/pages/home.dart';
import 'package:flutterapp_02/pages/order.dart';
import 'package:flutterapp_02/pages/profile.dart';
import 'package:flutterapp_02/pages/wallet.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTabIndex = 0;

  late List<Widget> pages;
  late Widget currentPage;
  late Home homePage;
  late Profile profile;
  late Order order;
  late Wallet wallet;

  @override
  void initState() {
    homePage = Home();
    order = Order();
    profile = Profile();
    wallet = Wallet();
    pages = [homePage, order, wallet, profile];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
