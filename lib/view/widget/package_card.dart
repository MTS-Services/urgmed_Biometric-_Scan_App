import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_colors.dart';

class PackageCard extends StatelessWidget {
  final String packageId;
  final String name;
  final String date;
  final VoidCallback onGeneratePdfPressed;

  const PackageCard({
    super.key,
    required this.packageId,
    required this.name,
    required this.date,
    required this.onGeneratePdfPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.1,
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Package ID Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  packageId,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            /// Name
            Text(
              name,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 10.h),

            /// Date Row
            Row(
              children: [
                Icon(
                  Icons.calendar_month_outlined,
                  color: Colors.grey,
                  size: 20.sp,
                ),
                SizedBox(width: 10.w),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),

            SizedBox(height: 10.h),

            /// PDF Button
            SizedBox(
              width: double.infinity,
              height: 45.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.mainColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                onPressed: onGeneratePdfPressed,
                child: Text(
                  "Generate PDF",
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
