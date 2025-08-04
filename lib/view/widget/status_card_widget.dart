import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatusCard extends StatelessWidget {
  final IconData icon;
  final String count;
  final String label;
  final Color iconColor;
  final Color backgroundColor;

  const StatusCard({
    super.key,
    required this.icon,
    required this.count,
    required this.label,
    this.iconColor = Colors.orange,
    this.backgroundColor = const Color(0xFFE3F2FD), // light blue default
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.1,
      shadowColor: Colors.white70,
      child: Container(
        height: 100.h,
        width: 100.w,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 28.sp),
            SizedBox(height: 4.h),
            Text(
              count,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24.sp,
              ),
            ),
            Text(
              label,
              style: TextStyle(fontSize: 12.sp),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
