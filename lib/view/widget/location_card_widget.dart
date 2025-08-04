import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_colors.dart';

class LocationInfoCard extends StatelessWidget {
  final String coordinates;
  final IconData icon;
  final Color iconColor;
  final String? title;

  const LocationInfoCard({
    super.key,
    this.coordinates = "23.8222,90.4220",
    required this.icon,
    required this.iconColor,
    this.title = "Coordinates",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.white70,
            blurRadius: 12.r,
            spreadRadius: 12.r,
            offset: Offset(2, 2),
          )
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: 5.h),
          Card(
            elevation: 0.1,
            child: Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: AppColors.lColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                children: [
                  Icon(icon, color: iconColor, size: 28.sp),
                  SizedBox(height: 10.h),
                  Text(
                    title!,
                    style: TextStyle(fontSize: 16.sp),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    coordinates,
                    style: TextStyle(fontSize: 14.sp, color: Colors.black87),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
