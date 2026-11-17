import 'dart:io';
import 'package:cti_repairman_app/colors.dart';
import 'package:cti_repairman_app/repairman_info/pending_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class DocsUpload extends StatefulWidget {
  const DocsUpload({super.key});

  @override
  State<DocsUpload> createState() => _DocsUploadState();
}

class _DocsUploadState extends State<DocsUpload> {
  final ImagePicker _picker = ImagePicker();

  // 5 image files for 5 upload fields
  File? profileImage;
  File? cnicImage;
  File? shopPhoto;
  File? shopProof;
  File? certificate;

  bool get allFilled =>
      profileImage != null &&
      cnicImage != null &&
      shopPhoto != null &&
      shopProof != null &&
      certificate != null;

  Future<void> _pickImageFromGallery(Function(File) onPicked) async {
    try {
      final XFile? picked = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
        maxWidth: 1200,
        maxHeight: 1200,
      );
      if (picked != null) {
        setState(() {
          onPicked(File(picked.path));
        });
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
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
          Text("Step 5-5", style: TextStyle(fontSize: 18)),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: GestureDetector(
              onTap:
                  allFilled
                      ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PendingPage(),
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
                    "Completed",
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
            buildLine(Themeorangecolor),
            buildDiamondShape('5', Themeorangecolor),
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
                      "Downloads Uploads",
                      style: GoogleFonts.lato(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Text(
                      "Upload your clear images (JPG, PNG, PDF, max 5mb)",
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                  ],
                ),
              ),
              builduploadfiles(
                'Profile Image',
                profileImage,
                (f) => profileImage = f,
              ),
              builduploadfiles('CNIC Scan', cnicImage, (f) => cnicImage = f),
              builduploadfiles('Shop Photo', shopPhoto, (f) => shopPhoto = f),
              builduploadfiles(
                'Shop Proof Document',
                shopProof,
                (f) => shopProof = f,
              ),
              builduploadfiles(
                'Certifications',
                certificate,
                (f) => certificate = f,
              ),
              const SizedBox(height: 20),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Themeorangecolor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "📄 Document Upload Guidelines",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "• All documents must be clear and readable\n• Maximum file size: 5MB per document\n• Accepted formats: JPG, PNG, PDF\n• CNIC should include both front and back (can be combined in one image)\n• Shop photo should clearly show your business premises\n• Shop proof can be utility bill, rental agreement, or ownership document",
                            style: TextStyle(color: Themeorangecolor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Themeorangecolor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "⚠️ Important Notice",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "Your documents will be uploaded to secure cloud storage and reviewed by our team. This process may take a few moments. Please don’t refresh or close this page during upload.",
                            style: TextStyle(color: Themeorangecolor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
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

  Widget builduploadfiles(String text, File? file, Function(File) onPicked) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 5),
          GestureDetector(
            onTap: () => _pickImageFromGallery(onPicked),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey),
                image:
                    file != null
                        ? DecorationImage(
                          image: FileImage(file),
                          fit: BoxFit.cover,
                        )
                        : null,
              ),
              child:
                  file == null
                      ? const Row(
                        children: [
                          SizedBox(width: 8),
                          Text(
                            'Tap here to choose file',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        ],
                      )
                      : null,
            ),
          ),
        ],
      ),
    );
  }
}
