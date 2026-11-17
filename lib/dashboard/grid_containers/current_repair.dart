import 'package:cti_repairman_app/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CurrentRepair extends StatefulWidget {
  const CurrentRepair({super.key});

  @override
  State<CurrentRepair> createState() => _CurrentRepairState();
}

class _CurrentRepairState extends State<CurrentRepair> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Current Repair",
          style: GoogleFonts.lato(fontSize: 22, color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: SafeArea(
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
                          "Active Repair Jobs",
                          style: GoogleFonts.lato(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "Stay updated on the devices you're currently\nrepairing",
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
              ),
              Padding(
                padding: const EdgeInsets.only(left:10.0,right: 10,bottom: 12),
                child: Divider(),
              ),
            buildCurrentrepair(
              "Huawei Screen and Battery Replacement",
              "Client: Sarah Wilson",
              "Started: Aug 20, 2025",
              "Est. Aug 25, 2025",
              "12000 TL",
            ),
            buildCurrentrepair(
              "Oppo Water Damage Repair",
              "Client: Dummy Khan",
              "Started: Aug 22, 2025",
              "Est. Aug 28, 2025",
              "7000 TL",
            ),
            buildCurrentrepair(
              "Huawei Screen and Battery Replacement",
              "Client: Sarah Wilson",
              "Started: Aug 20, 2025",
              "Est. Aug 25, 2025",
              "12000 TL",
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCurrentrepair(
    String text,
    String client,
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
            color: Colors.black26,
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
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  client,
                  style: GoogleFonts.lato(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        location,
                        style: GoogleFonts.lato(
                          fontSize: 13,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  hour,
                  style: GoogleFonts.lato(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
