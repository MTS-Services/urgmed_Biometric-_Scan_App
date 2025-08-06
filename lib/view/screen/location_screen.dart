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
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: customAppBar()),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Image.asset(AssetPath.mapImage),
                  SizedBox(height: 15.h),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Location Information",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 30,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    topRight: Radius.circular(15.r),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 2,
                      offset: Offset(0, -2), // উপরের দিকে shadow ফেলবে
                      spreadRadius: .2,
                    ),
                  ],
                ),
              ),

            ),
            SliverGrid.builder (
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return LocationInfoCard(
                  icon: Icons.location_on_outlined,
                  iconColor: Colors.blue,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
