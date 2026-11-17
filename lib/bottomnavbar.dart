import 'package:cti_repairman_app/dashboard/dashboard.dart';
import 'package:cti_repairman_app/earning&disputes/earn_review.dart';
import 'package:cti_repairman_app/jobs_bottombar/jobs_brand_screen.dart';
import 'package:cti_repairman_app/profile/profile_screen.dart';
import 'package:cti_repairman_app/wallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pandabar/main.view.dart';
import 'package:pandabar/model.dart';

class Bottomnavbar extends StatefulWidget {
  const Bottomnavbar({super.key});

  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  String page = 'Dashboard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: PandaBar(
        backgroundColor: Colors.white,
        buttonColor: Colors.black38,
        buttonSelectedColor: Colors.orange,
        fabColors: [Colors.orange, Color(0xFFF9B563)],
        fabIcon: Icon(Icons.wallet_outlined, color: Colors.white),

        buttonData: [
          PandaBarButtonData(
            id: 'Dashboard',
            icon: Icons.dashboard_outlined,
            title: 'Dashboard',
          ),
          PandaBarButtonData(
            id: 'Job Brand',
            icon: CupertinoIcons.briefcase,
            title: 'Job Board',
          ),
          PandaBarButtonData(
            id: 'Earning & Reviews',
            icon: Icons.star_border_rounded,
            title: 'Performance',
          ),
          PandaBarButtonData(
            id: 'Profile',
            icon: CupertinoIcons.person,
            title: 'Profile',
          ),
        ],

        onChange: (id) {
          setState(() {
            page = id;
          });
        },
        onFabButtonPressed: () {
          setState(() {
            page = 'Wallet';
          });
        },
      ),
      body: Builder(
        builder: (context) {
          switch (page) {
            case 'Dashboard':
              return Dashboard();
            case 'Job Brand':
              return JobsBrandScreen();
            case 'Earning & Reviews':
              return EarnReview();
            case 'Profile':
              return ProfileScreen();
            case 'Wallet':
              return Wallet();
            default:
              return Container();
          }
        },
      ),
    );
  }
}
