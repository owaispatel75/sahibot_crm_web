import 'package:flutter/material.dart';
import 'package:sahibot_crm_web/config/app_theme.dart';
import 'package:sahibot_crm_web/widgets/add_contact_dialog.dart';
import 'package:sahibot_crm_web/widgets/contact_actions_menu.dart';
import 'package:sahibot_crm_web/widgets/leads_section_sidebar.dart';
import '../../../widgets/topbar.dart';
import '../../../widgets/sidebar.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

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
                  padding: const EdgeInsets.only(
                    top: 64,
                  ), // Account for fixed TopBar
                  child: Column(
                    children: [
                      _buildHeaderControls(context),
                      const Divider(height: 1),
                      _buildTableHeader(),
                      _buildTableRow(), // You can map this over your contact list
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

  Widget _buildHeaderControls(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 12,
              runSpacing: 12,
              children: [
                SizedBox(
                  width: 200,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      isDense: true,
                    ),
                  ),
                ),
                //const SizedBox(width: 8),
                ElevatedButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => const AddContactDialog(),
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
                const SizedBox(width: 12),
                // OutlinedButton(onPressed: () {}, child: const Text('Export')),
                // const SizedBox(width: 12),
                // OutlinedButton.icon(
                //   onPressed: () {},
                //   icon: const Icon(Icons.filter_list),
                //   label: const Text('Filter'),
                // ),
                // const SizedBox(width: 12),
                // DropdownButton<String>(
                //   value: 'Created Sequence',
                //   items: const [
                //     DropdownMenuItem(
                //       value: 'Created Sequence',
                //       child: Text('Created Sequence'),
                //     ),
                //     DropdownMenuItem(value: 'A-Z', child: Text('A-Z')),
                //     DropdownMenuItem(value: 'Z-A', child: Text('Z-A')),
                //   ],
                //   onChanged: (value) {},
                // ),
                // const SizedBox(width: 8),
                // const Icon(Icons.swap_vert),
              ],
            ),
          ),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            border: Border.all(color: AppCustomTheme.lightgrayBg),
            borderRadius: BorderRadius.circular(6),
            //color: Colors.white,
          ),
          child: const Text(
            '1 out of 1',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w900,
              color: Colors.black54,
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildTableHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      color: AppCustomTheme.bluePrimary,
      child: Row(
        children: const [
          Expanded(flex: 2, child: Text('Created At', style: _headerStyle)),
          Expanded(flex: 3, child: Text('Contact Name', style: _headerStyle)),
          Expanded(flex: 3, child: Text('Company Name', style: _headerStyle)),
          Expanded(
            flex: 2,
            child: Text('Upcoming Follow-up', style: _headerStyle),
          ),
          Expanded(flex: 2, child: Text('Last Follow-up', style: _headerStyle)),
          Expanded(flex: 2, child: Text('Tags', style: _headerStyle)),
          Expanded(flex: 1, child: Text('Actions', style: _headerStyle)),
        ],
      ),
    );
  }

  Widget _buildTableRow() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: const [
          Expanded(flex: 2, child: Text('20/06/2025 \n11:58 AM', maxLines: 2)),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Bilal Shaikh'),
                Text(
                  'sbillu93@gmail.com',
                  style: TextStyle(color: Colors.black54),
                ),
                Text('+91 9769175240', style: TextStyle(color: Colors.black54)),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Text('Intragate Global Pvt Ltd'),
                SizedBox(width: 4),
                Icon(Icons.open_in_new, size: 16),
              ],
            ),
          ),
          Expanded(flex: 2, child: Text('--')),
          Expanded(flex: 2, child: Text('--')),
          Expanded(flex: 2, child: Text('Owais')),
          // Expanded(flex: 1, child: Icon(Icons.more_vert)),
          Expanded(flex: 1, child: ContactActionsMenu()),
        ],
      ),
    );
  }
}

const TextStyle _headerStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.white,
);
