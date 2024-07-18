import 'package:ahramgo/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomFeatureList extends StatelessWidget {
  const CustomFeatureList({super.key, required this.text, required this.image});
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 2.5 / 2.3,
          child: Container(
            width: width * 0.4, // making container width responsive
            decoration: BoxDecoration(
              color: const Color(0x05000000),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  image,
                  width: width * 0.3, // making image width responsive
                ),
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
