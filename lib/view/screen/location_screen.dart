import 'package:chain_verify_tm/utils/asset_path.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Image.asset(AssetPath.mapImage),
                SizedBox(height: 15),
                Text(
                  "Location Information",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // Fixed bottom sheet like container
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 400, // fixed height as you used before
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(0, -3),
                  )
                ],
              ),
              child: Column(
                children: [
                  SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LocationInfoCard(
                        coordinates: "23.8103,90.4125",
                        title: "Dhaka Location",
                        icon: Icons.location_on_outlined,
                        iconColor: Colors.blue,
                      ),
                      LocationInfoCard(
                        icon: Icons.check_circle_outline_outlined,
                        coordinates: "23.8103,90.4125",
                        title: "Dhaka Location",
                        iconColor: Colors.green,
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LocationInfoCard(
                        coordinates: "23.8103,90.4125",
                        title: "Dhaka Location",
                        icon: Icons.speed,
                        iconColor: Colors.orange,
                      ),
                      LocationInfoCard(
                        coordinates: "23.8103,90.4125",
                        title: "Dhaka Location",
                        icon: Icons.alarm_rounded,
                        iconColor: Colors.grey,
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
