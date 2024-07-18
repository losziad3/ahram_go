import 'package:ahramgo/core/utils/assets.dart';
import 'package:ahramgo/features/home/data/presentation/widgets/Crafts_men.dart';
import 'package:ahramgo/features/home/data/presentation/widgets/Custom_FeatureList.dart';
import 'package:flutter/material.dart';

class CustomFeaturedListview extends StatelessWidget {
  const CustomFeaturedListview({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CraftsMen(
                  text: "حرفيين",
                ),
              ),
            ],
          ),
          SizedBox(
            height: 9,
          ),
          Row(
            children: [
              Expanded(
                child: CustomFeatureList(
                  image: kOrder,
                  text: "التوصيل",
                ),
              ),
              SizedBox(
                width: 9,
              ),
              Expanded(
                child: CustomFeatureList(
                  image: kshopping,
                  text: "التسوق",
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: CustomFeatureList(
                  image: ktransportation,
                  text: "النقل",
                ),
              ),
              SizedBox(
                width: 9,
              ),
              Expanded(
                child: CustomFeatureList(
                  image: kWashingcar,
                  text: "غسيل سيارات",
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
