import 'package:ahramgo/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PreviousRequest extends StatelessWidget {
  const PreviousRequest({super.key, required this.text, required this.image});
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth * 0.3;
        return Column(
          children: [
            AspectRatio(
              aspectRatio: 2.5 / 2.3,
              child: Container(
                width: width,
                decoration: BoxDecoration(
                  color: const Color(0x05000000),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      image,
                      fit: BoxFit.cover,
                      width: width * 0.8,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      text,
                      style: Styles.textstyle16.copyWith(
                        color: const Color(0xFF545454),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
