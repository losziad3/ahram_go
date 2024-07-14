import 'package:flutter/material.dart';

class Adv extends StatelessWidget {
  const Adv({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/ADVpng.png"),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
