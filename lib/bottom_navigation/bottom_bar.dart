import 'package:eastern_demo/bottom_navigation/category.dart';
import 'package:eastern_demo/bottom_navigation/curate.dart';
import 'package:eastern_demo/bottom_navigation/home.dart';
import 'package:eastern_demo/bottom_navigation/more.dart';
import 'package:eastern_demo/bottom_navigation/sale.dart';
import 'package:flutter/material.dart';

import '../constant/const_color.dart';
import '../constant/const_image.dart';
import '../widget/show_image.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  void initState() {
    super.initState();
    _initWidgetOptions();
  }

  void _initWidgetOptions() {
    widgetOptions = [
      const Home(),
      const Category(),
      const Curate(),
      const Sale(),
      const More()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions[_selectedIndex],
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  int _selectedIndex = 0;
  List<Widget> widgetOptions = [];

  Widget _buildBottomNavigation() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        _barItem(
            activeIcon: ConstImage.home,
            inactiveIcon: ConstImage.home,
            label: "HOME"),
        _barItem(
            activeIcon: ConstImage.message,
            inactiveIcon: ConstImage.message,
            label: "CATEGORY"),
        _barItem(
            activeIcon: ConstImage.profile,
            inactiveIcon: ConstImage.profile,
            label: "CURATE"),
        _barItem(
            activeIcon: ConstImage.setting,
            inactiveIcon: ConstImage.setting,
            label: "SALE"),
        _barItem(
            activeIcon: ConstImage.setting,
            inactiveIcon: ConstImage.setting,
            label: "MORE"),
      ],
      unselectedItemColor: ConstColor.gray200,
      enableFeedback: false,
      currentIndex: _selectedIndex,
      selectedItemColor: ConstColor.appColor,
      elevation: 20,
      type: BottomNavigationBarType.fixed,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  BottomNavigationBarItem _barItem(
      {required String activeIcon,
      required String inactiveIcon,
      required String label}) {
    return BottomNavigationBarItem(
      icon: Padding(
          padding: const EdgeInsets.all(6),
          child: ShowImage(imagePath: inactiveIcon)),
      activeIcon: Padding(
        padding: const EdgeInsets.all(6),
        child: ShowImage(
          imagePath: activeIcon,
          color: ConstColor.appColor,
        ),
      ),
      label: label,
    );
  }
}
