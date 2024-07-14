import 'package:ahramgo/core/utils/styles.dart';
import 'package:ahramgo/features/home/data/presentation/widgets/adv.dart';
import 'package:ahramgo/features/home/data/presentation/widgets/custom_appbar.dart';
import 'package:ahramgo/features/home/data/presentation/widgets/custom_feature_listview.dart';
import 'package:ahramgo/features/home/data/presentation/widgets/custom_nav_bar.dart';
import 'package:ahramgo/features/home/data/presentation/widgets/previous_request_list.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          CustomAppBar(),
          SizedBox(
            height: 7,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "تصفح خدماتنا",
                    style: Styles.textstyle16,
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CustomFeaturedListview(),
          Adv(),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "طلبات سابقة",
                    style: Styles.textstyle16,
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 9,
          ),
          PreviousRequestList(),
          NavBar(),
        ],
      ),
    );
  }
}
