import 'package:ahramgo/core/utils/assets.dart';
import 'package:ahramgo/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomFeatureList extends StatelessWidget {
  const CustomFeatureList({super.key, required this.text});
  final String text;
  // final AspectRatio aspectRatio;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 2.5 / 2,
          child: Container(
            width: 160,
            decoration: BoxDecoration(
              color: Color(0x05000000),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset(
                //   AssetsData.shoppinglogo,
                //   fit: BoxFit.cover,
                // ),
                const SizedBox(height: 8),
                Text(
                  text,
                  style:
                      Styles.textstyle16.copyWith(fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
