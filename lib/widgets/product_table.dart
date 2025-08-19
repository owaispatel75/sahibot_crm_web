// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:sahibot_crm_web/config/app_theme.dart';
// import 'package:sahibot_crm_web/widgets/SlideInContactDetailsPanel.dart';

// class productTable extends StatefulWidget {
//   final Function(String) onContactTap;
//   final bool isPanelOpen;

//   productTable({required this.onContactTap, required this.isPanelOpen});

//   @override
//   State<productTable> createState() => _productTableState();
// }

// class _productTableState extends State<productTable> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16),
//       width: double.infinity,
//       child: Table(
//         columnWidths: const {
//           0: FlexColumnWidth(2),
//           1: FlexColumnWidth(2),
//           2: FlexColumnWidth(3),
//           3: FlexColumnWidth(2),
//           4: FlexColumnWidth(3),
//           5: FlexColumnWidth(2),
//         },
//         border: TableBorder.all(color: Colors.grey.shade300, width: 1),
//         defaultVerticalAlignment: TableCellVerticalAlignment.middle,
//         children: [
//           _buildHeaderRow(),
//           _buildDataRow(
//             productName: 'Sample P1',
//             productCode: 'Zylker Corp',
//             status: 'sbillu93@gmail.com',
//             productOwner: '9769175240',
//             // ownerInitials: 'SB',
//             // tags: 'Owais Patel',
//             // createdBy: 'Bilal',
//           ),
//         ],
//       ),
//     );
//   }

//   TableRow _buildHeaderRow() {
//     return TableRow(
//       decoration: BoxDecoration(color: AppCustomTheme.lightBlueBg),
//       children: [
//         _headerCell('Product Name'),
//         _headerCell('Product Code'),
//         _headerCell('Status'),
//         _headerCell('Product Owner'),
//         // _headerCell('Tags'),
//         // _headerCell('Created By'),
//       ],
//     );
//   }

//   TableRow _buildDataRow({
//     required String productName,
//     required String productCode,
//     required String status,
//     required String productOwner,
//     // required String ownerInitials,
//     // required String tags,
//     // required String createdBy,
//   }) {
//     return TableRow(
//       children: [
//         _dataCell(
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   context.go('/products/${Uri.encodeComponent(productName)}');
//                 },
//                 child: Text(
//                   productName,
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.blue,
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: () => widget.onContactTap(productName),
//                 child: CircleAvatar(
//                   radius: 16,
//                   backgroundColor: Colors.white,
//                   child: Icon(
//                     widget.isPanelOpen ? Icons.close : Icons.remove_red_eye,
//                     color: AppCustomTheme.bluePrimary,
//                     size: 18,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         _dataCell(Text(productCode)),
//         _dataCell(Text(status)),
//         _dataCell(Text(productOwner)),
//         // _dataCell(Text(tags)),
//         // _dataCell(Text(createdBy)),
//       ],
//     );
//   }

//   Widget _headerCell(String label) => Padding(
//     padding: const EdgeInsets.all(12.0),
//     child: Text(label, style: TextStyle(fontWeight: FontWeight.w600)),
//   );

//   Widget _dataCell(Widget child) =>
//       Padding(padding: const EdgeInsets.all(12.0), child: child);
// }

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sahibot_crm_web/config/app_theme.dart';

class productTable extends StatefulWidget {
  final Function(String) onContactTap;
  final bool isPanelOpen;

  const productTable({
    super.key,
    required this.onContactTap,
    required this.isPanelOpen,
  });

  @override
  State<productTable> createState() => _productTableState();
}

class _productTableState extends State<productTable> {
  int? _hoveredRow; // which data row is hovered (0-based for first data row)

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(2),
          2: FlexColumnWidth(3),
          3: FlexColumnWidth(2),
        },
        border: TableBorder.all(color: Colors.grey.shade300, width: 1),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          _buildHeaderRow(),
          _buildDataRow(
            index: 0,
            productName: 'Sample P1',
            productCode: 'ZK-001',
            status: 'Active',
            productOwner: 'Owais Patel',
          ),
          _buildDataRow(
            index: 1,
            productName: 'Sample P2',
            productCode: 'ZK-002',
            status: 'Inactive',
            productOwner: 'Bilal Shaikh',
          ),
        ],
      ),
    );
  }

  TableRow _buildHeaderRow() {
    return TableRow(
      decoration: BoxDecoration(color: AppCustomTheme.lightBlueBg),
      children: const [
        _HeaderCell('Product Name'),
        _HeaderCell('Product Code'),
        _HeaderCell('Status'),
        _HeaderCell('Product Owner'),
      ],
    );
  }

  // Wrap every cell in the row so hovering anywhere on the row shows the icon
  List<Widget> _wrapRowHover(int index, List<Widget> cells) {
    return cells
        .map(
          (c) => MouseRegion(
            onEnter: (_) => setState(() => _hoveredRow = index),
            onExit: (_) {
              if (_hoveredRow == index) setState(() => _hoveredRow = null);
            },
            child: c,
          ),
        )
        .toList();
  }

  TableRow _buildDataRow({
    required int index,
    required String productName,
    required String productCode,
    required String status,
    required String productOwner,
  }) {
    final isHovered = _hoveredRow == index;

    final cells = <Widget>[
      _dataCell(
        Row(
          children: [
            GestureDetector(
              onTap:
                  () => context.go(
                    '/products/${Uri.encodeComponent(productName)}',
                  ),
              child: Text(
                productName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 32,
              height: 32,
              child: IgnorePointer(
                ignoring: !isHovered,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 120),
                  opacity: isHovered ? 1 : 0,
                  child: InkWell(
                    onTap: () => widget.onContactTap(productName),
                    customBorder: const CircleBorder(),
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
                ),
              ),
            ),
          ],
        ),
      ),
      _dataCell(Text(productCode)),
      _dataCell(Text(status)),
      _dataCell(Text(productOwner)),
    ];

    return TableRow(children: _wrapRowHover(index, cells));
  }

  Widget _dataCell(Widget child) =>
      Padding(padding: const EdgeInsets.all(12.0), child: child);
}

class _HeaderCell extends StatelessWidget {
  final String label;
  const _HeaderCell(this.label);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}
