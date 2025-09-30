// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:sahibot_crm_web/config/app_theme.dart';

// class TeamSidebar extends StatelessWidget {
//   const TeamSidebar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final currentPath = GoRouterState.of(context).uri.toString();

//     // final isTeamsSectionActive =
//     //     currentPath.startsWith('/teams') ||
//     //     currentPath.startsWith('/useraccess') ||currentPath.startsWith('/customize') ;

//     return Container(
//       width: 180,
//       color: AppCustomTheme.lightBlueBg,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const SizedBox(height: 64),
//           // _menuItem(
//           //   context,
//           //   label: 'Dashboard',
//           //   icon: Icons.dashboard,
//           //   // route: '/pipelines/dashboard',
//           //   route: '/dashboard',
//           //   isSelected: currentPath == '/dashboard',
//           //   // isSelected: currentPath == '/pipelines/dashboard',
//           // ),
//           // _menuItem(
//           //   context,
//           //   label: 'Pipelines',
//           //   icon: Icons.filter_alt,
//           //   route: '/pipelines',
//           //   isSelected: currentPath == '/pipelines',
//           // ),
//           // _menuItem(
//           //   context,
//           //   label: 'Contacts',
//           //   icon: Icons.contacts,
//           //   route: '/contacts',
//           //   // Highlight if path is '/contacts' or starts with '/contacts/'
//           //   isSelected:
//           //       currentPath == '/contacts' ||
//           //       currentPath.startsWith('/contacts/'),
//           //   // isSelected: currentPath == '/contacts',
//           // ),
//           // _menuItem(
//           //   context,
//           //   label: 'Parties',
//           //   icon: Icons.apartment,
//           //   route: '/parties',
//           //   isSelected:
//           //       currentPath == '/parties' ||
//           //       currentPath.startsWith('/parties/'),
//           //   // isSelected: currentPath == '/parties',
//           // ),
//           _menuItem(
//             context,
//             label: 'All Members',
//             icon: Icons.directions_run,
//             route: '/team',
//             //isSelected: isTeamsSectionActive,
//             isSelected: currentPath == '/team',
//           ),
//           // _menuItem(
//           //   context,
//           //   label: 'Access Control',
//           //   icon: Icons.directions_run,
//           //   route: '/accesscontrol',
//           //   isSelected: currentPath == '/accesscontrol',
//           // ),
//           // _menuItem(
//           //   context,
//           //   label: 'Customize',
//           //   icon: Icons.directions_run,
//           //   route: '/customize',
//           //   isSelected: currentPath == '/customize',
//           // ),

//           // _menuItem(
//           //   context,
//           //   label: 'Sales Team',
//           //   icon: Icons.person,
//           //   route: '/team',
//           //   isSelected: currentPath == '/team',
//           // ),
//           // _menuItem(
//           //   context,
//           //   label: 'User Roles',
//           //   icon: Icons.shopping_cart,
//           //   route: '/userroles',
//           //   isSelected: currentPath == '/userroles',
//           //   // isSelected:
//           //   //     currentPath == '/products' ||
//           //   //     currentPath.startsWith('/products/'),
//           // ),
//           // _menuItem(
//           //   context,
//           //   label: 'All Members',
//           //   icon: Icons.directions_run,
//           //   route: '/allmembers',
//           //   isSelected: currentPath == '/allmembers',
//           // ),
//         ],
//       ),
//     );
//   }

//   Widget _menuItem(
//     BuildContext context, {
//     required String label,
//     required IconData icon,
//     required String route,
//     required bool isSelected,
//   }) {
//     return InkWell(
//       onTap: () => context.go(route),
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//         color: isSelected ? AppCustomTheme.lightBlueBg : Colors.transparent,
//         child: Row(
//           children: [
//             Icon(
//               icon,
//               size: 20,
//               color: isSelected ? AppCustomTheme.bluePrimary : Colors.black54,
//             ),
//             const SizedBox(width: 12),
//             Expanded(
//               child: Text(
//                 label,
//                 style: TextStyle(
//                   color:
//                       isSelected ? AppCustomTheme.bluePrimary : Colors.black87,
//                   fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
//                 ),
//               ),
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
import 'package:sahibot_crm_web/All%20Sidebars/logout_subsidebar.dart';

class TeamSidebar extends StatelessWidget {
  const TeamSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentPath = GoRouterState.of(context).uri.toString();

    return Container(
      width: 180,
      color: AppCustomTheme.lightBlueBg,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 64),

              _menuItem(
                context,
                label: 'All Members',
                icon: Icons.directions_run,
                route: '/team',
                isSelected: currentPath == '/team',
              ),
              _menuItem(
                context,
                label: 'Sales Team',
                icon: Icons.wallet,
                route: '/salesteam',
                isSelected: currentPath == '/salesteam',
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: LogoutSubsidebar(),
          ),
        ],
      ),
    );
  }

  Widget _menuItem(
    BuildContext context, {
    required String label,
    required IconData icon,
    required String route,
    required bool isSelected,
  }) {
    return InkWell(
      onTap: () {
        if (route != "/salesteam") context.go(route);
      },
      // onTap: () => context.go(route),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        color: isSelected ? AppCustomTheme.lightBlueBg : Colors.transparent,
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? AppCustomTheme.bluePrimary : Colors.black54,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  color:
                      isSelected ? AppCustomTheme.bluePrimary : Colors.black87,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),
            const SizedBox(width: 12),
            if (label == "Sales Team")
              Icon(Icons.lock, size: 20, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
