import 'package:ahramgo/core/utils/assets.dart';
import 'package:ahramgo/features/home/data/presentation/widgets/previous_request.dart';
import 'package:flutter/material.dart';

class PreviousRequestList extends StatelessWidget {
  const PreviousRequestList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: PreviousRequest(
                  text: "طلبات",
                  image: kOrderLogo,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: PreviousRequest(
                  text: "غسلات",
                  image: kWashingMachine,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: PreviousRequest(
                  text: "تنقلات",
                  image: kTaxiLogo,
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
