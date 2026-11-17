import 'package:cti_repairman_app/colors.dart';
import 'package:cti_repairman_app/repairman_info/Docs_upload.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class experience extends StatefulWidget {
  final TextEditingController? controller;
  const experience({this.controller});

  @override
  State<experience> createState() => _experienceState();
}

class _experienceState extends State<experience> {
  final field1 = TextEditingController();
  final field2 = TextEditingController();
  final field3 = TextEditingController();
  final field4 = TextEditingController();
  final field5 = TextEditingController();
  final field6 = TextEditingController();
  String? selectedpickup;

  bool get allFilled =>
      field1.text.isNotEmpty &&
      field2.text.isNotEmpty &&
      field3.text.isNotEmpty &&
      field4.text.isNotEmpty &&
      field5.text.isNotEmpty &&
      field6.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    field1.addListener(() => setState(() {}));
    field2.addListener(() => setState(() {}));
    field3.addListener(() => setState(() {}));
    field4.addListener(() => setState(() {}));
    field5.addListener(() => setState(() {}));
    field6.addListener(() => setState(() {}));
  }

  final days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  final Set<String> selectedDays = {};

  @override
  Widget build(BuildContext context) {
    final pickups = ["Yes", "No"];
    return Scaffold(
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Themeoffwhitecolor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Previous",
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ),
              ),
            ),
          ),
          Text("Step 4-5", style: TextStyle(fontSize: 18)),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: GestureDetector(
              onTap:
                  allFilled
                      ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DocsUpload()),
                        );
                      }
                      : null,
              child: Container(
                decoration: BoxDecoration(
                  color:
                      allFilled
                          ? Themeorangecolor
                          : Themeorangecolor.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Next Step",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildDiamondShape('1', Themeorangecolor),
            buildLine(Themeorangecolor),
            buildDiamondShape('2', Themeorangecolor),
            buildLine(Themeorangecolor),
            buildDiamondShape('3', Themeorangecolor),
            buildLine(Themeorangecolor),
            buildDiamondShape('4', Themeorangecolor),
            buildLine(Themeoffwhitecolor),
            buildDiamondShape('5', Themeoffwhitecolor),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    Text(
                      "Experience & Availability",
                      style: GoogleFonts.lato(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              buildsearchbar('Year of Experience', '00', field1),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Pickup Service Available ?",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:
                          pickups.map((pickup) {
                            final isSelected = selectedpickup == pickup;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedpickup = pickup;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 18,
                                  vertical: 8,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.black),
                                        color:
                                            isSelected
                                                ? Colors.blueAccent
                                                : Colors.transparent,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      pickup,
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                    ),
                  ],
                ),
              ),
              buildsearchbar("Specializtion", 'Add your Specializtion', field2),
              buildsearchbar("Brand's Work", 'Select brand', field3),
              buildsearchbar('Working Hour - Start', '--:--am/pm', field4),
              buildsearchbar('Working Hour - End', '--:--am/pm', field5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Working Days",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:
                      days.map((day) {
                        final isChecked = selectedDays.contains(day);
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 8,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (isChecked) {
                                  selectedDays.remove(day);
                                } else {
                                  selectedDays.add(day);
                                }
                              });
                            },
                            child: Container(
                              height: 45,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey),
                                color:
                                    isChecked
                                        ? Colors.orange.withOpacity(0.2)
                                        : null,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Checkbox(
                                    value: isChecked,
                                    onChanged: (value) {
                                      setState(() {
                                        if (value!) {
                                          selectedDays.add(day);
                                        } else {
                                          selectedDays.remove(day);
                                        }
                                      });
                                    },
                                    activeColor: Colors.orange,
                                  ),
                                  Text(day),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Container(
                  height: 120,
                  child: TextField(
                    controller: field6,
                    maxLines: null,
                    expands: true,
                    decoration: InputDecoration(
                      hintText: "Describe Your Services",
                      hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: EdgeInsets.all(8),
                    ),
                    textAlign: TextAlign.start,
                    textAlignVertical: TextAlignVertical.top,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDiamondShape(String text, Color color) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),

      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget buildLine(Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(height: 2, width: 25, color: color),
    );
  }

  Widget buildsearchbar(
    String label,
    String hint,
    TextEditingController controller,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 10),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: hint,
                hintStyle: const TextStyle(color: Colors.grey),
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
