// import 'package:flutter/material.dart';

// class Sidebar extends StatelessWidget {
//   const Sidebar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 80,
//       height: double.infinity,
//       color: const Color(0xFF00C853), // Green
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           const SizedBox(height: 16),
//           Image.asset(
//             'assets/logo.png', // Replace with your logo
//             height: 30,
//           ),
//           const SizedBox(height: 32),
//           sidebarIcon(Icons.leaderboard, "Leads"),
//           sidebarIcon(Icons.link, "Links"),
//           sidebarIcon(Icons.group, "Team"),
//           sidebarIcon(Icons.settings, "Settings"),
//           sidebarIcon(Icons.support, "Support"),
//           sidebarIcon(Icons.receipt_long, "Billing"),
//         ],
//       ),
//     );
//   }

//   Widget sidebarIcon(IconData icon, String tooltip) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 16),
//       child: Tooltip(
//         message: tooltip,
//         child: Icon(icon, color: Colors.white, size: 28),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sahibot_crm_web/config/app_theme.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouterState.of(context).uri.toString();

    final isLeadsSectionActive =
        currentLocation.startsWith('/pipelines') ||
        currentLocation.startsWith('/contacts') ||
        currentLocation.startsWith('/parties') ||
        currentLocation.startsWith('/follow-up') ||
        currentLocation.startsWith('/products') ||
        currentLocation.startsWith('/activities');

    return Container(
      width: 65,
      margin: EdgeInsets.all(0),
      color: AppCustomTheme.bluePrimary,
      child: Column(
        children: [
          // const SizedBox(height: 0),
          // Logo
          // Padding(
          //   padding: const EdgeInsets.all(10.0),
          //   child: Image.asset('assets/logo.png', height: 40),
          // ),
          const SizedBox(height: 60),
          _buildMenuItem(
            context,
            route: '/',
            icon: Icons.grid_view,
            label: 'My Apps',
            isSelected: currentLocation == '/',
            isTop: true,
          ),
          const SizedBox(height: 8),
          _buildMenuItem(
            context,
            route: '/pipelines',
            icon: Icons.bar_chart,
            label: 'Pipelines',
            // isSelected: currentLocation == '/leads',
            isSelected: isLeadsSectionActive,
          ),
          // _buildMenuItem(
          //   context,
          //   route: '/links',
          //   icon: Icons.link,
          //   label: 'Links',
          //   isSelected: currentLocation == '/links',
          // ),
          _buildMenuItem(
            context,
            route: '/team',
            icon: Icons.groups,
            label: 'Team',
            isSelected: currentLocation == '/team',
          ),
          // const Divider(color: Colors.white),
          // _buildMenuItem(
          //   context,
          //   route: '/settings',
          //   icon: Icons.settings,
          //   label: 'Settings',
          //   isSelected: currentLocation == '/settings',
          // ),
          // _buildMenuItem(
          //   context,
          //   route: '/support',
          //   icon: Icons.help,
          //   label: 'Support',
          //   isSelected: currentLocation == '/support',
          // ),
          _buildMenuItem(
            context,
            route: '/billing',
            icon: Icons.receipt_long,
            label: 'Billing',
            isSelected: currentLocation == '/billing',
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required String route,
    required IconData icon,
    required String label,
    required bool isSelected,
    bool isTop = false,
  }) {
    final bgColor = isSelected ? Colors.white : AppCustomTheme.bluePrimary;
    final iconColor = isSelected ? AppCustomTheme.bluePrimary : Colors.white;
    final textColor = iconColor;

    return InkWell(
      onTap: () {
        final currentLocation = GoRouterState.of(context).uri.toString();
        if (currentLocation != route) {
          context.go(route);
        }
      },
      child: Container(
        width: double.infinity,
        color: bgColor,
        padding: const EdgeInsets.symmetric(vertical: 16),
        // decoration: BoxDecoration(
        //   border: Border.all(color: AppCustomTheme.yellowPrimary),
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 20),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(color: textColor, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
