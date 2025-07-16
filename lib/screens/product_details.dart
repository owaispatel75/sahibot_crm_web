import 'package:flutter/material.dart';
import 'package:sahibot_crm_web/config/app_theme.dart';
import 'package:sahibot_crm_web/screens/activity_screen.dart';
import 'package:sahibot_crm_web/screens/activity_tab.dart';
import 'package:sahibot_crm_web/widgets/leads_section_sidebar.dart';
import 'package:sahibot_crm_web/widgets/sidebar.dart';
import 'package:sahibot_crm_web/widgets/topbar.dart';

class ProductDetailsPage extends StatelessWidget {
  final String productName;

  const ProductDetailsPage({super.key, required this.productName});

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
                child: Column(
                  children: [
                    const SizedBox(height: 64),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 32,
                            backgroundColor: Colors.blue.shade100,
                            child: Text(
                              productName.isNotEmpty ? productName[0] : '',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  productName,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: const [
                                    // Text(
                                    //   "Zylker Corp",
                                    //   style: TextStyle(color: Colors.blue),
                                    // ),
                                    // SizedBox(width: 15),
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
                          ),
                          Row(
                            children: [
                              // IconButton(
                              //   icon: const Icon(Icons.mail),
                              //   onPressed: () {},
                              // ),
                              IconButton(
                                icon: const Icon(Icons.edit),
                                tooltip: "Edit",
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const Icon(Icons.more_vert),
                                tooltip: "Options",
                                onPressed: () {},
                              ),
                              // IconButton(
                              //   icon: const Icon(Icons.close),
                              //   onPressed: () => Navigator.pop(context),
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    Expanded(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 400,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: ListView(
                                children: [
                                  // Text(
                                  //   "Stats",
                                  //   style: TextStyle(
                                  //     fontWeight: FontWeight.bold,
                                  //   ),
                                  // ),
                                  // Text("Open Pipeline Record  - 1"),
                                  // // Text("\u2022 Open Pipeline Record  • 1"),
                                  // SizedBox(height: 24),
                                  // Text(
                                  //   "Basic Info",
                                  //   style: TextStyle(
                                  //     fontWeight: FontWeight.bold,
                                  //   ),
                                  // ),
                                  // ListTile(
                                  //   dense: true,
                                  //   leading: Icon(Icons.email),
                                  //   title: Text("support@bigin.com"),
                                  // ),
                                  // ListTile(
                                  //   dense: true,
                                  //   leading: Icon(Icons.phone),
                                  //   title: Text("609-884-0686"),
                                  // ),
                                  // ListTile(
                                  //   dense: true,
                                  //   leading: Icon(Icons.phone_in_talk),
                                  //   title: Text("--"),
                                  // ),
                                  // ListTile(
                                  //   dense: true,
                                  //   leading: Icon(Icons.phone_android),
                                  //   title: Text("--"),
                                  // ),
                                  // ListTile(
                                  //   dense: true,
                                  //   leading: Icon(Icons.location_on),
                                  //   title: Text(
                                  //     "8 W Cerritos Ave #54, Bridgeport, New Jersey",
                                  //   ),
                                  // ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "Basic Info",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 12),
                                      Row(
                                        children: [
                                          Text("Product Code : Small"),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Text("Product Category : Hardware"),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Text("Product Status : Active"),
                                        ],
                                      ),
                                      // SizedBox(height: 10),
                                      // InfoRow(
                                      //   icon: Icons.email_outlined,
                                      //   text: 'support@bigin.com',
                                      // ),
                                      // InfoRow(
                                      //   icon: Icons.phone_android,
                                      //   text: '609-884-0686',
                                      // ),
                                      // InfoRow(
                                      //   icon: Icons.phone_callback_outlined,
                                      //   text: '--',
                                      // ),
                                      // InfoRow(
                                      //   icon: Icons.phone_in_talk_outlined,
                                      //   text: '--',
                                      // ),
                                      // InfoRow(
                                      //   icon: Icons.location_on_outlined,
                                      //   text:
                                      //       '8 W Cerritos Ave #54, Bridgeport, New Jersey',
                                      // ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Tags',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      InkWell(
                                        onTap: () {
                                          // Handle tag addition logic here
                                        },
                                        borderRadius: BorderRadius.circular(20),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 6,
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: AppCustomTheme.bluePrimary,
                                            ),
                                            color: Colors.grey.shade100,
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                          ),
                                          child: const Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                Icons.add,
                                                size: 18,
                                                color:
                                                    AppCustomTheme.bluePrimary,
                                              ),
                                              SizedBox(width: 6),
                                              Text(
                                                'Tag',
                                                style: TextStyle(
                                                  color:
                                                      AppCustomTheme
                                                          .bluePrimary,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // SizedBox(height: 16),
                                  // Text(
                                  //   "Tags",
                                  //   style: TextStyle(
                                  //     fontWeight: FontWeight.bold,
                                  //   ),
                                  // ),
                                  // OutlinedButton(
                                  //   onPressed: () {},
                                  //   child: Text('+ Tag'),
                                  // ),
                                  SizedBox(height: 16),
                                  Text(
                                    "Description",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "This is a sample Contact.\n✱ Quickly get started by creating a note ✍️ or an activity 🎯 for this Contact.\n✱ For any help write to us at support@bigin.com",
                                  ),
                                  SizedBox(height: 16),
                                  // Text(
                                  //   "Other Info",
                                  //   style: TextStyle(
                                  //     fontWeight: FontWeight.bold,
                                  //   ),
                                  // ),
                                  // Text("Email Opt Out  --"),
                                  // SizedBox(height: 16),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 12,
                                        backgroundImage: NetworkImage(
                                          'https://i.imgur.com/BoN9kdC.png',
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        "Last Modified on  Yesterday, 08:03 PM",
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const VerticalDivider(width: 1),
                          Expanded(
                            child: DefaultTabController(
                              length: 5,
                              child: Column(
                                children: const [
                                  TabBar(
                                    tabAlignment: TabAlignment.start,
                                    isScrollable: true,
                                    // labelPadding: EdgeInsets.symmetric(
                                    //   horizontal: 12,
                                    // ),
                                    tabs: [
                                      // Tab(text: 'Timeline'),
                                      // Tab(text: 'Notes'),
                                      // Tab(text: 'Activities'),
                                      Tab(text: 'Pipelines'),
                                      Tab(text: 'Files'),
                                      //Tab(text: 'Social'),

                                      // Add 'Files' tab here if needed
                                    ],
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      children: [
                                        // Center(
                                        //   child: Text(
                                        //     "This record doesn't have any history.",
                                        //   ),
                                        // ),

                                        // Align(
                                        //   alignment: Alignment.center,
                                        //   child: Padding(
                                        //     padding:
                                        //         EdgeInsets
                                        //             .zero, // no left padding
                                        //     child: Text(
                                        //       "This record doesn't have any history.",
                                        //     ),
                                        //   ),
                                        // ),
                                        // Center(child: Text("Notes View")),
                                        // ActivityTab(),
                                        //Center(child: Text("Activities View")),
                                        Center(child: Text("Pipelines View")),
                                        Center(child: Text("Files View")),

                                        //Center(child: Text("Social View")),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.grey.shade700, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
