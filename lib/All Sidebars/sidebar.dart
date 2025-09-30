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

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:sahibot_crm_web/config/app_theme.dart';

// class Sidebar extends StatelessWidget {
//   const Sidebar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final currentLocation = GoRouterState.of(context).uri.toString();

//     final isLeadsSectionActive =
//         currentLocation.startsWith('/dashboard') ||
//         currentLocation.startsWith('/automateLeads') ||
//         currentLocation.startsWith('/projects') ||
//         currentLocation.startsWith('/pipelines') ||
//         currentLocation.startsWith('/contacts') ||
//         currentLocation.startsWith('/parties') ||
//         currentLocation.startsWith('/followup') ||
//         currentLocation.startsWith('/products') ||
//         currentLocation.startsWith('/activities') ||
//         currentLocation.startsWith('/customize');

//     // final isTeamsSectionActive =
//     //     currentLocation.startsWith('/team') ||
//     //     currentLocation.startsWith('/accesscontrol') || currentLocation.startsWith('/customize');

//     final isTeamsSectionActive = currentLocation.startsWith('/team');

//     // final isBillingSectionActive =
//     //     currentLocation.startsWith('/settings') ||
//     //     currentLocation.startsWith('/accesscontrol') ||
//     //     currentLocation.startsWith('/customize');
//     // ;
//     final isBillingSectionActive =
//         currentLocation.startsWith('/settings') ||
//         currentLocation.startsWith('/accesscontrol');
//     ;

//     return Container(
//       width: 65,
//       margin: EdgeInsets.all(0),
//       color: AppCustomTheme.bluePrimary,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             children: [
//               const SizedBox(height: 60),
//               _buildMenuItem(
//                 context,
//                 route: '/',
//                 icon: Icons.grid_view,
//                 label: 'My Apps',
//                 isSelected: currentLocation == '/',
//                 isTop: true,
//               ),
//               const SizedBox(height: 2),
//               _buildMenuItem(
//                 context,
//                 route: '/pipelines',
//                 icon: Icons.bar_chart,
//                 label: 'Pipelines',
//                 isSelected: isLeadsSectionActive,
//               ),
//               _buildMenuItem(
//                 context,
//                 route: '/team',
//                 icon: Icons.groups,
//                 label: 'Team',
//                 isSelected: isTeamsSectionActive,
//               ),
//               _buildMenuItem(
//                 context,
//                 route: '/settings',
//                 icon: Icons.receipt_long,
//                 label: 'Settings',
//                 isSelected: isBillingSectionActive,
//               ),
//             ],
//           ),

//           Padding(
//             padding: const EdgeInsets.only(bottom: 20),
//             child: IconButton(
//               onPressed: () {},
//               icon: Icon(Icons.logout, color: Colors.white),
//             ),
//           ),
//           // const SizedBox(height: 20),
//         ],
//       ),
//     );
//   }

//   Widget _buildMenuItem(
//     BuildContext context, {
//     required String route,
//     required IconData icon,
//     required String label,
//     required bool isSelected,
//     bool isTop = false,
//   }) {
//     final bgColor = isSelected ? Colors.white : AppCustomTheme.bluePrimary;
//     final iconColor = isSelected ? AppCustomTheme.bluePrimary : Colors.white;
//     final textColor = iconColor;

//     return InkWell(
//       onTap: () {
//         final currentLocation = GoRouterState.of(context).uri.toString();
//         if (currentLocation != route) {
//           context.go(route);
//         }
//       },
//       child: Container(
//         width: double.infinity,
//         color: bgColor,
//         padding: const EdgeInsets.symmetric(vertical: 16),
//         // decoration: BoxDecoration(
//         //   border: Border.all(color: AppCustomTheme.yellowPrimary),
//         // ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, color: iconColor, size: 20),
//             const SizedBox(height: 6),
//             Text(
//               label,
//               style: TextStyle(color: textColor, fontSize: 12),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
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
        currentLocation.startsWith('/dashboard') ||
        currentLocation.startsWith('/automateLeads') ||
        currentLocation.startsWith('/projects') ||
        currentLocation.startsWith('/pipelines') ||
        currentLocation.startsWith('/contacts') ||
        currentLocation.startsWith('/parties') ||
        currentLocation.startsWith('/followup') ||
        currentLocation.startsWith('/products') ||
        currentLocation.startsWith('/activities') ||
        currentLocation.startsWith('/customize');

    // final isTeamsSectionActive =
    //     currentLocation.startsWith('/team') ||
    //     currentLocation.startsWith('/accesscontrol') || currentLocation.startsWith('/customize');

    final isTeamsSectionActive = currentLocation.startsWith('/team');

    // final isBillingSectionActive =
    //     currentLocation.startsWith('/settings') ||
    //     currentLocation.startsWith('/accesscontrol') ||
    //     currentLocation.startsWith('/customize');
    // ;

    final isBillingSectionActive = currentLocation.startsWith('/billing');

    final isSettingsSectionActive = currentLocation.startsWith(
      '/accesscontrol',
    );

    return Container(
      width: 65,
      margin: EdgeInsets.all(0),
      color: AppCustomTheme.bluePrimary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SizedBox(height: 60),
              _buildMenuItem(
                context,
                route: '/',
                icon: Icons.grid_view,
                label: 'My Apps',
                isSelected: currentLocation == '/',
                isTop: true,
              ),
              const SizedBox(height: 2),
              _buildMenuItem(
                context,
                route: '/pipelines',
                icon: Icons.bar_chart,
                label: 'Pipelines',
                // isSelected: isLeadsSectionActive,
                isSelected: currentLocation == '/pipelines',
              ),
              _buildMenuItem(
                context,
                route: '/projects',
                icon: Icons.bar_chart,
                label: 'Projects',
                isSelected: currentLocation == '/projects',
                // isSelected: isLeadsSectionActive,
              ),
              _buildMenuItem(
                context,
                route: '/tasks',
                icon: Icons.task_alt,
                label: 'Tasks',
                isSelected: currentLocation == '/tasks',
              ),
              _buildMenuItem(
                context,
                route: '/hrms',
                icon: Icons.people,
                label: 'HRMS',
                isSelected: currentLocation == '/hrms',
              ),
              _buildMenuItem(
                context,
                route: '/finance',
                icon: Icons.task_alt,
                label: 'Finance',
                isSelected: currentLocation == '/finance',
              ),
              _buildMenuItem(
                context,
                route: '/warehouse',
                icon: Icons.groups,
                label: 'Warehouse\nInventory',
                isSelected: currentLocation == '/warehouse',
              ),
              Divider(),
              _buildMenuItem(
                context,
                route: '/team',
                icon: Icons.groups,
                label: 'Team',
                isSelected: isTeamsSectionActive,
              ),
              _buildMenuItem(
                context,
                route: '/billing',
                icon: Icons.groups,
                label: 'Billing',
                isSelected: isBillingSectionActive,
              ),
              _buildMenuItem(
                context,
                // route: '/settings',
                route: '/accesscontrol',
                icon: Icons.receipt_long,
                label: 'Settings',
                isSelected: isSettingsSectionActive,
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.logout, color: Colors.white),
            ),
          ),
          // const SizedBox(height: 20),
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
        padding: const EdgeInsets.symmetric(vertical: 8),
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
