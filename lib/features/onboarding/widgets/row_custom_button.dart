import 'package:ahramgo/components/custom_button.dart';
import 'package:flutter/material.dart';

class ListCustomButton extends StatelessWidget {
  const ListCustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
          text: "التالي",
          color: Color(0xFF144CA1),
          textStyle: TextStyle(
              color: Colors.white,
              fontFamily: "Cairo",
              fontWeight: FontWeight.w700,
              fontSize: 14),
        ),
        CustomButton(
          text: "تخطي",
          color: Color(0x02000000),
          textStyle: TextStyle(
            color: Color(0x4D000000),
          ),
        ),
      ],
    );
  }
}
