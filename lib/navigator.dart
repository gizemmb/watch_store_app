import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watches_app/view/bag/components/bag_view.dart';
import 'package:watches_app/view/home/components/home_view.dart';
import 'package:watches_app/view/user_profile/components/user_profile_view.dart';
import '../utils/constants.dart';

class MainNavigator extends StatefulWidget {
  static const routeName = 'screen_navigator';

  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  final PageController _pageController = PageController();
  final List<Widget> _screens = [
    const HomeView(),
    const BagView(),
    const UserProfileView(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      _selectedIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInCirc,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _screens,
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        iconSize: 25,
        bubbleCurve: Curves.linear,
        selectedColor: AppConstantsColor.appthemeColorOther,
        strokeColor: AppConstantsColor.appthemeColorOther,
        unSelectedColor: AppConstantsColor.appthemeColorOther,
        backgroundColor: AppConstantsColor.lightColor,
        scaleFactor: 0.5,
        items: [
          CustomNavigationBarItem(
            icon: const Icon(CupertinoIcons.home, size: 28),
          ),
          CustomNavigationBarItem(
            icon: const Icon(CupertinoIcons.shopping_cart, size: 28),
          ),
          CustomNavigationBarItem(
            icon: const Icon(CupertinoIcons.person, size: 28),
          ),
        ],
      ),
    );
  }
}
