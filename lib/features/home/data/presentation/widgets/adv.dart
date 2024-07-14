import 'package:ahramgo/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Adv extends StatelessWidget {
  const Adv({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(kadvimage),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
