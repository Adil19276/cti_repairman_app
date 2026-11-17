import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EarnReview extends StatefulWidget {
  const EarnReview({super.key});

  @override
  State<EarnReview> createState() => _EarnReviewState();
}

class _EarnReviewState extends State<EarnReview>
    with SingleTickerProviderStateMixin {
  List<Map> monthlyEarnings = [
    {"month": "Jan 2024", "percent": 80.0, "amount": "\$65,000", "jobs": 18},
    {"month": "Feb 2024", "percent": 75.0, "amount": "\$72,000", "jobs": 22},
    {"month": "Mar 2024", "percent": 70.0, "amount": "\$68,000", "jobs": 20},
    {"month": "Apr 2024", "percent": 85.0, "amount": "\$78,000", "jobs": 24},
    {"month": "May 2024", "percent": 90.0, "amount": "\$82,000", "jobs": 26},
    {"month": "Jun 2024", "percent": 65.0, "amount": "\$69,000", "jobs": 21},
    {"month": "Jul 2024", "percent": 74.0, "amount": "\$74,000", "jobs": 23},
    {"month": "Aug 2024", "percent": 100.0, "amount": "\$85,000", "jobs": 27},
  ];

  List<Map> transactions = [
    {
      "title": "iPhone 14 Pro Screen Replacement",
      "client": "Sarah Ahmed",
      "method": "Bank Transfer",
      "id": "JOB001",
      "amount": "\$12,000",
      "date": "8/24/2024",
      "status": "completed",
    },
    {
      "title": "Samsung Galaxy S23 Water Damage",
      "client": "Ahmed Khan",
      "method": "Cash",
      "id": "JOB002",
      "amount": "\$8,500",
      "date": "8/23/2024",
      "status": "pending",
    },
    {
      "title": "Multiple iPhone Repairs",
      "client": "TechMart Electronics",
      "method": "Bank Transfer",
      "id": "JOB003",
      "amount": "\$25,000",
      "date": "8/22/2024",
      "status": "completed",
    },
  ];

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Earnings & Reviews",
          style: GoogleFonts.lato(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),

      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:12.0,bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Track your financial performance and\nclient feedback",
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(12),
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
                    tabs: const [Tab(text: "Earnings"), Tab(text: "Reviews")],
                  ),

                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: [earningPage(), reviewsCard()],
                    ),
                  ),
                  SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget earningPage() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              summaryCard(
                "\$485,000",
                "Total Earnings",
                Icons.wallet,
                Colors.green,
              ),
              SizedBox(width: 10),
              summaryCard(
                "\$85,000",
                "This Month",
                Icons.calendar_month,
                Colors.teal,
              ),
              SizedBox(width: 10),
              summaryCard(
                "\$25,000",
                "Pending",
                Icons.access_time,
                Colors.purple,
              ),
              SizedBox(width: 10),
              summaryCard(
                "\$3,299",
                "Avg per Job",
                Icons.bar_chart,
                Colors.orange,
              ),
            ],
          ),
        ),

        SizedBox(height: 25),

        Text(
          "Monthly Earnings",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),

        ...monthlyEarnings.map((e) => monthlyEarningTile(e)).toList(),

        SizedBox(height: 25),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Recent Transactions",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            filterButton("Transactions"),
          ],
        ),

        SizedBox(height: 15),

        ...transactions.map((t) => transactionTile(t)).toList(),
      ],
    );
  }

  Widget reviewsCard() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                // border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rating Distribution",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),

                  ...[5, 4, 3, 2, 1].map((stars) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Row(
                        children: [
                          Text("$stars ⭐", style: TextStyle(fontSize: 16)),
                          SizedBox(width: 15),
                          Expanded(
                            child: Container(
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Text("0", style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),

            SizedBox(height: 25),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Client Reviews",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Row(
                          children: [
                            Text("All Reviews"),
                            SizedBox(width: 4),
                            Icon(Icons.keyboard_arrow_down_rounded),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 50),
                  Center(
                    child: Column(
                      children: [
                        Icon(
                          CupertinoIcons.chat_bubble,
                          size: 70,
                          color: Colors.grey.shade300,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "No reviews yet",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget summaryCard(String amount, String label, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0),
      child: Container(
        width: 160,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 2),
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ],
          color: Colors.white,
          // border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: color.withOpacity(0.1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(icon, color: color),
              ),
            ),
            SizedBox(height: 10),
            Text(
              amount,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(label, style: TextStyle(color: Colors.grey.shade600)),
          ],
        ),
      ),
    );
  }

  Widget monthlyEarningTile(Map e) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(width: 70, child: Text(e["month"])),
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Container(
                  height: 8,
                  width: e["percent"] * 2.2,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          SizedBox(
            width: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  e["amount"],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "${e["jobs"]} jobs",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget filterButton(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Text(text),
          SizedBox(width: 5),
          Icon(Icons.keyboard_arrow_down_rounded),
        ],
      ),
    );
  }

  Widget transactionTile(Map t) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.smartphone, color: Colors.orange, size: 30),
          SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(t["title"], style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  "Client: ${t["client"]}",
                  style: TextStyle(color: Colors.grey.shade700),
                ),
                Text(
                  "${t["method"]} • Job ID: ${t["id"]}",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(t["amount"], style: TextStyle(fontWeight: FontWeight.bold)),
              Text(t["date"], style: TextStyle(color: Colors.grey.shade700)),
              Text(
                t["status"],
                style: TextStyle(
                  color:
                      t["status"] == "completed" ? Colors.green : Colors.orange,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
