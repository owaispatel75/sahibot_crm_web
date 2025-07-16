// import 'package:flutter/material.dart';
// import 'package:sahibot_crm_web/config/app_theme.dart';
// import 'package:sahibot_crm_web/widgets/AddContactDrawer.dart';
// import 'package:sahibot_crm_web/widgets/add_contact_dialog.dart';
// import 'package:sahibot_crm_web/widgets/contact_table.dart';
// import 'package:sahibot_crm_web/widgets/leads_section_sidebar.dart';
// import '../../widgets/topbar.dart';
// import '../../widgets/sidebar.dart';

// class ContactScreen extends StatefulWidget {
//   const ContactScreen({super.key});

//   @override
//   State<ContactScreen> createState() => _ContactScreenState();
// }

// class _ContactScreenState extends State<ContactScreen> {
//   bool isPanelOpen = false;
//   String selectedContactName = '';

//   void openPanel(String contactName) {
//     setState(() {
//       selectedContactName = contactName;
//       isPanelOpen = true;
//     });
//   }

//   void closePanel() {
//     setState(() {
//       isPanelOpen = false;
//     });
//   }

//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: ScrollableState());
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
//                       Expanded(
//                         child: Stack(
//                           children: [
//                             ContactTable(
//                               isPanelOpen: isPanelOpen,
//                               onContactTap: (contactName) {
//                                 if (isPanelOpen) {
//                                   closePanel();
//                                 } else {
//                                   openPanel(contactName);
//                                 }
//                               },
//                               // onContactTap: isPanelOpen ? closePanel : openPanel,
//                               // isPanelOpen: isPanelOpen,
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

//           if (isPanelOpen)
//             Align(
//               alignment: Alignment.centerRight,
//               child: AnimatedContainer(
//                 duration: Duration(milliseconds: 300),
//                 width: 500,
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
//                   crossAxisAlignment: CrossAxisAlignment.start,
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
//                                   Text(
//                                     selectedContactName,
//                                     style: const TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16,
//                                       color: Colors.blue,
//                                     ),
//                                   ),
//                                   Row(
//                                     children: const [
//                                       Text(
//                                         "Zylker Corp",
//                                         style: TextStyle(
//                                           color: Colors.blue,
//                                           fontSize: 14,
//                                         ),
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
//                                         style: TextStyle(
//                                           color: Colors.grey,
//                                           fontSize: 14,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               _iconCircle(Icons.more_vert),
//                               const SizedBox(width: 8),
//                               _iconCircle(Icons.open_in_new),
//                               const SizedBox(width: 8),
//                               _iconCircle(Icons.close, onTap: closePanel),
//                             ],
//                           ),
//                           TabBar(
//                             controller: _tabController,
//                             indicatorColor: Colors.green,
//                             labelColor: Colors.black,
//                             labelStyle: TextStyle(fontWeight: FontWeight.w600),
//                             tabs: const [
//                               Tab(text: "Information"),
//                               Tab(text: "Notes"),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 500, // Adjust based on available space
//                             child: TabBarView(
//                               controller: _tabController,
//                               children: [
//                                 _buildNotesTab(),
//                                 _buildNotesTab(),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),

//                     // Padding(
//                     //   padding: const EdgeInsets.all(16),
//                     //   child: Row(
//                     //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //     children: [
//                     //       Text(
//                     //         selectedContactName,
//                     //         style: TextStyle(
//                     //           fontSize: 18,
//                     //           fontWeight: FontWeight.bold,
//                     //         ),
//                     //       ),
//                     //       IconButton(
//                     //         icon: Icon(Icons.close),
//                     //         onPressed: closePanel,
//                     //       ),
//                     //     ],
//                     //   ),
//                     // ),
//                     Divider(),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Email: support@bigin.com'),
//                           SizedBox(height: 8),
//                           Text('Phone: 609-884-0686'),
//                           SizedBox(height: 8),
//                           Text(
//                             'Address:\n8 W Cerritos Ave #54, Bridgeport, New Jersey',
//                           ),
//                           SizedBox(height: 16),
//                           Text('Tags: Sample Tag'),
//                           SizedBox(height: 16),
//                           Text('Description:'),
//                           Text(
//                             'This is a sample Contact.\n✱ Quickly get started by creating a note ✍️ or an activity 🎯 for this Contact.',
//                           ),
//                         ],
//                       ),
//                     ),
//                     Spacer(),
//                     Padding(
//                       padding: const EdgeInsets.all(16),
//                       child: Text(
//                         'Last Modified on Today, 08:03 PM',
//                         style: TextStyle(fontSize: 12, color: Colors.grey),
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
//             children: [
//               const CircleAvatar(
//                 radius: 18,
//                 backgroundImage: NetworkImage(
//                   'https://i.imgur.com/BoN9kdC.png',
//                 ), // Replace with actual image
//               ),
//               const SizedBox(width: 8),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
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
//                   "✱ Notes are a great way to capture key information about your Contact/Deal internally.",
//                 ),
//                 Text(
//                   "✱ Type \"@\" to mention fellow users in your organization and start a discussion right from a note.",
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
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//           child: Center(
//             child: Wrap(
//               alignment: WrapAlignment.center,
//               crossAxisAlignment: WrapCrossAlignment.center,
//               spacing: 12,
//               runSpacing: 12,
//               children: [
//                 SizedBox(
//                   width: 200,
//                   child: TextField(
//                     decoration: InputDecoration(
//                       hintText: 'Search',
//                       prefixIcon: Icon(Icons.search),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(8)),
//                       ),
//                       isDense: true,
//                     ),
//                   ),
//                 ),
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     showGeneralDialog(
//                       context: context,
//                       barrierDismissible: true,
//                       barrierLabel: "Add Contact",
//                       transitionDuration: const Duration(milliseconds: 300),
//                       pageBuilder: (context, animation, secondaryAnimation) {
//                         return Align(
//                           alignment: Alignment.centerRight,
//                           child: SizedBox(
//                             width: MediaQuery.of(context).size.width * 0.4,
//                             child: AddContactDrawer(),
//                           ),
//                         );
//                       },
//                       transitionBuilder: (
//                         context,
//                         animation,
//                         secondaryAnimation,
//                         child,
//                       ) {
//                         final slideAnimation = Tween<Offset>(
//                           begin: const Offset(1, 0),
//                           end: Offset.zero,
//                         ).animate(animation);

//                         return SlideTransition(
//                           position: slideAnimation,
//                           child: child,
//                         );
//                       },
//                     );
//                   },
//                   icon: const Icon(Icons.add, color: Colors.white),
//                   label: const Text(
//                     'Add Contacts',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: AppCustomTheme.bluePrimary,
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// const TextStyle _headerStyle = TextStyle(
//   fontWeight: FontWeight.bold,
//   color: Colors.black,
// );

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sahibot_crm_web/config/app_theme.dart';
import 'package:sahibot_crm_web/screens/not/contacts_screen%20copy.dart';
import 'package:sahibot_crm_web/widgets/AddContactDrawer.dart';
import 'package:sahibot_crm_web/widgets/contact_actions_menu.dart';
import 'package:sahibot_crm_web/widgets/contact_table.dart';
import 'package:sahibot_crm_web/widgets/leads_section_sidebar.dart';
import '../../widgets/topbar.dart';
import '../../widgets/sidebar.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen>
    with SingleTickerProviderStateMixin {
  
  String selectedContactName = '';
  

  bool isPanelOpen = false;

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
      });
    }
  }

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
              const Sidebar(),
              const LeadsSectionSidebar(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 64),
                  child: Column(
                    children: [
                      _buildHeaderControls(context),
                      const Divider(height: 1),
                      Expanded(
                        child: ContactTable(
                          isPanelOpen: isPanelOpen,
                          onContactTap: (contactName) {
                            if (isPanelOpen) {
                              closePanel();
                            } else {
                              openPanel(contactName);
                            }
                          },
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
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(-2, 0),
                    ),
                  ],
                ),
                child: Column(
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
                              // _iconCircle(Icons.more_vert, onTap: ContactActionsMenu()),
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
                      controller: _tabController,
                      indicatorColor: AppCustomTheme.bluePrimary,
                      labelColor: Colors.black,
                      labelStyle: const TextStyle(fontWeight: FontWeight.w600),
                      tabs: const [
                        Tab(text: "Information"),
                        Tab(text: "Notes"),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [_buildInformationTab(), _buildNotesTab()],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  // Widget _buildInformationTab() {
  //   return Padding(
  //     padding: const EdgeInsets.all(16),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: const [
  //         Text('Email: support@bigin.com'),
  //         SizedBox(height: 8),
  //         Text('Phone: 609-884-0686'),
  //         SizedBox(height: 8),
  //         Text('Address:\n8 W Cerritos Ave #54, Bridgeport, New Jersey'),
  //         SizedBox(height: 16),
  //         Text('Tags: Sample Tag'),
  //         SizedBox(height: 16),
  //         Text('Description:'),
  //         Text(
  //           'This is a sample Contact.\n\u2731 Quickly get started by creating a note \u270D\uFE0F or an activity \uD83C\uDFAF for this Contact.',
  //         ),
  //         Spacer(),
  //         Text(
  //           'Last Modified on Today, 08:03 PM',
  //           style: TextStyle(fontSize: 12, color: Colors.grey),
  //         ),
  //       ],
  //     ),
  //   );
  // }

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
              contentPadding: EdgeInsets.symmetric(
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

  Widget _buildHeaderControls(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 200,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                isDense: true,
              ),
            ),
          ),
          const SizedBox(width: 12),
          ElevatedButton.icon(
            onPressed: () {
              showGeneralDialog(
                context: context,
                barrierDismissible: true,
                barrierLabel: "Add Contact",
                transitionDuration: const Duration(milliseconds: 300),
                pageBuilder: (context, animation, secondaryAnimation) {
                  return Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: AddContactDrawer(),
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
              'Add Contacts',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppCustomTheme.bluePrimary,
            ),
          ),
        ],
      ),
    );
  }
}
