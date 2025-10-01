// // import 'package:flutter/material.dart';
// // import 'package:sahibot_crm_web/widgets/leads_section_sidebar.dart';
// // import 'package:sahibot_crm_web/widgets/sidebar.dart';

// // class ActivityScreen extends StatefulWidget {
// //   const ActivityScreen({super.key});

// //   @override
// //   State<ActivityScreen> createState() => _ActivityScreenState();
// // }

// // class _ActivityScreenState extends State<ActivityScreen> {
// //   int selectedTabIndex = 0; // 0: Tasks, 1: Events, 2: Calls

// //   final List<String> tabs = ["Tasks", "Events", "Calls"];
// //   final List<int> tabCounts = [1, 0, 0];

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Stack(
// //         children: [
// //           Row(
// //             children: [
// //               Sidebar(),
// //               LeadsSectionSidebar(),
// //               Expanded(
// //                 child: Padding(
// //                   padding: const EdgeInsets.all(24),
// //                   //padding: const EdgeInsets.only(top: 64),
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       _buildTopTabs(),
// //                       const SizedBox(height: 20),
// //                       _buildActionBar(),
// //                       const SizedBox(height: 16),
// //                       _buildTableHeader(),
// //                       _buildTaskRow(), // Only 1 row for now
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //   Widget _buildTopTabs() {
// //     return Row(
// //       children: List.generate(tabs.length, (index) {
// //         final isSelected = index == selectedTabIndex;
// //         return Padding(
// //           padding: const EdgeInsets.only(right: 12),
// //           child: GestureDetector(
// //             onTap: () => setState(() => selectedTabIndex = index),
// //             child: Container(
// //               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
// //               decoration: BoxDecoration(
// //                 color: isSelected ? Colors.blue.shade50 : Colors.white,
// //                 border: Border.all(color: Colors.grey.shade300),
// //                 borderRadius: BorderRadius.circular(20),
// //               ),
// //               child: Row(
// //                 children: [
// //                   Text(tabs[index],
// //                       style: TextStyle(
// //                         fontWeight:
// //                             isSelected ? FontWeight.bold : FontWeight.normal,
// //                       )),
// //                   const SizedBox(width: 6),
// //                   CircleAvatar(
// //                     radius: 10,
// //                     backgroundColor: Colors.white,
// //                     child: Text(
// //                       '${tabCounts[index]}',
// //                       style: const TextStyle(fontSize: 12),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         );
// //       }),
// //     );
// //   }
// //   Widget _buildActionBar() {
// //     return Row(
// //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //       children: [
// //         Row(
// //           children: const [
// //             Text("All Tasks",
// //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// //             Icon(Icons.arrow_drop_down),
// //           ],
// //         ),
// //         Row(
// //           children: [
// //             _buildActionButton("+ Task"),
// //             const SizedBox(width: 8),
// //             _buildActionButton("+ Event"),
// //             const SizedBox(width: 8),
// //             _buildActionButton("+ Call"),
// //           ],
// //         ),
// //       ],
// //     );
// //   }

// //   Widget _buildActionButton(String label) {
// //     return OutlinedButton(
// //       onPressed: () {},
// //       child: Text(label),
// //     );
// //   }
// //   Widget _buildTableHeader() {
// //     return Container(
// //       padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
// //       color: Colors.grey[200],
// //       child: Row(
// //         children: const [
// //           Expanded(flex: 4, child: Text("Task Name")),
// //           Expanded(flex: 2, child: Text("Due Date")),
// //           Expanded(flex: 2, child: Text("Status")),
// //           Expanded(flex: 3, child: Text("Task Owner")),
// //         ],
// //       ),
// //     );
// //   }
// //   Widget _buildTaskRow() {
// //     return Container(
// //       padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
// //       decoration: BoxDecoration(
// //         border: Border(
// //           bottom: BorderSide(color: Colors.grey.shade300),
// //         ),
// //       ),
// //       child: Row(
// //         children: [
// //           Expanded(
// //             flex: 4,
// //             child: Text(
// //               "Prepare a presentation for the demo",
// //               style: const TextStyle(fontWeight: FontWeight.bold),
// //             ),
// //           ),
// //           const Expanded(flex: 2, child: Text("Jul 17, 2025")),
// //           const Expanded(flex: 2, child: Text("Not Started")),
// //           Expanded(
// //             flex: 3,
// //             child: Row(
// //               children: const [
// //                 CircleAvatar(
// //                   backgroundImage: AssetImage('assets/owais.png'),
// //                   radius: 12,
// //                 ),
// //                 SizedBox(width: 8),
// //                 Text("owais Patel"),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';
// // import 'package:sahibot_crm_web/widgets/CallsTable.dart';
// // import 'package:sahibot_crm_web/widgets/TasksTable.dart';
// // import 'package:sahibot_crm_web/widgets/eventTab.dart';
// // import 'package:sahibot_crm_web/widgets/leads_section_sidebar.dart';
// // import 'package:sahibot_crm_web/widgets/sidebar.dart';

// // class ActivityPage extends StatefulWidget {
// //   const ActivityPage({super.key});

// //   @override
// //   State<ActivityPage> createState() => _ActivityPageState();
// // }

// // class _ActivityPageState extends State<ActivityPage>
// //     with SingleTickerProviderStateMixin {
// //   late TabController _tabController;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _tabController = TabController(length: 3, vsync: this);
// //   }

// //   @override
// //   void dispose() {
// //     _tabController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: const Color(0xFFF9FAFB),
// //       body: Stack(
// //         children: [
// //           Row(
// //             children: [
// //               Sidebar(),
// //               LeadsSectionSidebar(),
// //               Expanded(
// //                 child: Padding(
// //                   padding: const EdgeInsets.all(16.0),
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       const SizedBox(height: 16),
// //                       Padding(
// //                         padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //                         child: TabBar(
// //                           controller: _tabController,
// //                           labelColor: Colors.black,
// //                           unselectedLabelColor: Colors.black54,
// //                           labelStyle: const TextStyle(
// //                             fontWeight: FontWeight.w600,
// //                           ),
// //                           indicator: BoxDecoration(
// //                             color: Color(0xFFD6EBFF),
// //                             borderRadius: BorderRadius.circular(24),
// //                           ),
// //                           indicatorPadding: const EdgeInsets.symmetric(
// //                             vertical: 8.0,
// //                           ),
// //                           tabs: const [
// //                             Tab(text: 'Tasks'),
// //                             Tab(text: 'Events'),
// //                             Tab(text: 'Calls'),
// //                           ],
// //                         ),
// //                       ),
// //                       const SizedBox(height: 8),
// //                       Expanded(
// //                         child: TabBarView(
// //                           controller: _tabController,
// //                           children: const [
// //                             TaskTabView(),
// //                             EventsTable(),
// //                             CallsTable(),
// //                           ],
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:sahibot_crm_web/config/app_theme.dart';
// import 'package:sahibot_crm_web/widgets/addTask.dart';
// import 'package:sahibot_crm_web/widgets/leads_section_sidebar.dart';
// import 'package:sahibot_crm_web/widgets/sidebar.dart';
// import 'package:sahibot_crm_web/widgets/topbar.dart';

// class ActivitiesScreen extends StatefulWidget {
//   const ActivitiesScreen({super.key});

//   @override
//   State<ActivitiesScreen> createState() => _ActivitiesScreenState();
// }

// class _ActivitiesScreenState extends State<ActivitiesScreen>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
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
//               Sidebar(),
//               const LeadsSectionSidebar(),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       const TopBar(),
//                       Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 // TabBar(
//                                 //   isScrollable: true,
//                                 //   tabAlignment: TabAlignment.start,
//                                 //   controller: _tabController,
//                                 //   labelColor: Colors.black,
//                                 //   unselectedLabelColor: Colors.black,
//                                 //   indicator: BoxDecoration(
//                                 //     color: AppCustomTheme.bluePrimary,
//                                 //     borderRadius: BorderRadius.circular(24),
//                                 //   ),
//                                 //   indicatorColor: Colors.transparent,
//                                 //   tabs: const [
//                                 //     Tab(text: 'Tasks'),
//                                 //     Tab(text: 'Events'),
//                                 //     Tab(text: 'Calls'),
//                                 //   ],
//                                 // ),
//                                 Container(
//                                   padding: const EdgeInsets.symmetric(
//                                     horizontal: 20,
//                                   ),

//                                   // padding: const EdgeInsets.symmetric(
//                                   //   horizontal: 20,
//                                   // ),
//                                   // padding: EdgeInsets.only(
//                                   //   top: 150,
//                                   //   left: 20,
//                                   //   right: 20,
//                                   //   bottom: 100
//                                   // ),
//                                   child: TabBar(
//                                     dividerColor: Colors.transparent,
//                                     overlayColor: MaterialStateProperty.all(
//                                       Colors.transparent,
//                                     ),
//                                     labelPadding: EdgeInsets.symmetric(
//                                       horizontal: 10,
//                                     ),
//                                     controller: _tabController,
//                                     tabAlignment: TabAlignment.start,
//                                     isScrollable: true,
//                                     indicator: BoxDecoration(
//                                       color:
//                                           Colors.blue, // Highlight selected tab
//                                       borderRadius: BorderRadius.circular(12),
//                                     ),
//                                     indicatorSize: TabBarIndicatorSize.label,
//                                     indicatorColor: Colors.white,
//                                     labelColor: Colors.black,
//                                     unselectedLabelColor: Colors.black54,
//                                     tabs: const [
//                                       Tab(
//                                         child: Row(
//                                           children: [
//                                             SizedBox(width: 10),
//                                             Text(
//                                               'Tasks',
//                                               style: TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                             SizedBox(width: 10),
//                                           ],
//                                         ),
//                                       ),
//                                       Tab(
//                                         child: Row(
//                                           children: [
//                                             SizedBox(width: 10),
//                                             Text(
//                                               'Events',
//                                               style: TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                             SizedBox(width: 10),
//                                           ],
//                                         ),
//                                       ),
//                                       Tab(
//                                         child: Row(
//                                           children: [
//                                             SizedBox(width: 10),
//                                             Text(
//                                               'Calls',
//                                               style: TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                             SizedBox(width: 10),
//                                           ],
//                                         ),
//                                       ),
//                                       // Tab(text: ''),
//                                       // Tab(text: ''),
//                                     ],
//                                   ),
//                                 ),
//                                 // Container(
//                                 //   padding: EdgeInsets.symmetric(horizontal: 20),
//                                 //   decoration: BoxDecoration(
//                                 //     color: Colors.grey[100],
//                                 //     border: Border(),
//                                 //     borderRadius: BorderRadius.circular(24),
//                                 //   ),
//                                 //   child: TabBar(
//                                 //     isScrollable: true,
//                                 //     tabAlignment: TabAlignment.start,
//                                 //     controller: _tabController,
//                                 //     labelColor: Colors.black,
//                                 //     unselectedLabelColor: Colors.black,
//                                 //     // padding: const EdgeInsets.symmetric(
//                                 //     //   horizontal: 20,
//                                 //     // ),
//                                 //     // labelPadding: const EdgeInsets.symmetric(
//                                 //     //   horizontal: 25,
//                                 //     // ),
//                                 //     indicator: BoxDecoration(
//                                 //       color: AppCustomTheme.bluePrimary,
//                                 //       borderRadius: BorderRadius.circular(24),
//                                 //     ),
//                                 //     indicatorColor: Colors.transparent,
//                                 //     tabs: const [
//                                 //       Tab(text: 'Tasks'),
//                                 //       Tab(text: 'Events'),
//                                 //       Tab(text: 'Calls'),
//                                 //     ],
//                                 //   ),
//                                 // ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     ElevatedButton.icon(
//                                       onPressed: () {
//                                         showGeneralDialog(
//                                           context: context,
//                                           barrierDismissible: true,
//                                           barrierLabel: "Task",
//                                           transitionDuration: const Duration(
//                                             milliseconds: 300,
//                                           ),
//                                           pageBuilder: (
//                                             context,
//                                             animation,
//                                             secondaryAnimation,
//                                           ) {
//                                             return Align(
//                                               alignment: Alignment.centerRight,
//                                               child: SizedBox(
//                                                 width:
//                                                     MediaQuery.of(
//                                                       context,
//                                                     ).size.width *
//                                                     0.4,
//                                                 child: AddTask(),
//                                               ),
//                                             );
//                                           },
//                                           transitionBuilder: (
//                                             context,
//                                             animation,
//                                             secondaryAnimation,
//                                             child,
//                                           ) {
//                                             final slideAnimation =
//                                                 Tween<Offset>(
//                                                   begin: const Offset(1, 0),
//                                                   end: Offset.zero,
//                                                 ).animate(animation);

//                                             return SlideTransition(
//                                               position: slideAnimation,
//                                               child: child,
//                                             );
//                                           },
//                                         );
//                                       },
//                                       icon: const Icon(
//                                         Icons.add,
//                                         color: Colors.white,
//                                       ),
//                                       label: const Text(
//                                         'Task',
//                                         style: TextStyle(color: Colors.white),
//                                       ),
//                                       style: ElevatedButton.styleFrom(
//                                         backgroundColor:
//                                             AppCustomTheme.bluePrimary,
//                                       ),
//                                     ),
//                                     // _buildActionButton('+ Task'),
//                                     const SizedBox(width: 8),
//                                     ElevatedButton.icon(
//                                       onPressed: () {
//                                         showGeneralDialog(
//                                           context: context,
//                                           barrierDismissible: true,
//                                           barrierLabel: "Event",
//                                           transitionDuration: const Duration(
//                                             milliseconds: 300,
//                                           ),
//                                           pageBuilder: (
//                                             context,
//                                             animation,
//                                             secondaryAnimation,
//                                           ) {
//                                             return Align(
//                                               alignment: Alignment.centerRight,
//                                               child: SizedBox(
//                                                 width:
//                                                     MediaQuery.of(
//                                                       context,
//                                                     ).size.width *
//                                                     0.4,
//                                                 child: AddTask(),
//                                               ),
//                                             );
//                                           },
//                                           transitionBuilder: (
//                                             context,
//                                             animation,
//                                             secondaryAnimation,
//                                             child,
//                                           ) {
//                                             final slideAnimation =
//                                                 Tween<Offset>(
//                                                   begin: const Offset(1, 0),
//                                                   end: Offset.zero,
//                                                 ).animate(animation);

//                                             return SlideTransition(
//                                               position: slideAnimation,
//                                               child: child,
//                                             );
//                                           },
//                                         );
//                                       },
//                                       icon: const Icon(
//                                         Icons.add,
//                                         color: Colors.white,
//                                       ),
//                                       label: const Text(
//                                         'Event',
//                                         style: TextStyle(color: Colors.white),
//                                       ),
//                                       style: ElevatedButton.styleFrom(
//                                         backgroundColor:
//                                             AppCustomTheme.bluePrimary,
//                                       ),
//                                     ),
//                                     //_buildActionButton('+ Event'),
//                                     const SizedBox(width: 8),
//                                     ElevatedButton.icon(
//                                       onPressed: () {
//                                         showGeneralDialog(
//                                           context: context,
//                                           barrierDismissible: true,
//                                           barrierLabel: "Call",
//                                           transitionDuration: const Duration(
//                                             milliseconds: 300,
//                                           ),
//                                           pageBuilder: (
//                                             context,
//                                             animation,
//                                             secondaryAnimation,
//                                           ) {
//                                             return Align(
//                                               alignment: Alignment.centerRight,
//                                               child: SizedBox(
//                                                 width:
//                                                     MediaQuery.of(
//                                                       context,
//                                                     ).size.width *
//                                                     0.4,
//                                                 child: AddTask(),
//                                               ),
//                                             );
//                                           },
//                                           transitionBuilder: (
//                                             context,
//                                             animation,
//                                             secondaryAnimation,
//                                             child,
//                                           ) {
//                                             final slideAnimation =
//                                                 Tween<Offset>(
//                                                   begin: const Offset(1, 0),
//                                                   end: Offset.zero,
//                                                 ).animate(animation);

//                                             return SlideTransition(
//                                               position: slideAnimation,
//                                               child: child,
//                                             );
//                                           },
//                                         );
//                                       },
//                                       icon: const Icon(
//                                         Icons.add,
//                                         color: Colors.white,
//                                       ),
//                                       label: const Text(
//                                         'Call',
//                                         style: TextStyle(color: Colors.white),
//                                       ),
//                                       style: ElevatedButton.styleFrom(
//                                         backgroundColor:
//                                             AppCustomTheme.bluePrimary,
//                                       ),
//                                     ),
//                                     //_buildActionButton('+ Call'),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 16),
//                             const Text(
//                               'All Activities',
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                             const SizedBox(height: 16),
//                             SizedBox(
//                               height: MediaQuery.of(context).size.height - 160,
//                               child: TabBarView(
//                                 controller: _tabController,
//                                 children: const [
//                                   TasksTabView(),
//                                   EventsTabView(),
//                                   CallsTabView(),
//                                 ],
//                               ),
//                             ),
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
//         ],
//       ),
//     );
//   }
// }

// class TasksTabView extends StatelessWidget {
//   const TasksTabView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return _buildTable(
//       headers: const ['Task Name', 'Due Date', 'Status', 'Task Owner'],
//       rowData: const [
//         [
//           'Prepare a presentation for the demo',
//           'Jul 17, 2025',
//           'Not Started',
//           'owais Patel',
//         ],
//       ],
//     );
//   }
// }

// class EventsTabView extends StatelessWidget {
//   const EventsTabView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return _buildTable(
//       headers: const ['Title', 'From', 'To', 'Host'],
//       rowData: const [],
//     );
//   }
// }

// class CallsTabView extends StatelessWidget {
//   const CallsTabView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return _buildTable(
//       headers: const [
//         'To/From',
//         'Call Type',
//         'Call Start Time',
//         'Modified Time',
//         'Call Owner',
//         'Call Duration',
//       ],
//       rowData: const [],
//     );
//   }
// }

// Widget _buildTable({
//   required List<String> headers,
//   required List<List<String>> rowData,
// }) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       // const Text(
//       //   'All Activities',
//       //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//       // ),
//       // const SizedBox(height: 12),
//       // Row(
//       //   mainAxisAlignment: MainAxisAlignment.end,
//       //   children: [
//       //     _buildActionButton('+ Task'),
//       //     const SizedBox(width: 8),
//       //     _buildActionButton('+ Event'),
//       //     const SizedBox(width: 8),
//       //     _buildActionButton('+ Call'),
//       //   ],
//       // ),
//       const SizedBox(height: 12),
//       Table(
//         border: TableBorder.all(color: Colors.grey.shade300),
//         columnWidths: {
//           for (int i = 0; i < headers.length; i++) i: const FlexColumnWidth(),
//         },
//         children: [
//           TableRow(
//             decoration: const BoxDecoration(color: Color(0xFFF9FAFB)),
//             children:
//                 headers
//                     .map(
//                       (h) => Padding(
//                         padding: const EdgeInsets.all(12.0),
//                         child: Text(
//                           h,
//                           style: const TextStyle(fontWeight: FontWeight.w600),
//                         ),
//                       ),
//                     )
//                     .toList(),
//           ),
//           if (rowData.isEmpty)
//             TableRow(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Text(
//                     'This record doesn\'t have any ${headers[0].toLowerCase() == 'title'
//                         ? 'events'
//                         : headers[0].toLowerCase() == 'to/from'
//                         ? 'calls'
//                         : 'tasks'}.',
//                     style: const TextStyle(color: Colors.grey),
//                   ),
//                 ),
//                 for (int i = 1; i < headers.length; i++) const SizedBox(),
//               ],
//             )
//           else
//             ...rowData.map(
//               (row) => TableRow(
//                 children:
//                     row
//                         .map(
//                           (cell) => Padding(
//                             padding: const EdgeInsets.all(12.0),
//                             child: Text(cell),
//                           ),
//                         )
//                         .toList(),
//               ),
//             ),
//         ],
//       ),
//     ],
//   );
// }

// Widget _buildActionButton(String text) {
//   return OutlinedButton(
//     onPressed: () {},
//     style: OutlinedButton.styleFrom(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
//       side: const BorderSide(color: Colors.green),
//     ),
//     child: Text(text, style: const TextStyle(color: Colors.green)),
//   );
// }

import 'package:flutter/material.dart';
import 'package:sahibot_crm_web/config/app_theme.dart';
import 'package:sahibot_crm_web/widgets/addTask.dart';
import 'package:sahibot_crm_web/All%20Sidebars/leads_section_sidebar.dart';
import 'package:sahibot_crm_web/All%20Sidebars/sidebar.dart';
import 'package:sahibot_crm_web/widgets/topbar.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({super.key});

  @override
  State<ActivitiesScreen> createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              Sidebar(),
              LeadsSectionSidebar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const TopBar(),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),

                                  child: TabBar(
                                    dividerColor: Colors.transparent,
                                    overlayColor: MaterialStateProperty.all(
                                      Colors.transparent,
                                    ),
                                    labelPadding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    controller: _tabController,
                                    tabAlignment: TabAlignment.start,
                                    isScrollable: true,
                                    indicator: BoxDecoration(
                                      color:
                                          Colors.blue, // Highlight selected tab
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    indicatorSize: TabBarIndicatorSize.label,
                                    indicatorColor: Colors.white,
                                    labelColor: Colors.black,
                                    unselectedLabelColor: Colors.black54,
                                    tabs: const [
                                      Tab(
                                        child: Row(
                                          children: [
                                            SizedBox(width: 10),
                                            Text(
                                              'Tasks',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton.icon(
                                      onPressed: () {
                                        showGeneralDialog(
                                          context: context,
                                          barrierDismissible: true,
                                          barrierLabel: "Task",
                                          transitionDuration: const Duration(
                                            milliseconds: 300,
                                          ),
                                          pageBuilder: (
                                            context,
                                            animation,
                                            secondaryAnimation,
                                          ) {
                                            return Align(
                                              alignment: Alignment.centerRight,
                                              child: SizedBox(
                                                width:
                                                    MediaQuery.of(
                                                      context,
                                                    ).size.width *
                                                    0.4,
                                                child: AddTask(),
                                              ),
                                            );
                                          },
                                          transitionBuilder: (
                                            context,
                                            animation,
                                            secondaryAnimation,
                                            child,
                                          ) {
                                            final slideAnimation =
                                                Tween<Offset>(
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
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                      label: const Text(
                                        'Task',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            AppCustomTheme.bluePrimary,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'All Activities',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              height: MediaQuery.of(context).size.height - 160,
                              child: TabBarView(
                                controller: _tabController,
                                children: const [TasksTabView()],
                              ),
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
        ],
      ),
    );
  }
}

class TasksTabView extends StatelessWidget {
  const TasksTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildTable(
      headers: const ['Task Name', 'Due Date', 'Status', 'Task Owner'],
      rowData: const [
        [
          'Prepare a presentation for the demo',
          'Jul 17, 2025',
          'Not Started',
          'owais Patel',
        ],
      ],
    );
  }
}

class EventsTabView extends StatelessWidget {
  const EventsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildTable(
      headers: const ['Title', 'From', 'To', 'Host'],
      rowData: const [],
    );
  }
}

class CallsTabView extends StatelessWidget {
  const CallsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildTable(
      headers: const [
        'To/From',
        'Call Type',
        'Call Start Time',
        'Modified Time',
        'Call Owner',
        'Call Duration',
      ],
      rowData: const [],
    );
  }
}

Widget _buildTable({
  required List<String> headers,
  required List<List<String>> rowData,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 12),
      Table(
        border: TableBorder.all(color: Colors.grey.shade300),
        columnWidths: {
          for (int i = 0; i < headers.length; i++) i: const FlexColumnWidth(),
        },
        children: [
          TableRow(
            decoration: const BoxDecoration(color: Color(0xFFF9FAFB)),
            children:
                headers
                    .map(
                      (h) => Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          h,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                    .toList(),
          ),
          if (rowData.isEmpty)
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'This record doesn\'t have any ${headers[0].toLowerCase() == 'title'
                        ? 'events'
                        : headers[0].toLowerCase() == 'to/from'
                        ? 'calls'
                        : 'tasks'}.',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
                for (int i = 1; i < headers.length; i++) const SizedBox(),
              ],
            )
          else
            ...rowData.map(
              (row) => TableRow(
                children:
                    row
                        .map(
                          (cell) => Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(cell),
                          ),
                        )
                        .toList(),
              ),
            ),
        ],
      ),
    ],
  );
}

Widget _buildActionButton(String text) {
  return OutlinedButton(
    onPressed: () {},
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      side: const BorderSide(color: Colors.green),
    ),
    child: Text(text, style: const TextStyle(color: Colors.green)),
  );
}
