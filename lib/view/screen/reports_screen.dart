import 'package:chain_verify_tm/utils/app_colors.dart';
import 'package:chain_verify_tm/view/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../widget/package_card.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Text(
              "Delivery Reports",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                return PackageCard(
                  packageId: "PKG -  2024 - 001",
                  name: "John Smith",
                  date: "08/01/2025",
                  onGeneratePdfPressed: () {
                    // Generate PDF button pressed callback
                  },
                );

              },),
            )
          ],
        ),
      ),
    );
  }
}
