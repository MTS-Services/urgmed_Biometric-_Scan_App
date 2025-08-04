import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    required this.onVerifyPressed,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.1,
      shadowColor: Colors.white70,
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.all(15.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order #$orderId",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
                Chip(
                  backgroundColor: statusColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    side: BorderSide(color: statusColor),
                  ),
                  label: Text(
                    status,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 5.h),

            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.person_outline, size: 30.sp),
              title: Text(
                customerName,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.location_on_outlined, size: 30.sp),
              title: Text(
                address,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.alarm_rounded, size: 30.sp),
              title: Text(
                "Created: $createdDate",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            SizedBox(height: 10.h),

            SizedBox(
              width: double.infinity,
              height: 45.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: bgColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                onPressed: onVerifyPressed,
                child: Text(
                  "Verify Pickup",
                  style: TextStyle(fontSize: 14.sp),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
