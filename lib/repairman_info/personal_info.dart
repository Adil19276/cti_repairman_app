import 'package:cti_repairman_app/colors.dart';
import 'package:cti_repairman_app/repairman_info/contact_info.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class personal_info extends StatefulWidget {
  final TextEditingController? controller;
  const personal_info({this.controller});

  @override
  State<personal_info> createState() => _personal_infoState();
}

// ignore: camel_case_types
class _personal_infoState extends State<personal_info> {
  final field1 = TextEditingController();
  final field2 = TextEditingController();
  final field3 = TextEditingController();
  final field4 = TextEditingController();
  String? selectedGender;

  bool get allFilled =>
      field1.text.isNotEmpty &&
      field2.text.isNotEmpty &&
      field3.text.isNotEmpty &&
      field4.text.isNotEmpty &&
      selectedGender != null;

  @override
  void initState() {
    super.initState();
    field1.addListener(() => setState(() {}));
    field2.addListener(() => setState(() {}));
    field3.addListener(() => setState(() {}));
    field4.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final genders = ["Male", "Female", "Other"];
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
          Text("Step 1-5", style: TextStyle(fontSize: 18)),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: GestureDetector(
              onTap:
                  allFilled
                      ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => contact_info(),
                          ),
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
            buildLine(Themeoffwhitecolor),
            buildDiamondShape('2', Themeoffwhitecolor),
            buildLine(Themeoffwhitecolor),
            buildDiamondShape('3', Themeoffwhitecolor),
            buildLine(Themeoffwhitecolor),
            buildDiamondShape('4', Themeoffwhitecolor),
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
                      "Personal Information",
                      style: GoogleFonts.lato(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              buildsearchbar('Full Name', 'Enter full name', field1),
              buildsearchbar("Father's Name", 'Enter father name', field2),
              buildsearchbar('T.C Identify Number', 'Enter ID num', field3),
              buildsearchbar('Date of Birth ', 'dd/mm/yy', field4),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Gender",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children:
                    genders.map((gender) {
                      final isSelected = selectedGender == gender;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGender = gender;
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
                                gender,
                                style: const TextStyle(color: Colors.black),
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
