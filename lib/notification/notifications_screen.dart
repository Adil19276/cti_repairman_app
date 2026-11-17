import 'package:cti_repairman_app/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Notifications (2)"),
        actions: [
          Row(
            children: [
              Text(
                "Mark all read",
                style: TextStyle(
                  color: Themeorangecolor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Clear all",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            dummynotifications(
              "New Job Available !",
              "6 days ago",
              "SAMSUNG samsung a73 - Budget 2000-4000 TL Hydrabad",
            ),
            dummynotifications(
              "New Job Available !",
              "6 days ago",
              "SAMSUNG samsung a73 - Budget 2000-4000 TL Hydrabad",
            ),
            dummynotifications(
              "New Job Available !",
              "6 days ago",
              "SAMSUNG samsung a73 - Budget 2000-4000 TL Hydrabad",
            ),
            dummynotifications(
              "New Job Available !",
              "6 days ago",
              "SAMSUNG samsung a73 - Budget 2000-4000 TL Hydrabad",
            ),
            dummynotifications(
              "New Job Available !",
              "6 days ago",
              "SAMSUNG samsung a73 - Budget 2000-4000 TL Hydrabad",
            ),
          ],
        ),
      ),
    );
  }

  Widget dummynotifications(String text, String days, String requirment) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: Container(
        padding: EdgeInsets.all(12),
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 1),
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("🛠", style: TextStyle(fontSize: 16)),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(days, style: TextStyle(color: Colors.grey)),
              ],
            ),
            SizedBox(height: 6),
            Text(requirment, style: TextStyle(color: Colors.black87)),
          ],
        ),
      ),
    );
  }
}
