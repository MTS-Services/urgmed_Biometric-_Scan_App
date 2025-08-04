import 'package:chain_verify_tm/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/searvice.dart';
import '../widget/custom_app_bar.dart';
import '../widget/order_card_widget.dart';
import '../widget/status_card_widget.dart';

class DashBordScreen extends StatelessWidget {
  DashBordScreen({super.key});

  final AuthController controller = Get.put(AuthController());

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

            Obx(() {
              bool isAuth = controller.isAuthenticated.value;
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return OrderCard(
                    orderId: "12345",
                    status: isAuth?"Awaiting Pick Up":"pick up",
                    statusColor: isAuth
                        ? AppColors.bColor2.withOpacity(0.5)
                        : AppColors.mainColor.withOpacity(0.7),
                    bgColor: isAuth
                        ? AppColors.bColor2
                        : AppColors.mainColor,
                    customerName: "Cameron Williamson",
                    address: "3891 Ranch view Dr. Richardson, California",
                    createdDate: "18/8/2025",
                    onVerifyPressed: () {
                      buildShowDialog(context);
                    },
                  );
                },
              );
            }),


          ],
        ),
      ),
    );
  }

  Future<void> buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        bool isLoading = false;
        bool? authSuccess;
        return StatefulBuilder(
          builder: (context, setState) {
            Color fingerprintBg;
            IconData iconData = Icons.fingerprint;
            String titleText = "Fingerprint Scan";
            String subText = "Place your finger on the scanner";

            if (isLoading) {
              fingerprintBg = const Color(0xFFE3F2FD);
            } else if (authSuccess == true) {
              fingerprintBg = Colors.green.shade100;
              iconData = Icons.check_circle_outline;
              titleText = "Verified";
              subText = "Fingerprint verified successfully!";
            } else if (authSuccess == false) {
              fingerprintBg = Colors.red.shade100;
              iconData = Icons.error_outline;
              titleText = "Failed";
              subText = "Authentication failed. Try again.";
            } else {
              fingerprintBg = const Color(0xFFE3F2FD);
            }

            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              contentPadding: const EdgeInsets.all(20),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: isLoading
                        ? null
                        : () async {
                      setState(() {
                        isLoading = true;
                        authSuccess = null;
                      });

                      bool check = await controller.authenticateUser();

                      setState(() {
                        isLoading = false;
                        authSuccess = check;
                      });

                      if (check) {
                        Get.snackbar(
                          "Success",
                          "Fingerprint verified successfully!",
                          backgroundColor: Colors.green,
                          colorText: Colors.white,
                        );
                      } else {
                        Get.snackbar(
                          "Failed",
                          "Authentication failed!",
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      }
                    },
                    iconSize: 80,
                    icon: CircleAvatar(
                      radius: 40,
                      backgroundColor: fingerprintBg,
                      child: isLoading
                          ? const CircularProgressIndicator()
                          : Icon(
                        iconData,
                        size: 50,
                        color: (authSuccess == true)
                            ? Colors.green
                            : (authSuccess == false)
                            ? Colors.red
                            : Colors.blue,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  Text(
                    titleText,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(subText),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade700,
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
      },
    );
  }
}
