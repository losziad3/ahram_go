import 'package:ahramgo/core/utils/assets.dart';
import 'package:ahramgo/feature/home/data/presentation/widgets/previous_request.dart';
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
                  image: AssetsData.orderlogo,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: PreviousRequest(
                  text: "غسلات",
                  image: AssetsData.washingmachine,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: PreviousRequest(
                  text: "تنقلات",
                  image: AssetsData.carlogo,
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
