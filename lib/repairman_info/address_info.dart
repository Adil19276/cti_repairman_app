import 'package:cti_repairman_app/colors.dart';
import 'package:cti_repairman_app/repairman_info/experience.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class address_info extends StatefulWidget {
  final TextEditingController? controller;
  const address_info({this.controller});

  @override
  State<address_info> createState() => _address_infoState();
}

class _address_infoState extends State<address_info> {
  final field1 = TextEditingController();
  final field2 = TextEditingController();
  final field3 = TextEditingController();
  final field4 = TextEditingController();
  final field5 = TextEditingController();
  final field6 = TextEditingController();
  String? selectedGender;

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
          Text("Step 3-5", style: TextStyle(fontSize: 18)),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: GestureDetector(
              onTap:
                  allFilled
                      ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => experience()),
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
                      "Address & Location",
                      style: GoogleFonts.lato(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              buildsearchbar('Shop Name', 'Your shop name', field1),
              buildsearchbar("City", 'Auto-filled from map selection', field2),
              buildsearchbar(
                'District',
                'Auto-filled from map selection',
                field3,
              ),
              buildsearchbar('Zip Code ', 'Enter zip code', field4),
              buildsearchbar(
                'Full Address',
                'Auto-filled from map selection',
                field5,
              ),
              buildsearchbar(
                'Search Your location',
                'Auto-filled from map selection',
                field6,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "🔎 Select Location on Map",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://img.freepik.com/vektoren-premium/abstrakter-stadtplan_99087-43.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Map Holder"),
                    ),
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
