// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:sahibot_crm_web/config/app_theme.dart';

// class LeadsSectionSidebar extends StatelessWidget {
//   const LeadsSectionSidebar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final currentPath = GoRouterState.of(context).uri.toString();

//     return Container(
//       width: 180,
//       color: AppCustomTheme.lightBlueBg,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const SizedBox(height: 64),
//           _menuItem(
//             context,
//             label: 'Dashboard',
//             icon: Icons.dashboard,
//             // route: '/pipelines/dashboard',
//             route: '/dashboard',
//             // isSelected: currentPath == '/dashboard',
//             isSelected: currentPath == '/dashboard' || currentPath == '/automateLeads',
//             // isSelected: currentPath == '/pipelines/dashboard',
//           ),
//           _menuItem(
//             context,
//             label: 'Projects',
//             icon: Icons.filter_alt,
//             route: '/projects',
//             isSelected: currentPath == '/projects',
//           ),
//           _menuItem(
//             context,
//             label: 'Pipelines',
//             icon: Icons.filter_alt,
//             route: '/pipelines',
//             isSelected: currentPath == '/pipelines',
//           ),

//           _menuItem(
//             context,
//             label: 'Contacts',
//             icon: Icons.contacts,
//             route: '/contacts',
//             // Highlight if path is '/contacts' or starts with '/contacts/'
//             isSelected:
//                 currentPath == '/contacts' ||
//                 currentPath.startsWith('/contacts/'),
//             // isSelected: currentPath == '/contacts',
//           ),
//           _menuItem(
//             context,
//             label: 'Parties',
//             icon: Icons.apartment,
//             route: '/parties',
//             isSelected:
//                 currentPath == '/parties' ||
//                 currentPath.startsWith('/parties/'),
//             // isSelected: currentPath == '/parties',
//           ),
//           _menuItem(
//             context,
//             label: 'Follow-up',
//             icon: Icons.phone_callback,
//             route: '/followup',
//             isSelected: currentPath == '/followup',
//           ),
//           _menuItem(
//             context,
//             label: 'Products',
//             icon: Icons.shopping_cart,
//             route: '/products',
//             isSelected: currentPath == '/products' || currentPath.startsWith('/products/'),
//           ),
//           _menuItem(
//             context,
//             label: 'Activities',
//             icon: Icons.directions_run,
//             route: '/activities',
//             isSelected: currentPath == '/activities',
//           ),
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
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:sahibot_crm_web/config/app_theme.dart';
// import 'package:sahibot_crm_web/All%20Sidebars/logout_subsidebar.dart';

// class LeadsSectionSidebar extends StatelessWidget {
//   const LeadsSectionSidebar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final currentPath = GoRouterState.of(context).uri.toString();

//     return Container(
//       width: 180,
//       color: AppCustomTheme.lightBlueBg,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(height: 64),
//               _menuItem(
//                 context,
//                 label: 'Dashboard',
//                 icon: Icons.dashboard_rounded,
//                 route: '/dashboard',
//                 isSelected:
//                     currentPath == '/dashboard' ||
//                     currentPath == '/automateLeads',
//               ),

//               _menuItem(
//                 context,
//                 label: 'Pipelines',
//                 icon: Icons.filter_alt_rounded,
//                 route: '/pipelines',
//                 isSelected: currentPath == '/pipelines',
//               ),
//               _menuItem(
//                 context,
//                 label: 'Projects',
//                 icon: Icons.account_tree_rounded,
//                 route: '/projects',
//                 isSelected: currentPath == '/projects',
//               ),

//               _menuItem(
//                 context,
//                 label: 'Contacts',
//                 icon: Icons.contact_phone_rounded,
//                 route: '/contacts',

//                 isSelected:
//                     currentPath == '/contacts' ||
//                     currentPath.startsWith('/contacts/'),
//               ),
//               _menuItem(
//                 context,
//                 label: 'Parties',
//                 icon: Icons.apartment,
//                 route: '/parties',
//                 isSelected:
//                     currentPath == '/parties' ||
//                     currentPath.startsWith('/parties/'),
//               ),
//               _menuItem(
//                 context,
//                 label: 'Follow-up',
//                 icon: Icons.connect_without_contact_rounded,
//                 route: '/followup',
//                 isSelected: currentPath == '/followup',
//               ),
//               _menuItem(
//                 context,
//                 label: 'Products',
//                 icon: Icons.category_rounded,
//                 route: '/products',
//                 isSelected:
//                     currentPath == '/products' ||
//                     currentPath.startsWith('/products/'),
//               ),
//               _menuItem(
//                 context,
//                 label: 'Activities',
//                 icon: Icons.directions_run,
//                 route: '/activities',
//                 isSelected: currentPath == '/activities',
//               ),
//               _menuItem(
//                 context,
//                 label: 'Customize',
//                 icon: Icons.tune,
//                 route: '/customize',
//                 isSelected: currentPath == '/customize',
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 20),
//             child: LogoutSubsidebar(),
//           ),
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
import 'package:sahibot_crm_web/All Sidebars/logout_subsidebar.dart';

class projectsSidebar extends StatefulWidget {
  const projectsSidebar({super.key});

  @override
  State<projectsSidebar> createState() => _projectsSidebarState();
}

class _projectsSidebarState extends State<projectsSidebar> {
  bool customizeExpanded = true; // default open

  @override
  Widget build(BuildContext context) {
    final currentPath = GoRouterState.of(context).uri.toString();

    return Container(
      width: 200,
      color: AppCustomTheme.lightBlueBg,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 64),

              _menuItem(
                context,
                label: 'Dashboard',
                icon: Icons.dashboard_rounded,
                route: '/dashboard',
                isSelected:
                    currentPath == '/dashboard' ||
                    currentPath == '/automateLeads',
              ),

              // _menuItem(
              //   context,
              //   label: 'Pipelines',
              //   icon: Icons.filter_alt_rounded,
              //   route: '/pipelines',
              //   isSelected: currentPath == '/pipelines',
              // ),

              _menuItem(
                context,
                label: 'Projects',
                icon: Icons.account_tree_rounded,
                route: '/projects',
                isSelected: currentPath == '/projects',
              ),

              _menuItem(
                context,
                label: 'Contacts',
                icon: Icons.contact_phone_rounded,
                route: '/contacts',
                isSelected:
                    currentPath == '/contacts' ||
                    currentPath.startsWith('/contacts/'),
              ),

              _menuItem(
                context,
                label: 'Parties',
                icon: Icons.apartment,
                route: '/parties',
                isSelected:
                    currentPath == '/parties' ||
                    currentPath.startsWith('/parties/'),
              ),

              _menuItem(
                context,
                label: 'Follow-up',
                icon: Icons.connect_without_contact_rounded,
                route: '/followup',
                isSelected: currentPath == '/followup',
              ),

              _menuItem(
                context,
                label: 'Products',
                icon: Icons.category_rounded,
                route: '/products',
                isSelected:
                    currentPath == '/products' ||
                    currentPath.startsWith('/products/'),
              ),

              _menuItem(
                context,
                label: 'Activities',
                icon: Icons.directions_run,
                route: '/activities',
                isSelected: currentPath == '/activities',
              ),
              _menuItem(
                context,
                label: 'Customize',
                icon: Icons.account_tree_outlined,
                route: '/customize/projects',
                isSelected: currentPath == '/customize/projects',
              ),

              // // Parent: Customize
              // InkWell(
              //   onTap: () {
              //     setState(() {
              //       customizeExpanded = !customizeExpanded;
              //     });
              //   },
              //   child: Container(
              //     padding: const EdgeInsets.symmetric(
              //       horizontal: 16,
              //       vertical: 14,
              //     ),
              //     color:
              //         currentPath.startsWith('/customize')
              //             ? AppCustomTheme.lightBlueBg
              //             : Colors.transparent,
              //     child: Row(
              //       children: [
              //         Icon(
              //           Icons.tune,
              //           size: 20,
              //           color:
              //               currentPath.startsWith('/customize')
              //                   ? AppCustomTheme.bluePrimary
              //                   : Colors.black54,
              //         ),
              //         const SizedBox(width: 12),
              //         Expanded(
              //           child: Text(
              //             'Customize',
              //             style: TextStyle(
              //               color:
              //                   currentPath.startsWith('/customize')
              //                       ? AppCustomTheme.bluePrimary
              //                       : Colors.black87,
              //               fontWeight:
              //                   currentPath.startsWith('/customize')
              //                       ? FontWeight.w600
              //                       : FontWeight.normal,
              //             ),
              //           ),
              //         ),
              //         Icon(
              //           customizeExpanded
              //               ? Icons.keyboard_arrow_up
              //               : Icons.keyboard_arrow_down,
              //           size: 18,
              //           color: Colors.black54,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              // // Child items under Customize
              // if (customizeExpanded) ...[
              //   _subMenuItem(
              //     context,
              //     label: 'Pipelines Customize',
              //     icon: Icons.filter_alt_rounded,
              //     route: '/customize/pipelines',
              //     isSelected: currentPath == '/customize/pipelines',
              //   ),
              //   _subMenuItem(
              //     context,
              //     label: 'Project Customize',
              //     icon: Icons.account_tree_outlined,
              //     route: '/customize/projects',
              //     isSelected: currentPath == '/customize/projects',
              //   ),
              // ],
            ],
          ),

          const Padding(
            padding: EdgeInsets.only(bottom: 20),
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
      onTap: () => context.go(route),
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
          ],
        ),
      ),
    );
  }

  Widget _subMenuItem(
    BuildContext context, {
    required String label,
    required IconData icon,
    required String route,
    required bool isSelected,
  }) {
    return InkWell(
      onTap: () => context.go(route),
      child: Container(
        padding: const EdgeInsets.only(
          left: 40,
          top: 10,
          bottom: 10,
          right: 16,
        ),
        color: isSelected ? AppCustomTheme.lightBlueBg.withOpacity(0.5) : null,
        child: Row(
          children: [
            Icon(
              icon,
              size: 18,
              color: isSelected ? AppCustomTheme.bluePrimary : Colors.black54,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  color:
                      isSelected ? AppCustomTheme.bluePrimary : Colors.black87,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
