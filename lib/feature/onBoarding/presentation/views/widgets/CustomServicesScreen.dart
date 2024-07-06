import 'package:ahramgo/core/utils/styles.dart';
import 'package:flutter/material.dart';

class Servicesscreen extends StatelessWidget {
  const Servicesscreen(
      {super.key,
      required this.image,
      required this.text1,
      required this.text2,
      required this.text3});
  final String image;
  final String text1;
  final String text2;
  final String text3;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(image),
            // child: SvgPicture.asset("assets/images/Image1.svg"),
          ),
          const SizedBox(
            height: 35,
          ),
          Text(
            text1,
            style: Styles.textstyle18,
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Text(
                text2,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: Styles.textstyle13,
              ),
              Text(
                text3,
                textAlign: TextAlign.center,
                style: Styles.textstyle13,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
