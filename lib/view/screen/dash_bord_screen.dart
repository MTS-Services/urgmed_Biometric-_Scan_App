import 'package:chain_verify_tm/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/custom_app_bar.dart';
import '../widget/order_card_widget.dart';
import '../widget/status_card_widget.dart';

class DashBordScreen extends StatelessWidget {
  const DashBordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.themColor,
      appBar: customAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StatusCard(
                  icon: Icons.access_alarms,
                  count: "12",
                  label: "Pending",
                  iconColor: Colors.orange,
                  backgroundColor: AppColors.pColor,
                ),
                StatusCard(
                  icon: Icons.baby_changing_station_rounded,
                  count: "12",
                  label: "Active",
                  iconColor: Colors.blue,
                  backgroundColor: AppColors.aColor,
                ),
                StatusCard(
                  icon: Icons.check_circle_outline_outlined,
                  count: "12",
                  label: "Complete",
                  iconColor: Colors.green,
                  backgroundColor: AppColors.cColor,
                ),
              ],
            ),

            const SizedBox(height: 20),

            const Text(
              "Active Deliveries",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 10),

            // ListView.builder inside scrollable column
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return OrderCard(
                  orderId: "12345",
                  status: "Awaiting Pick Up",
                  statusColor: AppColors.mainColor,
                  customerName: "Cameron Williamson",
                  address: "3891 Ranch view Dr. Richardson, California",
                  createdDate: "18/8/2025",
                  onVerifyPressed: () {
                    buildShowDialog(context);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // AlertDialog with fingerprint icon
  Future<dynamic> buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          contentPadding: const EdgeInsets.all(20),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundColor: Color(0xFFE3F2FD),
                child: Icon(Icons.fingerprint, size: 50, color: Colors.blue),
              ),
              const SizedBox(height: 20),
              const Text(
                "Fingerprint Scan",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              const Text("Place your finger on the scanner"),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mainColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text("Cancel"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
