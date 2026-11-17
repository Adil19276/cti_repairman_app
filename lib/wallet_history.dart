import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletHistory extends StatefulWidget {
  const WalletHistory({super.key});

  @override
  State<WalletHistory> createState() => _WalletHistoryState();
}

class _WalletHistoryState extends State<WalletHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Wallet Balance History",
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildpaymentmethod(
              Colors.green,
              'Payment for iPhone 11 Screen Repair',
              'Aug 23, 2025',
              '+9,000 TL',
              Icons.south,
            ),
            buildpaymentmethod(
              Colors.green,
              'Samsung Battery Replacement Payment',
              'Aug 22, 2025',
              '+5,000 TL',
              Icons.south,
            ),
            buildpaymentmethod(
              Colors.red,
              'Purchase of Screen Repair Tools',
              'Aug 21, 2025',
              '-3,000 TL',
              Icons.north,
            ),
            buildpaymentmethod(
              Colors.green,
              'Xiaomi Software Fix Payment',
              'Aug 20, 2025',
              '+3,500 TL',
              Icons.south,
            ),
            buildpaymentmethod(
              Colors.red,
              'Xiaomi Software Fix Payment ',
              'Aug 19, 2025',
              '-2,500 TL',
              Icons.north,
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "Total Balance",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Icon(Icons.currency_lira),
                Text(
                  '32,000',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildpaymentmethod(
  Color color,
  String title,
  String date,
  String price,
  IconData icon,
) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(icon, color: color, size: 18),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(height: 4),
                  Text(
                    date,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  ),
                ],
              ),
            ),
            Text(
              price,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17,
                color: color,
              ),
            ),
          ],
        ),
      ),
      Divider(color: Colors.grey.shade300),
    ],
  );
}

}
