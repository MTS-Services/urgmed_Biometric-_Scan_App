import 'package:chain_verify_tm/utils/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/custom_app_bar.dart';
import '../widget/location_card_widget.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(),
      body: Stack(
        children: [
          // Scrollable upper content
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Image.asset(AssetPath.mapImage),
                SizedBox(height: 15.h),
                Text(
                  "Location Information",
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 370.h), // Adjusted to prevent overlap with bottom sheet
              ],
            ),
          ),

          // Bottom sheet style container
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 350.h,
            child: Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 10.r,
                    spreadRadius: 2.r,
                    offset: const Offset(0, -3),
                  )
                ],
              ),
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: LocationInfoCard(
                          coordinates: "23.8103,90.4125",
                          title: "Dhaka Location",
                          icon: Icons.location_on_outlined,
                          iconColor: Colors.blue,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: LocationInfoCard(
                          icon: Icons.check_circle_outline_outlined,
                          coordinates: "23.8103,90.4125",
                          title: "Dhaka Location",
                          iconColor: Colors.green,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: LocationInfoCard(
                          coordinates: "23.8103,90.4125",
                          title: "Dhaka Location",
                          icon: Icons.speed,
                          iconColor: Colors.orange,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: LocationInfoCard(
                          coordinates: "23.8103,90.4125",
                          title: "Dhaka Location",
                          icon: Icons.alarm_rounded,
                          iconColor: Colors.grey,
                        ),
                      )
                    ],
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
