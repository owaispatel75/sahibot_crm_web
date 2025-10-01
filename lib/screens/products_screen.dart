// lib/screens/products_screen.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sahibot_crm_web/config/app_theme.dart';
import 'package:sahibot_crm_web/widgets/addPartiesDrawer.dart';
import 'package:sahibot_crm_web/widgets/addProduct.dart';
import 'package:sahibot_crm_web/widgets/contact_actions_menu.dart';
import 'package:sahibot_crm_web/widgets/product_table.dart';
import '../widgets/topbar.dart';
import '../All Sidebars/sidebar.dart';
import '../All Sidebars/leads_section_sidebar.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen>
    with SingleTickerProviderStateMixin {
  bool isPanelOpen = false;
  String selectedContactName = '';

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
    // static list of products for demo
    final products = [
      {
        'name': 'sample',
        'code': 's',
        'active': 'Active',
        'owner': 'owais Patel',
      },
      // add more here...
    ];

    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              const Sidebar(),
              LeadsSectionSidebar(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 64),
                  child: Column(
                    children: [
                      // --- header controls row ---
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //     horizontal: 24,
                      //     vertical: 12,
                      //   ),
                      //   child: Row(
                      //     children: [
                      //       // filter icon + dropdown
                      //       IconButton(
                      //         icon: const Icon(Icons.filter_list),
                      //         onPressed: () {},
                      //       ),
                      //       const SizedBox(width: 8),
                      //       DropdownButton<String>(
                      //         value: 'All Products',
                      //         items: const [
                      //           DropdownMenuItem(
                      //             value: 'All Products',
                      //             child: Text('All Products'),
                      //           ),
                      //           DropdownMenuItem(
                      //             value: 'Active',
                      //             child: Text('Active'),
                      //           ),
                      //           DropdownMenuItem(
                      //             value: 'Inactive',
                      //             child: Text('Inactive'),
                      //           ),
                      //         ],
                      //         onChanged: (v) {},
                      //       ),
                      //       const Spacer(),

                      //       // view toggle
                      //       IconButton(
                      //         icon: const Icon(Icons.grid_view_outlined),
                      //         onPressed: () {},
                      //       ),

                      //       const SizedBox(width: 8),

                      //       // + Product button with dropdown arrow
                      //       ElevatedButton(
                      //         style: ElevatedButton.styleFrom(
                      //           backgroundColor: AppCustomTheme.bluePrimary,
                      //         ),
                      //         onPressed: () {},
                      //         child: Row(
                      //           children: const [
                      //             Icon(Icons.add, size: 20),
                      //             SizedBox(width: 4),
                      //             Text('Product'),
                      //             Icon(Icons.arrow_drop_down),
                      //           ],
                      //         ),
                      //       ),

                      //       const SizedBox(width: 8),
                      //       // three-dot menu
                      //       IconButton(
                      //         icon: const Icon(Icons.more_vert),
                      //         onPressed: () {},
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      _buildHeaderControls(context),

                      const Divider(height: 1),

                      Expanded(
                        child: productTable(
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

                      // --- table ---
                      // Expanded(
                      //   child: SingleChildScrollView(
                      //     child: DataTable(
                      //       headingRowColor: MaterialStateProperty.all(
                      //         AppCustomTheme.lightBlueBg,
                      //       ),
                      //       columns: const [
                      //         DataColumn(
                      //           label: Text(
                      //             'Product Name',
                      //             style: TextStyle(fontWeight: FontWeight.w600),
                      //           ),
                      //         ),
                      //         DataColumn(
                      //           label: Text(
                      //             'Product Code',
                      //             style: TextStyle(fontWeight: FontWeight.w600),
                      //           ),
                      //         ),
                      //         DataColumn(
                      //           label: Text(
                      //             'Product Active',
                      //             style: TextStyle(fontWeight: FontWeight.w600),
                      //           ),
                      //         ),
                      //         DataColumn(
                      //           label: Text(
                      //             'Product Owner',
                      //             style: TextStyle(fontWeight: FontWeight.w600),
                      //           ),
                      //         ),
                      //         // DataColumn(
                      //         //   label: Text(
                      //         //     '+ Create Field',
                      //         //     style: TextStyle(fontWeight: FontWeight.w600),
                      //         //   ),
                      //         // ),
                      //       ],
                      //       rows:
                      //           products.map((prod) {
                      //             return DataRow(
                      //               cells: [
                      //                 DataCell(Text(prod['name']!)),
                      //                 DataCell(Text(prod['code']!)),
                      //                 DataCell(Text(prod['active']!)),
                      //                 DataCell(
                      //                   Row(
                      //                     children: [
                      //                       CircleAvatar(
                      //                         radius: 12,
                      //                         backgroundImage: NetworkImage(
                      //                           'https://i.imgur.com/BoN9kdC.png',
                      //                         ),
                      //                       ),
                      //                       const SizedBox(width: 6),
                      //                       Text(prod['owner']!),
                      //                     ],
                      //                   ),
                      //                 ),
                      //                 // DataCell(
                      //                 //   TextButton(
                      //                 //     onPressed: () {},
                      //                 //     child: const Text('+ Create Field'),
                      //                 //   ),
                      //                 // ),
                      //               ],
                      //             );
                      //           }).toList(),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // TopBar sits above everything
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
                                        '/products/${Uri.encodeComponent(selectedContactName)}',
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
                      tabAlignment: TabAlignment.start,
                      isScrollable: true,
                      indicatorColor: AppCustomTheme.bluePrimary,
                      labelColor: Colors.black,
                      labelStyle: const TextStyle(fontWeight: FontWeight.w600),
                      tabs: const [
                        Tab(text: "Information"),
                        // Tab(text: "Notes"),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          _buildInformationTab(),
                          // , _buildNotesTab()
                        ],
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

  Widget _buildInformationTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle('Basic Info'),

          Row(children: [Text("Product Code : Small")]),
          SizedBox(height: 10),
          Row(children: [Text("Product Category : Hardware")]),
          SizedBox(height: 10),
          Row(children: [Text("Product Status : Active")]),
          SizedBox(height: 10),

          // _infoRow(Icons.email, 'support@bigin.com'),
          // _infoRow(Icons.phone_android, '609-884-0686'),
          // _infoRow(Icons.phone_in_talk_rounded, '--'),
          // _infoRow(Icons.telegram, '--'),
          // _addressRow(),
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

          // const SizedBox(height: 24),
          // _sectionTitle('Other Info'),
          // _infoRow(Icons.mail_outline, 'Email Opt Out: --'),
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
                barrierLabel: "Add Products",
                transitionDuration: const Duration(milliseconds: 300),
                pageBuilder: (context, animation, secondaryAnimation) {
                  return Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: AddProduct(),
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
              'Add Products',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppCustomTheme.bluePrimary,
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.filter_alt)),
        ],
      ),
    );
  }
}
