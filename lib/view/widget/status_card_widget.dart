import 'package:flutter/material.dart';

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
        height: 100,
        width: 111,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor),
            const SizedBox(height: 4),
            Text(
              count,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}
