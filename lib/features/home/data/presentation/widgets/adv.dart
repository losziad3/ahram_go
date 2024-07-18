import 'package:ahramgo/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Adv extends StatelessWidget {
  const Adv({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(kAdvImage),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
