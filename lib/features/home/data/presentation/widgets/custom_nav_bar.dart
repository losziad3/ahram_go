// import 'package:ahramgo/core/utils/assets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class NavBar extends StatefulWidget {
//   const NavBar({super.key});

//   @override
//   _NavBarState createState() => _NavBarState();
// }

// class _NavBarState extends State<NavBar> {
//   int currentIndex = 0;
//   final Color primaryColor = Color(0xFF124CA1);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.vertical(
//           bottom: Radius.circular(32),
//         ),
//       ),
//       child: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         currentIndex: currentIndex,
//         selectedItemColor: primaryColor,
//         unselectedItemColor: Colors.grey,
//         onTap: (index) {
//           setState(() {
//             currentIndex = index;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//               AssetsData.userlogo,
//               color: Colors.grey,
//             ),
//             activeIcon: SvgPicture.asset(
//               AssetsData.userlogo,
//               color: primaryColor,
//             ),
//             label: "حسابي",
//           ),
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//               AssetsData.shoppingcartlogo,
//               color: Colors.grey,
//             ),
//             activeIcon: SvgPicture.asset(
//               AssetsData.shoppingcartlogo,
//               color: primaryColor,
//             ),
//             label: "العربة",
//           ),
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//               AssetsData.serviceslogo,
//               color: Colors.grey,
//             ),
//             activeIcon: SvgPicture.asset(
//               AssetsData.serviceslogo,
//               color: primaryColor,
//             ),
//             label: "خدماتنا",
//           ),
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//               AssetsData.homelogo,
//               color: Colors.grey,
//             ),
//             activeIcon: SvgPicture.asset(
//               AssetsData.homelogo,
//               color: primaryColor,
//             ),
//             label: "الرئيسية",
//           ),
//         ],
//       ),
//     );
//   }
// }
