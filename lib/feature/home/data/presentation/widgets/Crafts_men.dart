import 'package:ahramgo/core/utils/assets.dart';
import 'package:ahramgo/core/utils/styles.dart';
import 'package:ahramgo/core/utils/widgets/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CraftsMen extends StatelessWidget {
  const CraftsMen({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.5 / 1,
      child: GestureDetector(
        onTap: () => showModalBottomSheet(
          context: context,
          builder: (context) => BuildSheet(),
        ),
        child: Container(
          width: 120,
          decoration: BoxDecoration(
            color: const Color(0x05000000),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AssetsData.washingmachine,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 8),
              Text(
                text,
                style: Styles.textstyle16.copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: FractionallySizedBox(
        widthFactor: 1.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          child: ListView(
            children: [
              const Text(
                "نوع الحرفي",
                style: Styles.textstyle16,
              ),
              const SizedBox(
                height: 5,
              ),
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
                maxLines: 8, // Adjust the number of lines as needed
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
              const SizedBox(
                height: 8,
              ),
              const Text(
                "العنوان",
                style: Styles.textstyle16,
              ),
              const SizedBox(
                height: 8,
              ),
              AspectRatio(
                aspectRatio: 7 / 1,
                child: Container(
                  width: 226,
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
                          child: Image.asset(AssetsData.locationlogo),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Custombutton(
                text: "طلب",
                color: Color(0xFF124CA1),
                textStyle: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              const Custombutton(
                text: "الغاء",
                color: Colors.white10,
                textStyle: TextStyle(
                  color: Color(0xFF124CA1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
