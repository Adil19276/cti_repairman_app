import 'package:cti_repairman_app/colors.dart';
import 'package:cti_repairman_app/repairman_info/address_info.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class contact_info extends StatefulWidget {
  final TextEditingController? controller;
  const contact_info({this.controller});

  @override
  State<contact_info> createState() => _contact_infoState();
}

class _contact_infoState extends State<contact_info> {
  final field1 = TextEditingController();
  final field2 = TextEditingController();
  final field3 = TextEditingController();
  final field4 = TextEditingController();
  final field5 = TextEditingController();
  String? selectedGender;

  bool get allFilled =>
      field1.text.isNotEmpty &&
      field2.text.isNotEmpty &&
      field3.text.isNotEmpty &&
      field4.text.isNotEmpty &&
      field5.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    field1.addListener(() => setState(() {}));
    field2.addListener(() => setState(() {}));
    field3.addListener(() => setState(() {}));
    field4.addListener(() => setState(() {}));
    field5.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
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
          Text("Step 2-5", style: TextStyle(fontSize: 18)),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: GestureDetector(
              onTap:
                  allFilled
                      ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => address_info(),
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
            buildLine(Themeorangecolor),
            buildDiamondShape('2', Themeorangecolor),
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
                      "Contact Information",
                      style: GoogleFonts.lato(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              buildsearchbar('Mobile Number', '05XXXXXXXXX', field1),
              buildsearchbar("WhatsApp Number", '05XXXXXXXXX', field2),
              buildsearchbar('Email Address', 'Put your email', field3),
              buildsearchbar(
                'Emergency Contact Person ',
                'contactor name',
                field4,
              ),
              buildsearchbar('Emergency contact num ', '05XXXXXXXXX', field5),
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
