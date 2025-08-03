import 'package:flutter/material.dart';

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
    required  this.iconColor,
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
            blurRadius: 12,
            spreadRadius: 12,
            offset: Offset(2, 2),
          )
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: 10),
          Card(
            elevation: 0.1,
            child: Container(

              padding: EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                color: AppColors.lColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Icon(icon, color: iconColor),
                  Text(title!, style: TextStyle(fontSize: 16)),
                  Text(coordinates, style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
