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
    return  Padding(
      padding: const EdgeInsets.all(3),
      child: Card(
        color: AppColors.lColor,
        elevation: 0.1,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              Icon(icon, color: iconColor, size: 28.sp),
              SizedBox(height: 10.h),
              Text(
                title!,
                style: TextStyle(fontSize: 15.sp),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5.h),
              Text(
                coordinates,
                style: TextStyle(fontSize: 13.sp, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
