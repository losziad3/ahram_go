import 'package:ahramgo/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          SvgPicture.asset(kMenuLogo),
          const Spacer(
            flex: 1,
          ),
          SvgPicture.asset(kNotificationLogo),
        ],
      ),
    );
  }
}
