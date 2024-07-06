import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
  const Custombutton(
      {super.key,
      this.onTap,
      required this.text,
      required this.color,
      this.textStyle});

  final String text;
  final VoidCallback? onTap;
  final Color? color;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    // Get the media query data
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    // Calculate the button width and height as a percentage of the screen size
    final buttonWidth = screenWidth * 0.4; // Width as 80% of the screen width
    final buttonHeight =
        screenHeight * 0.06; // Height as 6% of the screen height

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: buttonWidth, // Use calculated width
        height: buttonHeight, // Use calculated height
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: color,
        ),
        child: Center(
          child: Text(
            text,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
