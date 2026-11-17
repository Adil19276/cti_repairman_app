import 'package:cti_repairman_app/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JobsBrandScreen extends StatefulWidget {
  const JobsBrandScreen({super.key});

  @override
  State<JobsBrandScreen> createState() => _JobsBrandScreenState();
}

class _JobsBrandScreenState extends State<JobsBrandScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  String priorityValue = "Priorities";
  String distanceValue = "10 km";

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Jobs Board",
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
                        "My Jobs",
                        style: GoogleFonts.lato(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Manage your repair jobs and track progress\nwith ease",
                        style: TextStyle(color: Colors.grey.shade600,overflow: TextOverflow.ellipsis),softWrap: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              prefixIcon: Icon(Icons.search),
                              hintText:
                                  "Search jobs by title, client, or description...",
                              hintStyle: TextStyle(
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.w400,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Themeorangecolor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Icon(Icons.sync, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      filterBox(priorityValue, ["High", "Medium", "Low"], (
                        value,
                      ) {
                        setState(() {
                          priorityValue = value;
                        });
                      }),
                      SizedBox(width: 10),
                      filterBox(
                        distanceValue,
                        ["10 km", "20 km", "30 km", "50 km", "100 km"],
                        (value) {
                          setState(() {
                            distanceValue = value;
                          });
                        },
                      ),
                      SizedBox(width: 10),
                      clearFilterButton(),
                      SizedBox(width: 10),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Column(
                      children: [
                        TabBar(
                          controller: tabController,
                          labelColor: Colors.orange,
                          unselectedLabelColor: Colors.black,
                          indicatorColor: Colors.orange,
                          tabs: [
                            Tab(text: "Open Jobs"),
                            Tab(text: "Completed Jobs"),
                          ],
                        ),
                        Container(
                          height: 350,
                          child: TabBarView(
                            controller: tabController,
                            children: [openJobsUI(), completedJobsUI()],
                          ),
                        ),
                      ],
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

  Widget filterBox(
    String text,
    List<String> options,
    Function(String) onSelect,
  ) {
    return Expanded(
      child: PopupMenuButton<String>(
        onSelected: (value) {
          onSelect(value);
        },
        itemBuilder: (context) {
          return options.map((e) {
            return PopupMenuItem(value: e, child: Text(e));
          }).toList();
        },

        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text),
              // SizedBox(width: 5),
              Icon(Icons.keyboard_arrow_down_rounded),
            ],
          ),
        ),
      ),
    );
  }

  Widget clearFilterButton() {
    return Expanded(
      child: Container(
        height: 48,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Center(child: Text("Clear Filters")),
      ),
    );
  }

  Widget openJobsUI() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade200,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(
                CupertinoIcons.briefcase,
                size: 30,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "No open jobs",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            "No open jobs available at the moment.",
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Themeorangecolor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {},
            child: Text("Refresh Jobs", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget completedJobsUI() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade200,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(
                CupertinoIcons.checkmark_alt_circle,
                size: 30,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "No Completed jobs",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            "You haven't completed any jobs yet.",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
