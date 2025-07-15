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

class PartiesTable extends StatefulWidget {
  final Function(String) onContactTap;
  final bool isPanelOpen;

  PartiesTable({required this.onContactTap, required this.isPanelOpen});

  @override
  State<PartiesTable> createState() => _PartiesTableState();
}

class _PartiesTableState extends State<PartiesTable> {
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
        },
        border: TableBorder.all(color: Colors.grey.shade300, width: 1),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          _buildHeaderRow(),
          _buildDataRow(
            partiesName: 'Zylker Corp',
            shippingAddress: 'Thane',
            billingAddress: 'Thane',
            city: 'Mumbai',
            state: 'Maharashtra',
          ),
        ],
      ),
    );
  }

  TableRow _buildHeaderRow() {
    return TableRow(
      decoration: BoxDecoration(color: AppCustomTheme.lightBlueBg),
      children: [
        _headerCell('Parties Name'),
        _headerCell('Shipping Address'),
        _headerCell('Billing Address'),
        _headerCell('City'),
        _headerCell('State'),
      ],
    );
  }

  TableRow _buildDataRow({
    required String partiesName,
    required String shippingAddress,
    required String billingAddress,
    required String city,
    required String state,
  }) {
    return TableRow(
      children: [
        _dataCell(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  context.go('/parties/${Uri.encodeComponent(partiesName)}');
                },
                child: Text(
                  partiesName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              InkWell(
                onTap: () => widget.onContactTap(partiesName),
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
        _dataCell(Text(shippingAddress)),
        _dataCell(Text(billingAddress)),
        _dataCell(Text(city)),
        _dataCell(Text(state)),
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