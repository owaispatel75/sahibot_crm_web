import 'package:flutter/material.dart';

// class ContactTable extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: DataTable(
//         columnSpacing: 24,
//         headingRowColor: MaterialStateProperty.all(Colors.grey[100]),
//         columns: const [
//           DataColumn(label: Text('Contact Name')),
//           DataColumn(label: Text('Company Name')),
//           DataColumn(label: Text('Email')),
//           DataColumn(label: Text('Phone')),
//           DataColumn(label: Text('Contact Owner')),
//         ],
//         rows: [
//           DataRow(
//             cells: [
//               DataCell(
//                 Text(
//                   'Ted Watson',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ),
//               DataCell(Text('Zylker Corp')),
//               DataCell(Text('support@bigin.com')),
//               DataCell(Text('')),
//               DataCell(
//                 Row(
//                   children: [
//                     CircleAvatar(
//                       backgroundColor: Colors.green[200],
//                       radius: 14,
//                       child: Text(
//                         'OP',
//                         style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 8),
//                     Text('owais Patel'),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sahibot_crm_web/config/app_theme.dart';
import 'package:sahibot_crm_web/widgets/SlideInContactDetailsPanel.dart';

class ContactTable extends StatefulWidget {
  final Function(String) onContactTap;
  final bool isPanelOpen;

  ContactTable({required this.onContactTap, required this.isPanelOpen});

  @override
  State<ContactTable> createState() => _ContactTableState();
}

class _ContactTableState extends State<ContactTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(2),
          2: FlexColumnWidth(3),
          3: FlexColumnWidth(2),
          4: FlexColumnWidth(3),
          5: FlexColumnWidth(2),
        },
        border: TableBorder.all(color: Colors.grey.shade300, width: 1),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          _buildHeaderRow(),
          _buildDataRow(
            contactName: 'Bilal Shaikh',
            companyName: 'Zylker Corp',
            email: 'sbillu93@gmail.com',
            phone: '9769175240',
            ownerInitials: 'SB',
            tags: 'Owais Patel',
            createdBy: 'Bilal',
          ),
        ],
      ),
    );
  }

  TableRow _buildHeaderRow() {
    return TableRow(
      decoration: BoxDecoration(color: AppCustomTheme.lightBlueBg),
      children: [
        _headerCell('Contact Name'),
        _headerCell('Company Name'),
        _headerCell('Email'),
        _headerCell('Phone'),
        _headerCell('Tags'),
        _headerCell('Created By'),
      ],
    );
  }

  TableRow _buildDataRow({
    required String contactName,
    required String companyName,
    required String email,
    required String phone,
    required String ownerInitials,
    required String tags,
    required String createdBy,
  }) {
    return TableRow(
      children: [
        _dataCell(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  context.go('/contacts/${Uri.encodeComponent(contactName)}');
                },
                child: Text(
                  contactName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              InkWell(
                onTap: () => widget.onContactTap(contactName),
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.white,
                  child: Icon(
                    widget.isPanelOpen ? Icons.close : Icons.remove_red_eye,
                    color: AppCustomTheme.bluePrimary,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
        _dataCell(Text(companyName)),
        _dataCell(Text(email)),
        _dataCell(Text(phone)),
        _dataCell(Text(tags)),
        _dataCell(Text(createdBy)),
      ],
    );
  }

  Widget _headerCell(String label) => Padding(
    padding: const EdgeInsets.all(12.0),
    child: Text(label, style: TextStyle(fontWeight: FontWeight.w600)),
  );

  Widget _dataCell(Widget child) =>
      Padding(padding: const EdgeInsets.all(12.0), child: child);
}

// _dataCell(
        //   Row(
        //     children: [
        //       CircleAvatar(
        //         backgroundColor: AppCustomTheme.lightgrayBg,
        //         radius: 14,
        //         child: Text(
        //           ownerInitials,
        //           style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        //         ),
        //       ),
        //       SizedBox(width: 8),
        //       Text(ownerName),
        //     ],
        //   ),
        // ),