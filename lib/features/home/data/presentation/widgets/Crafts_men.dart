import 'package:ahramgo/components/custom_button.dart';
import 'package:ahramgo/core/constants/colors.dart';
import 'package:ahramgo/core/utils/assets.dart';
import 'package:ahramgo/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CraftsMen extends StatelessWidget {
  const CraftsMen({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth * 0.3;
        return AspectRatio(
          aspectRatio: 2.5 / 1,
          child: GestureDetector(
            onTap: () => showModalBottomSheet(
              context: context,
              builder: (context) => SizedBox(
                height: MediaQuery.of(context).size.height * 0.77,
                child: BuildSheet(),
              ),
              isScrollControlled:
                  true, // Allows the bottom sheet to be full screen
            ),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0x05000000),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Centered photo above the container
                  Image.asset(
                    kCrafts,
                    fit: BoxFit.cover,
                    width: width * 0.8,
                  ),
                  // SvgPicture.asset(
                  //   craftsmen,
                  //   fit: BoxFit.cover,
                  //   width: width * 0.6,
                  // ),
                  const SizedBox(height: 8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Adjust this container content if needed
                      Text(
                        text,
                        style: Styles.textstyle16
                            .copyWith(fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class BuildSheet extends StatefulWidget {
  @override
  BuildSheetState createState() => BuildSheetState();
}

class BuildSheetState extends State<BuildSheet> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: FractionallySizedBox(
        widthFactor: 1.0,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 30, horizontal: screenWidth * 0.05),
          child: ListView(
            children: [
              const Text(
                "نوع الحرفي",
                style: Styles.textstyle16,
              ),
              const SizedBox(height: 5),
              DropdownButtonFormField<String>(
                value: selectedValue,
                hint: const Text('اختار الحرفي'),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                },
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.grey, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                items: <String>['Option 1', 'Option 2', 'Option 3']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              const Text(
                "تعليماتك",
                style: Styles.textstyle16,
              ),
              const SizedBox(height: 8),
              TextFormField(
                maxLines: 6,
                decoration: InputDecoration(
                  hintText: 'من فضلك ادخل اي تعليمات او تعليقات',
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xFFD9DBE9), width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "العنوان",
                style: Styles.textstyle16,
              ),
              const SizedBox(height: 8),
              AspectRatio(
                aspectRatio: 7 / 1,
                child: Container(
                  width: screenWidth * 0.8,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFA0A3BD)),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Stack(
                    children: [
                      const Positioned(
                        right: 30,
                        top: 10,
                        bottom: 10,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("الموقع الحالي"),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          // child: Image.asset(AssetsData.locationlogo),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const CustomButton(
                text: "طلب",
                color: mainColor,
                textStyle: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const CustomButton(
                  text: "الغاء",
                  color: Colors.white10,
                  textStyle: TextStyle(
                    color: mainColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
