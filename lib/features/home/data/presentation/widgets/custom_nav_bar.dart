import 'package:ahramgo/core/constants/colors.dart';
import 'package:ahramgo/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(32),
        ),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedItemColor: mainColor,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              kUserLogo,
              color: Colors.grey,
            ),
            activeIcon: SvgPicture.asset(
              kUserLogo,
              color: mainColor,
            ),
            label: "حسابي",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              kShoppingCart,
              color: Colors.grey,
            ),
            activeIcon: SvgPicture.asset(
              kShoppingCart,
              color: mainColor,
            ),
            label: "العربة",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              kServicesLogo,
              color: Colors.grey,
            ),
            activeIcon: SvgPicture.asset(
              kServicesLogo,
              color: mainColor,
            ),
            label: "خدماتنا",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              kHomeLogo,
              color: Colors.grey,
            ),
            activeIcon: SvgPicture.asset(
              kHomeLogo,
              color: mainColor,
            ),
            label: "الرئيسية",
          ),
        ],
      ),
    );
  }
}
