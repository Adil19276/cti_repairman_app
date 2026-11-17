import 'package:cti_repairman_app/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JobsRequest extends StatefulWidget {
  const JobsRequest({super.key});

  @override
  State<JobsRequest> createState() => _JobsRequestState();
}

class _JobsRequestState extends State<JobsRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
       
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Jobs Request",
          style: GoogleFonts.lato(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nearby Service Requests",
                          style: GoogleFonts.lato(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "Customers near you need repair assistance",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            overflow: TextOverflow.ellipsis,
                          ),
                          softWrap: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),Padding(
                padding: const EdgeInsets.only(left:10.0,right: 10,bottom: 12),
                child: Divider(),
              ),
              buildJobReq(
                "iPhone Screen Replacement",
                "Cracked iPhone 12 screen, needs urgent replacement",
                "DHA Phase 5, Lahore",
                "2 hours ago",
                "8000 - 12000 TL",
              ),
              buildJobReq(
                "Samsung Battery Replacement",
                "Samsung Galaxy S20 battery drains quickly",
                "Gulberg III, Lahore",
                "4 hours ago",
                "4000 - 6000 TL",
              ),
              buildJobReq(
                "iPhone Screen Replacement",
                "Cracked iPhone 12 screen, needs urgent replacement",
                "DHA Phase 5, Lahore",
                "2 hours ago",
                "8000 - 12000 TL",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildJobReq(
    String text,
    String subtext,
    String location,
    String hour,
    String price,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 1),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Themeorangecolor.withOpacity(0.2),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade300),
                ),
                padding: const EdgeInsets.all(10),
                child: Icon(
                  CupertinoIcons.device_phone_portrait,
                  color: Themeorangecolor,
                  size: 28,
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                      softWrap: true,
                    ),
                    
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  subtext,
                  style: GoogleFonts.lato(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Colors.grey,
                      size: 18,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        location,
                        style: GoogleFonts.lato(
                          fontSize: 13,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      hour,
                      style: GoogleFonts.lato(fontSize: 12, color: Colors.blue),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Themeorangecolor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            "View Details",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Themeorangecolor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            "Accept Job",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
