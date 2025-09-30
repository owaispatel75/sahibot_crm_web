import 'package:flutter/material.dart';

class LogoutSubsidebar extends StatelessWidget {
  const LogoutSubsidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Bilal", style: TextStyle(fontSize: 14)),
            const Text(
              "Manager",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(width: 8),
        const CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text("BS", style: TextStyle(color: Colors.white)),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
