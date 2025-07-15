import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      height: 64,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      //color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/logo.png', // Replace with your logo
            height: 30,
          ),
          const SizedBox(width: 24),
          const SizedBox(
            width: 400,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search (CTRL/CMD+K)',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide.none,
                ),
                fillColor: Color(0xFFF1F3F4),
                filled: true,
                isDense: true,
              ),
            ),
          ),
          const SizedBox(width: 24),
          Row(
            children: [
              const Icon(Icons.notifications, color: Colors.grey),
              const SizedBox(width: 16),
              const CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("BS", style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(width: 8),
              const Text("Bilal\nManager", style: TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
