import 'package:flutter/material.dart';
import '../widgets/sales_team_table.dart';

class TeamsTabBar extends StatefulWidget {
  const TeamsTabBar({super.key});

  @override
  State<TeamsTabBar> createState() => _TeamsTabBarState();
}

class _TeamsTabBarState extends State<TeamsTabBar> {
  int selectedIndex = 0;

  final List<String> tabs = ['Sales Team', 'User Roles', 'All Members'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            children: List.generate(tabs.length, (index) {
              final isSelected = selectedIndex == index;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: () => setState(() => selectedIndex = index),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.green : Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      tabs[index],
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        const Divider(height: 1),
        if (selectedIndex == 0) const SalesTeamTable(),
        // TODO: Add UserRolesTable() and AllMembersTable() widgets similarly
      ],
    );
  }
}