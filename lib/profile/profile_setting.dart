import 'dart:io';

import 'package:cti_repairman_app/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ProfileSetting extends StatefulWidget {
  const ProfileSetting({super.key});

  @override
  State<ProfileSetting> createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  final ImagePicker _picker = ImagePicker();
  File? _pickedImageFile;

  // Pick image from gallery (mobile)
  Future<void> _pickImageFromGallery() async {
    try {
      final XFile? picked = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
        maxWidth: 1200,
        maxHeight: 1200,
      );

      if (picked == null) return; // user cancelled

      if (!kIsWeb) {
        setState(() {
          _pickedImageFile = File(picked.path);
        });
      } else {
        // For web, you would use picked.readAsBytes() and MemoryImage
        // but here we focus on mobile usage as requested
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
  }

  void _showImageSourceSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library, color: Colors.grey),
                title: const Text('Photo Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImageFromGallery();
                },
              ),
              // Optional: Camera option
              ListTile(
                leading: const Icon(Icons.camera_alt, color: Colors.grey),
                title: const Text('Camera'),
                onTap: () async {
                  Navigator.pop(context);
                  try {
                    final XFile? picked = await _picker.pickImage(
                      source: ImageSource.camera,
                      imageQuality: 85,
                    );
                    if (picked != null && !kIsWeb) {
                      setState(() {
                        _pickedImageFile = File(picked.path);
                      });
                    }
                  } catch (e) {
                    debugPrint('Camera error: $e');
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile Setting",
          style: GoogleFonts.lato(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.15,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/mobile.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    left: 15,
                    bottom: -30,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Themeorangecolor,
                              width: 3,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                color: Themeorangecolor.withOpacity(0.15),
                                shape: BoxShape.circle,
                                image:
                                    _pickedImageFile != null
                                        ? DecorationImage(
                                          image: FileImage(_pickedImageFile!),
                                          fit: BoxFit.cover,
                                        )
                                        : null,
                              ),
                              child:
                                  _pickedImageFile == null
                                      ? Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Image.network(
                                          "https://static.thenounproject.com/png/629576-200.png",
                                          color: Themeorangecolor,
                                        ),
                                      )
                                      : null,
                            ),
                          ),
                        ),
                        Positioned(
                          right: -2,
                          bottom: -2,
                          child: GestureDetector(
                            onTap: _showImageSourceSheet,
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: Themeorangecolor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Icon(
                                CupertinoIcons.photo_camera_solid,
                                size: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 15,
                    bottom: -20,
                    child: GestureDetector(
                      onTap: _showImageSourceSheet,
                      child: Container(
                        height: 30,
                        width: 35,
                        decoration: BoxDecoration(
                          color: Themeorangecolor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          CupertinoIcons.photo_camera_solid,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Dummy ', style: GoogleFonts.lato(fontSize: 20)),
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        Icons.star_outline_rounded,
                        color: Colors.amber,
                        size: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.error, color: Colors.red.shade400),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "Incomplete Bank Details\nYour bank information is missing some details.",
                            style: TextStyle(color: Colors.red.shade700),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  buildCard(
                    title: "About",
                    child: const Text(
                      "any mobile's part and problem repair for patience any mobile's part and problem repair...",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  buildCard(
                    title: "Specialisations",
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xffFFF5E1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "Mobile Phone Repair",
                        style: TextStyle(color: Themeorangecolor),
                      ),
                    ),
                  ),
                  buildCard(
                    title: "Working Hours",
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.access_time, color: Themeorangecolor),
                            SizedBox(width: 10),
                            Text("07:00 - 21:00"),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 8,
                          children: [
                            dayChip("Monday"),
                            dayChip("Tuesday"),
                            dayChip("Wednesday"),
                            dayChip("Thursday"),
                            dayChip("Friday"),
                            dayChip("Saturday"),
                            dayChip("Sunday"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  buildCard(
                    title: "Contact Information",
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Phone: 05876698544"),
                        Text("Email: adilshah4317@gmail.com"),
                        Text("WhatsApp: 05876698544"),
                      ],
                    ),
                  ),
                  buildCard(
                    title: "Location",
                    child: const Text("Hyderabad, Pakistan\nZip: 00718"),
                  ),
                  buildCard(
                    title: "Emergency Contact",
                    child: const Text("05876698544"),
                  ),
                  buildCard(
                    title: "Services",
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text("Pickup Service  - Available"),
                    ),
                  ),
                  buildCard(
                    title: "Additional Shop Photos",
                    child: Image.asset(
                      "assets/mobile.png",
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  buildCard(
                    title: "Certifications",
                    child: Image.asset(
                      "assets/pending.png",
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  buildCard(
                    title: "Account Info",
                    child: const Text(
                      "Member Since: 11/26/2025\nLast Updated: 11/26/2025",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }

  Widget dayChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade50,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text),
    );
  }
}
