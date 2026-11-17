import 'package:cti_repairman_app/colors.dart';
import 'package:cti_repairman_app/jobs_bottombar/jobs_brand_screen.dart';
import 'package:cti_repairman_app/profile/catalogue/service_catalogue.dart';
import 'package:cti_repairman_app/profile/profile_setting.dart';
import 'package:cti_repairman_app/wallet_history.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              showDialog(
                barrierColor: Colors.black87,
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  contentPadding: EdgeInsets.zero,
                  content: Container(
                    color: Colors.white,
                    child: SizedBox(
                      width: double.minPositive,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            "assets/logout.gif",
                            height: 100,
                          ),
                          SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Are you sure you want to\nlogout?",
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 40,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  //authService.signOut(context);
                                },
                                child: Container(
                                  height: 40,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Ok",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Icon(
                    CupertinoIcons.power,size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
        title: Text(
          'My Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => update_profile(),
                //   ),
                // );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: MediaQuery.sizeOf(context).height * 0.06,
                  backgroundImage: AssetImage('assets/a_man_repairer.png')
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Mr Barrel",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: Text("mrbean317@gmail.com"),
                ),
              ],
            ),
            SizedBox(height: 16),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    // border: Border.all(color: Themeoffwhitecolor),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        buildMenuItem(Icons.manage_accounts_outlined, "Profile Setting",
                            () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileSetting(),
                            ),
                          );
                        }),
                        buildMenuItem(Icons.construction,
                            "Service Catalogue", () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ServiceCatalogue(),
                            ),
                          );
                        }),
                        buildMenuItem(Icons.gavel, "Disputes",
                            () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>JobsBrandScreen(),
                            ),
                          );
                        }),
                        buildMenuItem(Icons.savings_outlined, "Earnings", () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WalletHistory(),
                            ),
                          );
                        }),
                        buildMenuItem(CupertinoIcons.question_diamond, "Help & Supoort",
                            () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Container(),
                            ),
                          );
                        }),
                        
                      ],
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(14),
        ),
        child: ListTile(
          leading: Container(
            decoration: BoxDecoration(
              color: Themeorangecolor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(8),
            child: Icon(icon, color: Themeorangecolor),
          ),
          title: Text(title,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
          trailing: Icon(Icons.arrow_forward_ios_rounded, size: 18),
          // onTap: () {},
        ),
      ),
    );
  }
}