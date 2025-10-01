// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:sahibot_crm_web/config/app_theme.dart';
// import '../../widgets/sidebar.dart';
// import '../../widgets/topbar.dart';
// import '../../widgets/app_tile.dart';

// class MyAppsScreen extends StatelessWidget {
//   const MyAppsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppCustomTheme.lightgrayBg,
//       body: Stack(
//         children: [
//           // Main layout
//           Row(
//             children: [
//               const Sidebar(),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.only(
//                     top: 64,
//                   ), // Leave space for top bar
//                   child: SingleChildScrollView(
//                     padding: const EdgeInsets.all(24),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         section("Sales & Marketing", [
//                           // AppTile(
//                           //   title: "Dashboard",
//                           //   subtitle: "Clear view of your performance",
//                           //   icon: Icons.dashboard,
//                           //   onPressed: () {
//                           //     //context.go('/dashboard');
//                           //   },
//                           // ),
//                           // AppTile(
//                           //   title: "AutomateLeads",
//                           //   subtitle: "Track and assign leads",
//                           //   icon: Icons.group,
//                           //   onPressed: () {
//                           //     //context.go('/dashboard');
//                           //   },
//                           // ),
//                           AppTile(
//                             title: "Dashboard",
//                             subtitle: "Clear view of your performance",
//                             icon: Icons.dashboard,
//                             onPressed: () {
//                               context.go('/dashboard');
//                             },
//                           ),
//                           AppTile(
//                             title: "AutomateLeads",
//                             subtitle: "Track and assign leads",
//                             icon: Icons.group,
//                             onPressed: () {
//                               context.go('/automateLeads');
//                             },
//                           ),
//                           AppTile(
//                             title: "Contacts",
//                             subtitle: "Manage contacts with ease",
//                             icon: Icons.contact_page,
//                             onPressed: () {
//                               context.go('/contacts');
//                               //context.go('/dashboard');
//                             },
//                           ),
//                           AppTile(
//                             title: "Parties",
//                             subtitle: "Manage parties with ease",
//                             icon: Icons.business,
//                             onPressed: () {
//                               context.go('/parties');
//                               //context.go('/dashboard');
//                             },
//                           ),
//                           // AppTile(
//                           //   title: "Company Details",
//                           //   subtitle: "Manage Company Details with ease",
//                           //   icon: Icons.business,
//                           //   onPressed: () {
//                           //     context.go('/parties');
//                           //     //context.go('/dashboard');
//                           //   },
//                           // ),
//                           AppTile(
//                             title: "Follow-up",
//                             subtitle: "Stay organized and move forward",
//                             icon: Icons.phone_forwarded,
//                             onPressed: () {
//                               context.go('/followup');
//                             },
//                           ),
//                           AppTile(
//                             title: "AutomateWA",
//                             subtitle: "WhatsApp API for Business",
//                             icon: Icons.chat,
//                             onPressed: () {
//                               //context.go('/dashboard');
//                             },
//                           ),
//                           AppTile(
//                             title: "Automate Links",
//                             subtitle: "Manage company links",
//                             icon: Icons.link,
//                             onPressed: () {
//                               //context.go('/dashboard');
//                             },
//                           ),
//                           AppTile(
//                             title: "Integrations",
//                             subtitle: "Connect other applications",
//                             icon: Icons.extension,
//                             onPressed: () {
//                               //context.go('/dashboard');
//                             },
//                           ),
//                           AppTile(
//                             title: "Automate Quotation",
//                             subtitle: "Generate and send quotations",
//                             icon: Icons.description,
//                             onPressed: () {
//                               //context.go('/dashboard');
//                             },
//                           ),
//                         ]),
//                         const SizedBox(height: 24),
//                         section("Team Management", [
//                           AppTile(
//                             title: "AutomateTeam",
//                             subtitle: "Manage tasks, leaves, attendance",
//                             icon: Icons.task,
//                             onPressed: () {
//                               //context.go('/dashboard');
//                             },
//                           ),
//                         ]),
//                         // const SizedBox(height: 24),
//                         // section("App Support", [
//                         //   AppTile(
//                         //     title: "App Setup",
//                         //     subtitle: "Checklist to get most of our apps",
//                         //     icon: Icons.settings,
//                         //     onPressed: () {
//                         //       //context.go('/dashboard');
//                         //     },
//                         //   ),
//                         //   AppTile(
//                         //     title: "Tutorials",
//                         //     subtitle: "Learn to use Business Workspace",
//                         //     icon: Icons.school,
//                         //     onPressed: () {
//                         //       //context.go('/dashboard');
//                         //     },
//                         //   ),
//                         //   AppTile(
//                         //     title: "Events",
//                         //     subtitle: "Q&A and Business Sessions",
//                         //     icon: Icons.event,
//                         //     onPressed: () {
//                         //       //context.go('/dashboard');
//                         //     },
//                         //   ),
//                         //   AppTile(
//                         //     title: "Help Center",
//                         //     subtitle: "Guides for integrations",
//                         //     icon: Icons.help,
//                         //     onPressed: () {
//                         //       //context.go('/dashboard');
//                         //     },
//                         //   ),
//                         // ]),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           // TopBar stays fixed at top
//           const Positioned(top: 0, left: 0, right: 0, child: TopBar()),
//         ],
//       ),
//     );
//   }

//   Widget section(String title, List<Widget> tiles) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 12),
//         Wrap(spacing: 16, runSpacing: 16, children: tiles),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sahibot_crm_web/config/app_theme.dart';
import '../All Sidebars/sidebar.dart';
import '../../widgets/topbar.dart';
import '../../widgets/app_tile.dart';

class MyAppsScreen extends StatelessWidget {
  const MyAppsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppCustomTheme.lightgrayBg,
      body: Stack(
        children: [
          Row(
            children: [
              const Sidebar(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 64),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        section("Sales & Operations", [
                          AppTile(
                            buttonColor: AppCustomTheme.bluePrimary,
                            title: "Dashboard",
                            //subtitle: "Clear view of your performance",
                            icon: Icons.dashboard_rounded,
                            onPressed: () {
                              context.go('/dashboard');
                            },
                          ),
                          // AppTile(
                          //   title: "AutomateLeads",
                          //   subtitle: "Track and assign leads",
                          //   icon: Icons.group,
                          //   onPressed: () {
                          //     context.go('/automateLeads');
                          //   },
                          // ),

                          // AppTile(
                          //   title: "Parties",
                          //   subtitle: "Manage parties with ease",
                          //   icon: Icons.business,
                          //   onPressed: () {
                          //     context.go('/parties');
                          //   },
                          // ),
                          AppTile(
                            buttonColor: AppCustomTheme.bluePrimary,
                            title: "Pipelines",
                            //subtitle: "Manage contacts with ease",
                            icon: Icons.filter_alt_rounded,
                            onPressed: () {
                              context.go('/pipelines');
                            },
                          ),
                          AppTile(
                            buttonColor: AppCustomTheme.bluePrimary,
                            title: "Projects",
                            //subtitle: "Stay organized and move forward",
                            icon: Icons.account_tree_rounded,
                            onPressed: () {
                              context.go('/projects');
                            },
                          ),
                          AppTile(
                            buttonColor: AppCustomTheme.bluePrimary,
                            title: "Contacts",
                            //subtitle: "Manage contacts with ease",
                            icon: Icons.contact_phone_rounded,
                            onPressed: () {
                              context.go('/contacts');
                            },
                          ),
                          AppTile(
                            buttonColor: AppCustomTheme.bluePrimary,
                            title: "Follow-up",
                            //subtitle: "Stay organized and move forward",
                            icon: Icons.connect_without_contact_rounded,
                            onPressed: () {
                              context.go('/followup');
                            },
                          ),
                          // AppTile(
                          //   title: "AutomateWA",
                          //   subtitle: "WhatsApp API for Business",
                          //   icon: Icons.chat,
                          //   onPressed: () {},
                          // ),
                          // AppTile(
                          //   title: "Automate Links",
                          //   subtitle: "Manage company links",
                          //   icon: Icons.link,
                          //   onPressed: () {},
                          // ),
                          // AppTile(
                          //   title: "Integrations",
                          //   subtitle: "Connect other applications",
                          //   icon: Icons.extension,
                          //   onPressed: () {},
                          // ),
                          AppTile(
                            buttonColor: Colors.grey,
                            title: "Quotations",
                            //subtitle: "Generate and send quotations",
                            icon: Icons.add_chart_rounded,
                            onPressed: () {},
                          ),
                        ]),
                        const SizedBox(height: 24),
                        section("Team Management", [
                          // AppTile(
                          //   title: "AutomateTeam",
                          //   subtitle: "Manage tasks, leaves, attendance",
                          //   icon: Icons.task,
                          //   onPressed: () {},
                          // ),
                          AppTile(
                            buttonColor: AppCustomTheme.bluePrimary,
                            title: "Dashboard",
                            //subtitle: null,
                            icon: Icons.dashboard_rounded,
                            onPressed: () {},
                          ),
                          AppTile(
                            buttonColor: AppCustomTheme.bluePrimary,
                            title: "Tasks",
                            //subtitle: null,
                            icon: Icons.task_alt_rounded,
                            onPressed: () {},
                          ),
                          AppTile(
                            buttonColor: AppCustomTheme.bluePrimary,
                            title: "My Tasks",
                            //subtitle: null,
                            icon: Icons.add_task_rounded,
                            onPressed: () {},
                          ),
                          AppTile(
                            buttonColor: AppCustomTheme.bluePrimary,
                            title: "Delegated Tasks",
                            //subtitle: null,
                            icon: Icons.assignment_ind_rounded,
                            onPressed: () {},
                          ),
                        ]),
                        const SizedBox(height: 24),
                        section("HR Management", [
                          AppTile(
                            buttonColor: Colors.grey,
                            title: "Dashboard",
                            //subtitle: null,
                            icon: Icons.dashboard_rounded,
                            onPressed: () {},
                          ),
                          AppTile(
                            buttonColor: Colors.grey,
                            title: "Employees",
                            //subtitle: null,
                            icon: Icons.diversity_2_rounded,
                            onPressed: () {},
                          ),
                          AppTile(
                            buttonColor: Colors.grey,
                            title: "Payroll",
                            //subtitle: null,
                            icon: Icons.diversity_3_rounded,
                            onPressed: () {},
                          ),
                          AppTile(
                            buttonColor: Colors.grey,
                            title: "Attendance",
                            //subtitle: null,
                            icon: Icons.event_available_rounded,
                            onPressed: () {},
                          ),
                          AppTile(
                            buttonColor: Colors.grey,
                            title: "Leaves",
                            //subtitle: null,
                            icon: Icons.event_busy_rounded,
                            onPressed: () {},
                          ),
                          AppTile(
                            buttonColor: Colors.grey,
                            title: "Assets",
                            //subtitle: null,
                            icon: Icons.screen_share_rounded,
                            onPressed: () {},
                          ),
                        ]),
                        const SizedBox(height: 24),
                        section("Finance", [
                          AppTile(
                            buttonColor: Colors.grey,
                            title: "Dashboard",
                            //subtitle: null,
                            icon: Icons.dashboard_rounded,
                            onPressed: () {},
                          ),
                          AppTile(
                            buttonColor: Colors.grey,
                            title: "Invoice",
                            //subtitle: null,
                            icon: Icons.receipt_long_rounded,
                            onPressed: () {},
                          ),
                          AppTile(
                            buttonColor: Colors.grey,
                            title: "Purchase",
                            //subtitle: null,
                            icon: Icons.receipt_rounded,
                            onPressed: () {},
                          ),
                          AppTile(
                            buttonColor: Colors.grey,
                            title: "Customer",
                            //subtitle: null,
                            icon: Icons.group_add_rounded,
                            onPressed: () {},
                          ),
                          AppTile(
                            buttonColor: Colors.grey,
                            title: "Vendor",
                            //subtitle: null,
                            icon: Icons.group_remove_rounded,
                            onPressed: () {},
                          ),
                          AppTile(
                            buttonColor: Colors.grey,
                            title: "Banking",
                            //subtitle: null,
                            icon: Icons.account_balance_rounded,
                            onPressed: () {},
                          ),
                        ]),
                        const SizedBox(height: 24),
                        section("Warehouse & Inventory Management", [
                          AppTile(
                            buttonColor: Colors.grey,
                            title: "Dashboard",
                            //subtitle: null,
                            icon: Icons.dashboard_rounded,
                            onPressed: () {},
                          ),
                          AppTile(
                            buttonColor: Colors.grey,
                            title: "Inventory",
                            //subtitle: null,
                            icon: Icons.inventory_rounded,
                            onPressed: () {},
                          ),
                          AppTile(
                            buttonColor: Colors.grey,
                            title: "Products",
                            //subtitle: null,
                            icon: Icons.category_rounded,
                            onPressed: () {},
                          ),
                          AppTile(
                            buttonColor: Colors.grey,
                            title: "Warehouse",
                            //subtitle: null,
                            icon: Icons.warehouse_rounded,
                            onPressed: () {},
                          ),
                          AppTile(
                            buttonColor: Colors.grey,
                            title: "Store",
                            //subtitle: null,
                            icon: Icons.store_rounded,
                            onPressed: () {},
                          ),
                        ]),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // TopBar stays fixed at top
          const Positioned(top: 0, left: 0, right: 0, child: TopBar()),
        ],
      ),
    );
  }

  Widget section(String title, List<Widget> tiles) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 12),
            // if (title == "Warehouse & Inventory Management" ||
            //     title == "Finance" ||
            //     title == "HR Management")
            //   const Icon(Icons.lock, color: Colors.grey, size: 22),
          ],
        ),

        const SizedBox(height: 12),
        Wrap(spacing: 16, runSpacing: 16, children: tiles),
      ],
    );
  }
}
