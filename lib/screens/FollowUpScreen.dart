// import 'package:flutter/material.dart';
// import 'package:sahibot_crm_web/config/app_theme.dart';
// import '../../widgets/topbar.dart';
// import '../../widgets/sidebar.dart';
// import '../../widgets/leads_section_sidebar.dart';

// class FollowUpScreen extends StatelessWidget {
//   const FollowUpScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Row(
//             children: const [
//               Sidebar(),
//               LeadsSectionSidebar(),
//               Expanded(
//                 child: Padding(
//                   padding: EdgeInsets.only(top: 64),
//                   child: FollowUpContent(),
//                 ),
//               ),
//             ],
//           ),
//           const Positioned(top: 0, left: 0, right: 0, child: TopBar()),
//         ],
//       ),
//     );
//   }
// }

// class FollowUpContent extends StatelessWidget {
//   const FollowUpContent({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Replace below Container with your Follow Up page content/widgets
//     return Container(
//       color: Colors.white,
//       padding: const EdgeInsets.all(24),
//       child: Column(
//         children: [
//           // Add your Follow Up page controls (filters, buttons, etc.) here
//           Align(
//             alignment: Alignment.centerLeft,
//             child: ElevatedButton.icon(
//               onPressed: () {
//                 // Action to add follow up
//               },
//               icon: const Icon(Icons.add),
//               label: const Text('Followup'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.green,
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 12,
//                   horizontal: 16,
//                 ),
//                 textStyle: const TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),

//           const SizedBox(height: 16),

//           // Placeholder for filters row: This Week, Assigned To, Pipeline, Search, Due Date, etc.
//           // Wrap(
//           //   spacing: 16,
//           //   runSpacing: 12,
//           //   children: [
//           //     DropdownButton<String>(
//           //       value: 'This Week',
//           //       items: const [
//           //         DropdownMenuItem(
//           //           value: 'This Week',
//           //           child: Text('This Week'),
//           //         ),
//           //         DropdownMenuItem(
//           //           value: 'Next Week',
//           //           child: Text('Next Week'),
//           //         ),
//           //         DropdownMenuItem(
//           //           value: 'This Month',
//           //           child: Text('This Month'),
//           //         ),
//           //       ],
//           //       onChanged: (value) {
//           //         // Handle filter change
//           //       },
//           //     ),
//           //     DropdownButton<String>(
//           //       value: 'Assigned To',
//           //       items: const [
//           //         DropdownMenuItem(
//           //           value: 'Assigned To',
//           //           child: Text('Assigned To'),
//           //         ),
//           //         DropdownMenuItem(value: 'Me', child: Text('Me')),
//           //         DropdownMenuItem(value: 'Team', child: Text('Team')),
//           //       ],
//           //       onChanged: (value) {
//           //         // Handle filter change
//           //       },
//           //     ),
//           //     DropdownButton<String>(
//           //       value: 'Pipeline',
//           //       items: const [
//           //         DropdownMenuItem(value: 'Pipeline', child: Text('Pipeline')),
//           //         DropdownMenuItem(value: 'Sales', child: Text('Sales')),
//           //         DropdownMenuItem(value: 'Support', child: Text('Support')),
//           //       ],
//           //       onChanged: (value) {
//           //         // Handle filter change
//           //       },
//           //     ),
//           //     SizedBox(
//           //       width: 200,
//           //       child: TextField(
//           //         decoration: InputDecoration(
//           //           hintText: 'Search',
//           //           prefixIcon: const Icon(Icons.search),
//           //           border: OutlineInputBorder(
//           //             borderRadius: BorderRadius.circular(4),
//           //           ),
//           //           isDense: true,
//           //         ),
//           //       ),
//           //     ),
//           //     DropdownButton<String>(
//           //       value: 'Due Date',
//           //       items: const [
//           //         DropdownMenuItem(value: 'Due Date', child: Text('Due Date')),
//           //         DropdownMenuItem(value: 'Priority', child: Text('Priority')),
//           //       ],
//           //       onChanged: (value) {
//           //         // Handle filter change
//           //       },
//           //     ),
//           //     IconButton(
//           //       onPressed: () {
//           //         // Sort ascending/descending
//           //       },
//           //       icon: const Icon(Icons.sort_by_alpha),
//           //     ),
//           //   ],
//           // ),

//           const SizedBox(height: 20),

//           // Placeholder for List View / Calendar View toggle buttons
//           Row(
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   // Show List View
//                 },
//                 child: const Text('List View'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: AppCustomTheme.bluePrimary.withOpacity(0.1),
//                   foregroundColor: AppCustomTheme.bluePrimary,
//                   elevation: 0,
//                 ),
//               ),
//               const SizedBox(width: 8),
//               OutlinedButton(
//                 onPressed: () {
//                   // Show Calendar View
//                 },
//                 child: const Text('Calendar View'),
//               ),
//             ],
//           ),

//           const SizedBox(height: 24),

//           // Placeholder for your follow up summary cards or list here
//           Container(
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.grey.shade300),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Row(
//               children: [
//                 CircleAvatar(
//                   radius: 28,
//                   backgroundColor: Colors.cyan,
//                   child: const Text(
//                     'BS',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//                     Text(
//                       'Total',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     Text('1'),
//                   ],
//                 ),
//                 const SizedBox(width: 24),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'Overdue',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 6,
//                         vertical: 2,
//                       ),
//                       decoration: BoxDecoration(
//                         color: Colors.red.shade200,
//                         borderRadius: BorderRadius.circular(6),
//                       ),
//                       child: const Text('1'),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(width: 16),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'Open',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 6,
//                         vertical: 2,
//                       ),
//                       decoration: BoxDecoration(
//                         color: Colors.orange.shade200,
//                         borderRadius: BorderRadius.circular(6),
//                       ),
//                       child: const Text('0'),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(width: 16),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'Closed',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 6,
//                         vertical: 2,
//                       ),
//                       decoration: BoxDecoration(
//                         color: Colors.green.shade200,
//                         borderRadius: BorderRadius.circular(6),
//                       ),
//                       child: const Text('0'),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),

//           const SizedBox(height: 24),

//           // Placeholder for DataTable/List of followups
//           Expanded(
//             child: SingleChildScrollView(
//               child: DataTable(
//                 columns: const [
//                   DataColumn(label: Text('Contact')),
//                   DataColumn(label: Text('Stage')),
//                   DataColumn(label: Text('Due Date')),
//                   DataColumn(label: Text('Assigned To')),
//                   DataColumn(label: Text('Type')),
//                   DataColumn(label: Text('Actions')),
//                 ],
//                 rows: const [
//                   DataRow(
//                     cells: [
//                       DataCell(
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Bilal Shaikh',
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             Text('sbillu93@gmail.com'),
//                             Text('+91 9769175240'),
//                           ],
//                         ),
//                       ),
//                       DataCell(
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text('Prospecting'),
//                             Text('Software Sale Pipeline'),
//                           ],
//                         ),
//                       ),
//                       DataCell(
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text('Jul 8, 2025 9:47 PM'),
//                             Text('7 days ago'),
//                           ],
//                         ),
//                       ),
//                       DataCell(
//                         Row(
//                           children: [
//                             CircleAvatar(
//                               backgroundColor: Colors.cyan,
//                               child: const Text(
//                                 'BS',
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ),
//                             const SizedBox(width: 8),
//                             const Text('Bilal'),
//                           ],
//                         ),
//                       ),
//                       DataCell(const Text('Call')),
//                       DataCell(
//                         IconButton(
//                           icon: const Icon(Icons.more_vert),
//                           onPressed: null, // Add your action here
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:sahibot_crm_web/config/app_theme.dart';
// import 'package:sahibot_crm_web/widgets/AddContactDrawer.dart';
// import 'package:sahibot_crm_web/widgets/FollowUpTabs.dart';
// import 'package:sahibot_crm_web/widgets/contact_actions_menu.dart';
// import 'package:sahibot_crm_web/widgets/contact_table.dart';
// import 'package:sahibot_crm_web/widgets/followup_table.dart';
// import 'package:sahibot_crm_web/widgets/leads_section_sidebar.dart';
// import '../../widgets/topbar.dart';
// import '../../widgets/sidebar.dart';

// class FollowUpScreen extends StatefulWidget {
//   const FollowUpScreen({super.key});

//   @override
//   State<FollowUpScreen> createState() => _FollowUpScreenState();
// }

// class _FollowUpScreenState extends State<FollowUpScreen>
//     with SingleTickerProviderStateMixin {
//   bool isPanelOpen = false;
//   String selectedContactName = '';
//   late TabController _tabController;

//   void openPanel(String contactName) {
//     if (mounted) {
//       setState(() {
//         selectedContactName = contactName;
//         isPanelOpen = true;
//       });
//     }
//   }

//   void closePanel() {
//     if (mounted) {
//       setState(() {
//         isPanelOpen = false;
//       });
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Row(
//             children: [
//               const Sidebar(),
//               const LeadsSectionSidebar(),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 64),
//                   child: Column(
//                     children: [
//                       _buildHeaderControls(context),
//                       const Divider(height: 1),

//                       // FollowUpTabs(),
//                       Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 24,
//                               vertical: 12,
//                             ),
//                             child: Row(
//                               mainAxisAlignment:
//                                   MainAxisAlignment
//                                       .center, // Center the tabs container
//                               children: [
//                                 Container(
//                                   constraints: BoxConstraints(maxWidth: 700),
//                                   child: TabBar(
//                                     controller: _tabController,
//                                     indicatorColor: AppCustomTheme.bluePrimary,
//                                     labelColor: Colors.black,
//                                     labelStyle: const TextStyle(
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                     isScrollable:
//                                         true, // Allows horizontal scroll if many tabs
//                                     tabs: const [
//                                       Tab(text: "Overdue"),
//                                       Tab(text: "Open"),
//                                       Tab(text: "Closed"),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Expanded(
//                             child: TabBarView(
//                               controller: _tabController,
//                               children: const [
//                                 FollowUpTable(
//                                   statusFilter: 'Overdue',
//                                 ), // Filter data by status accordingly
//                                 FollowUpTable(statusFilter: 'Open'),
//                                 FollowUpTable(statusFilter: 'Closed'),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const Positioned(top: 0, left: 0, right: 0, child: TopBar()),
//           if (isPanelOpen)
//             Align(
//               alignment: Alignment.centerRight,
//               child: AnimatedContainer(
//                 duration: const Duration(milliseconds: 300),
//                 width: 500,
//                 height: MediaQuery.of(context).size.height,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black26,
//                       blurRadius: 8,
//                       offset: Offset(-2, 0),
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(24.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               CircleAvatar(
//                                 radius: 24,
//                                 backgroundColor: Colors.blue.shade100,
//                                 child: Text(
//                                   selectedContactName.isNotEmpty
//                                       ? selectedContactName[0] +
//                                           selectedContactName.split(" ").last[0]
//                                       : '',
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(width: 12),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   GestureDetector(
//                                     onTap: () {
//                                       context.go(
//                                         '/contacts/${Uri.encodeComponent(selectedContactName)}',
//                                       );
//                                     },
//                                     child: Text(
//                                       selectedContactName,
//                                       style: const TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 16,
//                                         color: Colors.blue,
//                                       ),
//                                     ),
//                                   ),
//                                   Row(
//                                     children: const [
//                                       Text(
//                                         "Zylker Corp",
//                                         style: TextStyle(color: Colors.blue),
//                                       ),
//                                       SizedBox(width: 6),
//                                       Icon(
//                                         Icons.emoji_events,
//                                         color: Colors.orange,
//                                         size: 16,
//                                       ),
//                                       SizedBox(width: 4),
//                                       Text(
//                                         "owais Patel",
//                                         style: TextStyle(color: Colors.grey),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               ContactActionsMenu(),
//                               // _iconCircle(Icons.more_vert, onTap: ContactActionsMenu()),
//                               const SizedBox(width: 8),
//                               _iconCircle(Icons.open_in_new),
//                               const SizedBox(width: 8),
//                               _iconCircle(Icons.close, onTap: closePanel),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     TabBar(
//                       controller: _tabController,
//                       indicatorColor: AppCustomTheme.bluePrimary,
//                       labelColor: Colors.black,
//                       labelStyle: const TextStyle(fontWeight: FontWeight.w600),
//                       tabs: const [
//                         Tab(text: "Information"),
//                         Tab(text: "Notes"),
//                       ],
//                     ),
//                     Expanded(
//                       child: TabBarView(
//                         controller: _tabController,
//                         children: [_buildInformationTab(), _buildNotesTab()],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }

//   // Widget _buildInformationTab() {
//   //   return Padding(
//   //     padding: const EdgeInsets.all(16),
//   //     child: Column(
//   //       crossAxisAlignment: CrossAxisAlignment.start,
//   //       children: const [
//   //         Text('Email: support@bigin.com'),
//   //         SizedBox(height: 8),
//   //         Text('Phone: 609-884-0686'),
//   //         SizedBox(height: 8),
//   //         Text('Address:\n8 W Cerritos Ave #54, Bridgeport, New Jersey'),
//   //         SizedBox(height: 16),
//   //         Text('Tags: Sample Tag'),
//   //         SizedBox(height: 16),
//   //         Text('Description:'),
//   //         Text(
//   //           'This is a sample Contact.\n\u2731 Quickly get started by creating a note \u270D\uFE0F or an activity \uD83C\uDFAF for this Contact.',
//   //         ),
//   //         Spacer(),
//   //         Text(
//   //           'Last Modified on Today, 08:03 PM',
//   //           style: TextStyle(fontSize: 12, color: Colors.grey),
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }

//   Widget _buildInformationTab() {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _sectionTitle('Basic Info'),
//           _infoRow(Icons.email, 'support@bigin.com'),
//           _infoRow(Icons.phone_android, '609-884-0686'),
//           _infoRow(Icons.phone_in_talk_rounded, '--'),
//           _infoRow(Icons.telegram, '--'),
//           _addressRow(),

//           const SizedBox(height: 24),
//           _sectionTitle('Tags'),
//           OutlinedButton.icon(
//             icon: const Icon(Icons.add),
//             label: const Text("Tag"),
//             onPressed: () {},
//             style: OutlinedButton.styleFrom(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               foregroundColor: Colors.black54,
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//             ),
//           ),

//           const SizedBox(height: 24),
//           _sectionTitle('Description'),
//           const Text(
//             'This is a sample Contact.',
//             style: TextStyle(fontSize: 14),
//           ),
//           const Text(
//             '✱ Quickly get started by creating a note ✍️ or an activity 🎯 for this Contact.',
//             style: TextStyle(fontSize: 14),
//           ),
//           Row(
//             children: const [
//               Text(
//                 '✱ For any help write to us at supp …',
//                 style: TextStyle(fontSize: 14),
//               ),
//               SizedBox(width: 6),
//               Text('Show more', style: TextStyle(color: Colors.blue)),
//             ],
//           ),

//           const SizedBox(height: 24),
//           _sectionTitle('Other Info'),
//           _infoRow(Icons.mail_outline, 'Email Opt Out: --'),

//           const SizedBox(height: 24),
//           _buildFooterNote(),
//         ],
//       ),
//     );
//   }

//   Widget _sectionTitle(String title) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8.0),
//       child: Text(
//         title,
//         style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//       ),
//     );
//   }

//   Widget _infoRow(IconData icon, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Row(
//         children: [
//           Icon(icon, size: 18, color: Colors.black87),
//           const SizedBox(width: 8),
//           Flexible(child: Text(value, style: const TextStyle(fontSize: 14))),
//         ],
//       ),
//     );
//   }

//   Widget _addressRow() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         children: [
//           const Icon(Icons.location_on, size: 18),
//           const SizedBox(width: 8),
//           Expanded(
//             child: Text(
//               '8 W Cerritos Ave #54, Bridgeport, New Jersey',
//               style: const TextStyle(
//                 fontSize: 14,
//                 color: Colors.blue,
//                 decoration: TextDecoration.underline,
//               ),
//             ),
//           ),
//           const Icon(Icons.link, size: 16, color: Colors.grey),
//         ],
//       ),
//     );
//   }

//   Widget _buildFooterNote() {
//     return Row(
//       children: [
//         const CircleAvatar(
//           radius: 12,
//           backgroundImage: NetworkImage('https://i.imgur.com/BoN9kdC.png'),
//         ),
//         const SizedBox(width: 8),
//         const Text(
//           'Last Modified on  Yesterday, 08:03 PM',
//           style: TextStyle(fontSize: 12, color: Colors.grey),
//         ),
//       ],
//     );
//   }

//   Widget _buildNotesTab() {
//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           TextField(
//             decoration: InputDecoration(
//               hintText: "What's this note about?",
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               contentPadding: EdgeInsets.symmetric(
//                 horizontal: 12,
//                 vertical: 10,
//               ),
//             ),
//           ),
//           const SizedBox(height: 16),
//           Row(
//             children: const [
//               CircleAvatar(
//                 radius: 18,
//                 backgroundImage: NetworkImage(
//                   'https://i.imgur.com/BoN9kdC.png',
//                 ),
//               ),
//               SizedBox(width: 8),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "owais Patel • Yesterday, 08:03 PM",
//                     style: TextStyle(fontSize: 12, color: Colors.grey),
//                   ),
//                   SizedBox(height: 4),
//                   Text(
//                     "Here is a sample note for you!",
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           const SizedBox(height: 8),
//           const Padding(
//             padding: EdgeInsets.only(left: 42),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "\u2731 Notes are a great way to capture key information about your Contact/Deal internally.",
//                 ),
//                 Text(
//                   "\u2731 Type \"@\" to mention fellow users in your organization and start a discussion right from a note.",
//                 ),
//                 SizedBox(height: 6),
//                 Text("Pipeline Record", style: TextStyle(color: Colors.grey)),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _iconCircle(IconData icon, {VoidCallback? onTap}) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(20),
//       child: Container(
//         width: 36,
//         height: 36,
//         decoration: BoxDecoration(
//           color: Colors.grey.shade200,
//           shape: BoxShape.circle,
//         ),
//         child: Icon(icon, size: 18, color: Colors.grey.shade800),
//       ),
//     );
//   }

//   Widget _buildHeaderControls(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ElevatedButton.icon(
//             onPressed: () {
//               showGeneralDialog(
//                 context: context,
//                 barrierDismissible: true,
//                 barrierLabel: "Follow Up",
//                 transitionDuration: const Duration(milliseconds: 300),
//                 pageBuilder: (context, animation, secondaryAnimation) {
//                   return Align(
//                     alignment: Alignment.centerRight,
//                     child: SizedBox(
//                       width: MediaQuery.of(context).size.width * 0.4,
//                       child: AddContactDrawer(),
//                     ),
//                   );
//                 },
//                 transitionBuilder: (
//                   context,
//                   animation,
//                   secondaryAnimation,
//                   child,
//                 ) {
//                   final slideAnimation = Tween<Offset>(
//                     begin: const Offset(1, 0),
//                     end: Offset.zero,
//                   ).animate(animation);

//                   return SlideTransition(
//                     position: slideAnimation,
//                     child: child,
//                   );
//                 },
//               );
//             },
//             icon: const Icon(Icons.add, color: Colors.white),
//             label: const Text(
//               'Follow Up',
//               style: TextStyle(color: Colors.white),
//             ),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: AppCustomTheme.bluePrimary,
//             ),
//           ),

//           const SizedBox(width: 12),

//           SizedBox(
//             width: 200,
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search',
//                 prefixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 isDense: true,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sahibot_crm_web/config/app_theme.dart';
import 'package:sahibot_crm_web/screens/followdetails.dart';
import 'package:sahibot_crm_web/widgets/AddContactDrawer.dart';
import 'package:sahibot_crm_web/widgets/addFollowUp.dart';
import 'package:sahibot_crm_web/widgets/contact_actions_menu.dart';
import 'package:sahibot_crm_web/widgets/followup_table.dart';
import 'package:sahibot_crm_web/widgets/leads_section_sidebar.dart';
import '../../widgets/topbar.dart';
import '../../widgets/sidebar.dart';

class FollowUpScreen extends StatefulWidget {
  const FollowUpScreen({super.key});

  @override
  State<FollowUpScreen> createState() => _FollowUpScreenState();
}

// class _FollowUpScreenState extends State<FollowUpScreen>
//     with SingleTickerProviderStateMixin {
//   bool isPanelOpen = false;
//   String selectedContactName = '';
//   late TabController _tabController;

//   void openPanel(String contactName) {
//     if (mounted) {
//       setState(() {
//         selectedContactName = contactName;
//         isPanelOpen = true;
//       });
//     }
//   }

//   void closePanel() {
//     if (mounted) {
//       setState(() {
//         isPanelOpen = false;
//       });
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this); // 3 tabs
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Row(
//             children: [
//               const Sidebar(),
//               const LeadsSectionSidebar(),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 64),
//                   child: Column(
//                     children: [
//                       _buildHeaderControls(context),
//                       const Divider(height: 1),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 24,
//                           vertical: 12,
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             ConstrainedBox(
//                               constraints: const BoxConstraints(maxWidth: 400),
//                               child: TabBar(
//                                 controller: _tabController,
//                                 indicatorColor: AppCustomTheme.bluePrimary,
//                                 labelColor: Colors.black,
//                                 labelStyle: const TextStyle(
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                                 isScrollable: true,
//                                 tabs: const [
//                                   Tab(text: "Overdue"),
//                                   Tab(text: "Open"),
//                                   Tab(text: "Closed"),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Expanded(
//                         child: TabBarView(
//                           controller: _tabController,
//                           children: [
//                             FollowUpTable(
//                               onFollowUpTap: (contactName) {
//                                 // Your panel open/close logic here
//                               },
//                               isPanelOpen: isPanelOpen,
//                               statusFilter: 'Overdue', // or 'Open', 'Closed'
//                             ),
//                             FollowUpTable(
//                               onFollowUpTap: (contactName) {
//                                 // Your panel open/close logic here
//                               },
//                               isPanelOpen: isPanelOpen,
//                               statusFilter: 'Open', // or 'Open', 'Closed'
//                             ),
//                             FollowUpTable(
//                               onFollowUpTap: (contactName) {
//                                 // Your panel open/close logic here
//                               },
//                               isPanelOpen: isPanelOpen,
//                               statusFilter: 'Closed', // or 'Open', 'Closed'
//                             ),

//                             // FollowUpTable(
//                             //   statusFilter: 'Overdue',
//                             //   onContactTap: openPanel,
//                             // ),
//                             // FollowUpTable(
//                             //   statusFilter: 'Open',
//                             //   onContactTap: openPanel,
//                             // ),
//                             // FollowUpTable(
//                             //   statusFilter: 'Closed',
//                             //   onContactTap: openPanel,
//                             // ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const Positioned(top: 0, left: 0, right: 0, child: TopBar()),
//           if (isPanelOpen)
//             Align(
//               alignment: Alignment.centerRight,
//               child: AnimatedContainer(
//                 duration: const Duration(milliseconds: 300),
//                 width: 500,
//                 height: MediaQuery.of(context).size.height,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   boxShadow: const [
//                     BoxShadow(
//                       color: Colors.black26,
//                       blurRadius: 8,
//                       offset: Offset(-2, 0),
//                     ),
//                   ],
//                 ),
//                 child: _buildDetailsPanel(),
//               ),
//             ),
//         ],
//       ),
//     );
//   }

//   Widget _buildDetailsPanel() {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   CircleAvatar(
//                     radius: 24,
//                     backgroundColor: Colors.blue.shade100,
//                     child: Text(
//                       selectedContactName.isNotEmpty
//                           ? selectedContactName[0] +
//                               selectedContactName.split(" ").last[0]
//                           : '',
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           context.go(
//                             '/contacts/${Uri.encodeComponent(selectedContactName)}',
//                           );
//                         },
//                         child: Text(
//                           selectedContactName,
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                             color: Colors.blue,
//                           ),
//                         ),
//                       ),
//                       Row(
//                         children: const [
//                           Text(
//                             "Zylker Corp",
//                             style: TextStyle(color: Colors.blue),
//                           ),
//                           SizedBox(width: 6),
//                           Icon(
//                             Icons.emoji_events,
//                             color: Colors.orange,
//                             size: 16,
//                           ),
//                           SizedBox(width: 4),
//                           Text(
//                             "owais Patel",
//                             style: TextStyle(color: Colors.grey),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   ContactActionsMenu(),
//                   const SizedBox(width: 8),
//                   _iconCircle(Icons.open_in_new),
//                   const SizedBox(width: 8),
//                   _iconCircle(Icons.close, onTap: closePanel),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         TabBar(
//           controller: _tabController,
//           indicatorColor: AppCustomTheme.bluePrimary,
//           labelColor: Colors.black,
//           labelStyle: const TextStyle(fontWeight: FontWeight.w600),
//           tabs: const [Tab(text: "Information"), Tab(text: "Notes")],
//         ),
//         Expanded(
//           child: TabBarView(
//             controller: _tabController,
//             children: [_buildInformationTab(), _buildNotesTab()],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildInformationTab() {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _sectionTitle('Basic Info'),
//           _infoRow(Icons.email, 'support@bigin.com'),
//           _infoRow(Icons.phone_android, '609-884-0686'),
//           _infoRow(Icons.phone_in_talk_rounded, '--'),
//           _infoRow(Icons.telegram, '--'),
//           _addressRow(),

//           const SizedBox(height: 24),
//           _sectionTitle('Tags'),
//           OutlinedButton.icon(
//             icon: const Icon(Icons.add),
//             label: const Text("Tag"),
//             onPressed: () {},
//             style: OutlinedButton.styleFrom(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               foregroundColor: Colors.black54,
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//             ),
//           ),

//           const SizedBox(height: 24),
//           _sectionTitle('Description'),
//           const Text(
//             'This is a sample Contact.',
//             style: TextStyle(fontSize: 14),
//           ),
//           const Text(
//             '✱ Quickly get started by creating a note ✍️ or an activity 🎯 for this Contact.',
//             style: TextStyle(fontSize: 14),
//           ),
//           Row(
//             children: const [
//               Text(
//                 '✱ For any help write to us at supp …',
//                 style: TextStyle(fontSize: 14),
//               ),
//               SizedBox(width: 6),
//               Text('Show more', style: TextStyle(color: Colors.blue)),
//             ],
//           ),

//           const SizedBox(height: 24),
//           _sectionTitle('Other Info'),
//           _infoRow(Icons.mail_outline, 'Email Opt Out: --'),

//           const SizedBox(height: 24),
//           _buildFooterNote(),
//         ],
//       ),
//     );
//   }

//   Widget _sectionTitle(String title) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8.0),
//       child: Text(
//         title,
//         style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//       ),
//     );
//   }

//   Widget _infoRow(IconData icon, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Row(
//         children: [
//           Icon(icon, size: 18, color: Colors.black87),
//           const SizedBox(width: 8),
//           Flexible(child: Text(value, style: const TextStyle(fontSize: 14))),
//         ],
//       ),
//     );
//   }

//   Widget _addressRow() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         children: [
//           const Icon(Icons.location_on, size: 18),
//           const SizedBox(width: 8),
//           Expanded(
//             child: Text(
//               '8 W Cerritos Ave #54, Bridgeport, New Jersey',
//               style: const TextStyle(
//                 fontSize: 14,
//                 color: Colors.blue,
//                 decoration: TextDecoration.underline,
//               ),
//             ),
//           ),
//           const Icon(Icons.link, size: 16, color: Colors.grey),
//         ],
//       ),
//     );
//   }

//   Widget _buildFooterNote() {
//     return Row(
//       children: [
//         const CircleAvatar(
//           radius: 12,
//           backgroundImage: NetworkImage('https://i.imgur.com/BoN9kdC.png'),
//         ),
//         const SizedBox(width: 8),
//         const Text(
//           'Last Modified on  Yesterday, 08:03 PM',
//           style: TextStyle(fontSize: 12, color: Colors.grey),
//         ),
//       ],
//     );
//   }

//   Widget _buildNotesTab() {
//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           TextField(
//             decoration: InputDecoration(
//               hintText: "What's this note about?",
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               contentPadding: const EdgeInsets.symmetric(
//                 horizontal: 12,
//                 vertical: 10,
//               ),
//             ),
//           ),
//           const SizedBox(height: 16),
//           Row(
//             children: const [
//               CircleAvatar(
//                 radius: 18,
//                 backgroundImage: NetworkImage(
//                   'https://i.imgur.com/BoN9kdC.png',
//                 ),
//               ),
//               SizedBox(width: 8),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "owais Patel • Yesterday, 08:03 PM",
//                     style: TextStyle(fontSize: 12, color: Colors.grey),
//                   ),
//                   SizedBox(height: 4),
//                   Text(
//                     "Here is a sample note for you!",
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           const SizedBox(height: 8),
//           const Padding(
//             padding: EdgeInsets.only(left: 42),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "\u2731 Notes are a great way to capture key information about your Contact/Deal internally.",
//                 ),
//                 Text(
//                   "\u2731 Type \"@\" to mention fellow users in your organization and start a discussion right from a note.",
//                 ),
//                 SizedBox(height: 6),
//                 Text("Pipeline Record", style: TextStyle(color: Colors.grey)),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _iconCircle(IconData icon, {VoidCallback? onTap}) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(20),
//       child: Container(
//         width: 36,
//         height: 36,
//         decoration: BoxDecoration(
//           color: Colors.grey.shade200,
//           shape: BoxShape.circle,
//         ),
//         child: Icon(icon, size: 18, color: Colors.grey.shade800),
//       ),
//     );
//   }

//   Widget _buildHeaderControls(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ElevatedButton.icon(
//             onPressed: () {
//               showGeneralDialog(
//                 context: context,
//                 barrierDismissible: true,
//                 barrierLabel: "Follow Up",
//                 transitionDuration: const Duration(milliseconds: 300),
//                 pageBuilder: (context, animation, secondaryAnimation) {
//                   return Align(
//                     alignment: Alignment.centerRight,
//                     child: SizedBox(
//                       width: MediaQuery.of(context).size.width * 0.4,
//                       child: AddContactDrawer(),
//                     ),
//                   );
//                 },
//                 transitionBuilder: (
//                   context,
//                   animation,
//                   secondaryAnimation,
//                   child,
//                 ) {
//                   final slideAnimation = Tween<Offset>(
//                     begin: const Offset(1, 0),
//                     end: Offset.zero,
//                   ).animate(animation);

//                   return SlideTransition(
//                     position: slideAnimation,
//                     child: child,
//                   );
//                 },
//               );
//             },
//             icon: const Icon(Icons.add, color: Colors.white),
//             label: const Text(
//               'Follow Up',
//               style: TextStyle(color: Colors.white),
//             ),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: AppCustomTheme.bluePrimary,
//             ),
//           ),

//           const SizedBox(width: 12),

//           SizedBox(
//             width: 200,
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search',
//                 prefixIcon: const Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 isDense: true,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class _FollowUpScreenState extends State<FollowUpScreen>
    with TickerProviderStateMixin {
  // with SingleTickerProviderStateMixin {
  bool isPanelOpen = false;
  String selectedContactName = '';
  String? selectedFollowUp;
  late TabController _mainTabController;
  late TabController _panelTabController;

  Widget _buildHeaderControls(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              showGeneralDialog(
                context: context,
                barrierDismissible: true,
                barrierLabel: "Follow Up",
                transitionDuration: const Duration(milliseconds: 300),
                pageBuilder: (context, animation, secondaryAnimation) {
                  return Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Addfollowup(),
                    ),
                  );
                },
                transitionBuilder: (
                  context,
                  animation,
                  secondaryAnimation,
                  child,
                ) {
                  final slideAnimation = Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(animation);

                  return SlideTransition(
                    position: slideAnimation,
                    child: child,
                  );
                },
              );
            },
            icon: const Icon(Icons.add, color: Colors.white),
            label: const Text(
              'Follow Up',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppCustomTheme.bluePrimary,
            ),
          ),

          const SizedBox(width: 12),

          SizedBox(
            width: 200,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconCircle(IconData icon, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 18, color: Colors.grey.shade800),
      ),
    );
  }

  void openPanel(String contactName) {
    if (mounted) {
      setState(() {
        selectedContactName = contactName;
        isPanelOpen = true;
      });
    }
  }

  void closePanel() {
    if (mounted) {
      setState(() {
        isPanelOpen = false;
        selectedContactName = '';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _mainTabController = TabController(length: 3, vsync: this);
    _panelTabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _mainTabController.dispose();
    _panelTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              const Sidebar(),
              const LeadsSectionSidebar(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 64),
                  child: Column(
                    children: [
                      _buildHeaderControls(context),
                      const Divider(height: 1),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 400),
                              child: TabBar(
                                controller: _mainTabController,
                                indicatorColor: AppCustomTheme.bluePrimary,
                                labelColor: Colors.black,
                                labelStyle: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                                isScrollable: true,
                                tabs: const [
                                  Tab(text: "Overdue"),
                                  Tab(text: "Open"),
                                  Tab(text: "Closed"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _mainTabController,
                          children: [
                            FollowUpTable(
                              onFollowUpTap: (contactName) {
                                setState(() {
                                  selectedFollowUp = contactName;
                                  isPanelOpen = true;
                                });
                              },
                              // onFollowUpTap: openPanel, // pass openPanel here
                              isPanelOpen: isPanelOpen,
                              statusFilter: 'Overdue',
                            ),
                            FollowUpTable(
                              onFollowUpTap: (contactName) {
                                setState(() {
                                  selectedFollowUp = contactName;
                                  isPanelOpen = true;
                                });
                              },
                              //onFollowUpTap: openPanel, // pass openPanel here
                              isPanelOpen: isPanelOpen,
                              statusFilter: 'Open',
                            ),
                            FollowUpTable(
                              onFollowUpTap: (contactName) {
                                setState(() {
                                  selectedFollowUp = contactName;
                                  isPanelOpen = true;
                                });
                              },
                              // onFollowUpTap: openPanel, // pass openPanel here
                              isPanelOpen: isPanelOpen,
                              statusFilter: 'Closed',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Positioned(top: 0, left: 0, right: 0, child: TopBar()),
          if (isPanelOpen)
            Align(
              alignment: Alignment.centerRight,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 500,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(-2, 0),
                    ),
                  ],
                ),
                child: SlideInFollowUpDetailsPanel(
                  contactName: selectedFollowUp!,
                  onClose: () {
                    setState(() {
                      isPanelOpen = false;
                    });
                  },
                ),
                //child: _buildDetailsPanel(),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDetailsPanel() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.blue.shade100,
                    child: Text(
                      selectedContactName.isNotEmpty
                          ? selectedContactName[0] +
                              selectedContactName.split(" ").last[0]
                          : '',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.go(
                            '/contacts/${Uri.encodeComponent(selectedContactName)}',
                          );
                        },
                        child: Text(
                          selectedContactName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Row(
                        children: const [
                          Text(
                            "Zylker Corp",
                            style: TextStyle(color: Colors.blue),
                          ),
                          SizedBox(width: 6),
                          Icon(
                            Icons.emoji_events,
                            color: Colors.orange,
                            size: 16,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "owais Patel",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  ContactActionsMenu(),
                  const SizedBox(width: 8),
                  _iconCircle(Icons.open_in_new),
                  const SizedBox(width: 8),
                  _iconCircle(Icons.close, onTap: closePanel),
                ],
              ),
            ],
          ),
        ),
        TabBar(
          controller: _panelTabController,
          indicatorColor: AppCustomTheme.bluePrimary,
          labelColor: Colors.black,
          labelStyle: const TextStyle(fontWeight: FontWeight.w600),
          tabs: const [Tab(text: "Information"), Tab(text: "Notes")],
        ),
        Expanded(
          child: TabBarView(
            controller: _panelTabController,
            children: [_buildInformationTab(), _buildNotesTab()],
          ),
        ),
      ],
    );
  }

  Widget _buildInformationTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle('Basic Info'),
          _infoRow(Icons.email, 'support@bigin.com'),
          _infoRow(Icons.phone_android, '609-884-0686'),
          _infoRow(Icons.phone_in_talk_rounded, '--'),
          _infoRow(Icons.telegram, '--'),
          _addressRow(),

          const SizedBox(height: 24),
          _sectionTitle('Tags'),
          OutlinedButton.icon(
            icon: const Icon(Icons.add),
            label: const Text("Tag"),
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              foregroundColor: Colors.black54,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            ),
          ),

          const SizedBox(height: 24),
          _sectionTitle('Description'),
          const Text(
            'This is a sample Contact.',
            style: TextStyle(fontSize: 14),
          ),
          const Text(
            '✱ Quickly get started by creating a note ✍️ or an activity 🎯 for this Contact.',
            style: TextStyle(fontSize: 14),
          ),
          Row(
            children: const [
              Text(
                '✱ For any help write to us at supp …',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(width: 6),
              Text('Show more', style: TextStyle(color: Colors.blue)),
            ],
          ),

          const SizedBox(height: 24),
          _sectionTitle('Other Info'),
          _infoRow(Icons.mail_outline, 'Email Opt Out: --'),

          const SizedBox(height: 24),
          _buildFooterNote(),
        ],
      ),
    );
  }

  Widget _buildNotesTab() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "What's this note about?",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: const [
              CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(
                  'https://i.imgur.com/BoN9kdC.png',
                ),
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "owais Patel • Yesterday, 08:03 PM",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Here is a sample note for you!",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.only(left: 42),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\u2731 Notes are a great way to capture key information about your Contact/Deal internally.",
                ),
                Text(
                  "\u2731 Type \"@\" to mention fellow users in your organization and start a discussion right from a note.",
                ),
                SizedBox(height: 6),
                Text("Pipeline Record", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Widget _infoRow(IconData icon, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.black87),
          const SizedBox(width: 8),
          Flexible(child: Text(value, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }

  Widget _addressRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const Icon(Icons.location_on, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              '8 W Cerritos Ave #54, Bridgeport, New Jersey',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const Icon(Icons.link, size: 16, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildFooterNote() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 12,
          backgroundImage: NetworkImage('https://i.imgur.com/BoN9kdC.png'),
        ),
        const SizedBox(width: 8),
        const Text(
          'Last Modified on  Yesterday, 08:03 PM',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }

  // ... rest of your existing _buildInformationTab, _buildNotesTab, _iconCircle, _buildHeaderControls etc.
}

// class SlideInFollowUpDetailsPanel extends StatelessWidget {
//   final String contactName;
//   final VoidCallback onClose;

//   const SlideInFollowUpDetailsPanel({
//     required this.contactName,
//     required this.onClose,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       elevation: 4,
//       color: Colors.white,
//       child: Column(
//         children: [
//           ListTile(
//             title: Text('Follow-Up Details for $contactName'),
//             trailing: IconButton(icon: Icon(Icons.close), onPressed: onClose),
//           ),
//           const Divider(),
//           // ...more fields, details, tabs etc
//         ],
//       ),
//     );
//   }
// }
