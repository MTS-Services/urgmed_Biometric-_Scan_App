import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final String orderId;
  final String status;
  final Color statusColor;
  final Color bgColor;
  final String customerName;
  final String address;
  final String createdDate;
  final VoidCallback onVerifyPressed;

  const OrderCard({
    super.key,
    required this.orderId,
    required this.status,
    required this.statusColor,
    required this.customerName,
    required this.address,
    required this.createdDate,
    required this.onVerifyPressed, required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.1,
      shadowColor: Colors.white70,
      color: Colors.white,
      child: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order #$orderId",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Chip(
                  backgroundColor: statusColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: statusColor),
                  ),
                  label: Text(
                    status,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),

            ListTile(
              leading: const Icon(Icons.person_outline, size: 30),
              title: Text(
                customerName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.location_on_outlined, size: 30),
              title: Text(
                address,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            /// Created Date
            ListTile(
              leading: const Icon(Icons.alarm_rounded, size: 30),
              title: Text(
                "Created: $createdDate",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: bgColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: onVerifyPressed,
                child: const Text("Verify Pickup"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
