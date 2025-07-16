// lib/screens/products_screen.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sahibot_crm_web/config/app_theme.dart';
import '../widgets/topbar.dart';
import '../widgets/sidebar.dart';
import '../widgets/leads_section_sidebar.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

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
              const LeadsSectionSidebar(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 64),
                  child: Column(
                    children: [
                      // --- header controls row ---
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        child: Row(
                          children: [
                            // filter icon + dropdown
                            IconButton(
                              icon: const Icon(Icons.filter_list),
                              onPressed: () {},
                            ),
                            const SizedBox(width: 8),
                            DropdownButton<String>(
                              value: 'All Products',
                              items: const [
                                DropdownMenuItem(
                                  value: 'All Products',
                                  child: Text('All Products'),
                                ),
                                DropdownMenuItem(
                                  value: 'Active',
                                  child: Text('Active'),
                                ),
                                DropdownMenuItem(
                                  value: 'Inactive',
                                  child: Text('Inactive'),
                                ),
                              ],
                              onChanged: (v) {},
                            ),
                            const Spacer(),

                            // view toggle
                            IconButton(
                              icon: const Icon(Icons.grid_view_outlined),
                              onPressed: () {},
                            ),

                            const SizedBox(width: 8),

                            // + Product button with dropdown arrow
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppCustomTheme.bluePrimary,
                              ),
                              onPressed: () {},
                              child: Row(
                                children: const [
                                  Icon(Icons.add, size: 20),
                                  SizedBox(width: 4),
                                  Text('Product'),
                                  Icon(Icons.arrow_drop_down),
                                ],
                              ),
                            ),

                            const SizedBox(width: 8),
                            // three-dot menu
                            IconButton(
                              icon: const Icon(Icons.more_vert),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),

                      const Divider(height: 1),

                      // --- table ---
                      Expanded(
                        child: SingleChildScrollView(
                          child: DataTable(
                            headingRowColor: MaterialStateProperty.all(
                              AppCustomTheme.lightBlueBg,
                            ),
                            columns: const [
                              DataColumn(
                                label: Text(
                                  'Product Name',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Product Code',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Product Active',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Product Owner',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  '+ Create Field',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                            rows:
                                products.map((prod) {
                                  return DataRow(
                                    cells: [
                                      DataCell(Text(prod['name']!)),
                                      DataCell(Text(prod['code']!)),
                                      DataCell(Text(prod['active']!)),
                                      DataCell(
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 12,
                                              backgroundImage: NetworkImage(
                                                'https://i.imgur.com/BoN9kdC.png',
                                              ),
                                            ),
                                            const SizedBox(width: 6),
                                            Text(prod['owner']!),
                                          ],
                                        ),
                                      ),
                                      DataCell(
                                        TextButton(
                                          onPressed: () {},
                                          child: const Text('+ Create Field'),
                                        ),
                                      ),
                                    ],
                                  );
                                }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // TopBar sits above everything
          const Positioned(top: 0, left: 0, right: 0, child: TopBar()),
        ],
      ),
    );
  }
}
