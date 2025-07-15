import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sahibot_crm_web/config/app_theme.dart';

// class FollowUpTable extends StatefulWidget {

//   @override
//   State<FollowUpTable> createState() => _FollowUpTableState();
// }

// class _FollowUpTableState extends State<FollowUpTable> {
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
//             contactName: 'Bilal Shaikh',
//             companyName: 'Zylker Corp',
//             email: 'sbillu93@gmail.com',
//             phone: '9769175240',
//             ownerInitials: 'SB',
//             tags: 'Owais Patel',
//             createdBy: 'Bilal',
//           ),
//         ],
//       ),
//     );
//   }

//   TableRow _buildHeaderRow() {
//     return TableRow(
//       decoration: BoxDecoration(color: AppCustomTheme.lightBlueBg),
//       children: [
//         _headerCell('Contact Name'),
//         _headerCell('Company Name'),
//         _headerCell('Email'),
//         _headerCell('Phone'),
//         _headerCell('Tags'),
//         _headerCell('Created By'),
//       ],
//     );
//   }

//   TableRow _buildDataRow({
//     required String contactName,
//     required String companyName,
//     required String email,
//     required String phone,
//     required String ownerInitials,
//     required String tags,
//     required String createdBy,
//   }) {
//     return TableRow(
//       children: [
//         _dataCell(
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   context.go('/contacts/${Uri.encodeComponent(contactName)}');
//                 },
//                 child: Text(
//                   contactName,
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.blue,
//                   ),
//                 ),
//               ),
//               // InkWell(
//               //   onTap: () => widget.onContactTap(contactName),
//               //   child: CircleAvatar(
//               //     radius: 16,
//               //     backgroundColor: Colors.white,
//               //     child: Icon(
//               //       widget.isPanelOpen ? Icons.close : Icons.remove_red_eye,
//               //       color: AppCustomTheme.bluePrimary,
//               //       size: 18,
//               //     ),
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//         _dataCell(Text(companyName)),
//         _dataCell(Text(email)),
//         _dataCell(Text(phone)),
//         _dataCell(Text(tags)),
//         _dataCell(Text(createdBy)),
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

// class FollowUpTable extends StatefulWidget {
//   final String statusFilter;

//   const FollowUpTable({Key? key, required this.statusFilter}) : super(key: key);

//   @override
//   State<FollowUpTable> createState() => _FollowUpTableState();
// }

// class _FollowUpTableState extends State<FollowUpTable> {
//   // Sample static data with status
//   final List<Map<String, String>> _data = [
//     {
//       'contactName': 'Bilal Shaikh',
//       'companyName': 'Zylker Corp',
//       'email': 'sbillu93@gmail.com',
//       'phone': '9769175240',
//       'tags': 'Owais Patel',
//       'createdBy': 'Bilal',
//       'status': 'Overdue',
//     },
//     {
//       'contactName': 'John Doe',
//       'companyName': 'Acme Inc',
//       'email': 'john@acme.com',
//       'phone': '1234567890',
//       'tags': 'Admin',
//       'createdBy': 'John',
//       'status': 'Open',
//     },
//     {
//       'contactName': 'Jane Smith',
//       'companyName': 'Globex Corp',
//       'email': 'jane@globex.com',
//       'phone': '0987654321',
//       'tags': 'Owais Patel',
//       'createdBy': 'Jane',
//       'status': 'Closed',
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     // Filter data based on statusFilter
//     final filteredData =
//         _data.where((item) => item['status'] == widget.statusFilter).toList();

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
//           for (var item in filteredData)
//             _buildDataRow(
//               contactName: item['contactName']!,
//               companyName: item['companyName']!,
//               email: item['email']!,
//               phone: item['phone']!,
//               tags: item['tags']!,
//               createdBy: item['createdBy']!,
//             ),
//         ],
//       ),
//     );
//   }

//   TableRow _buildHeaderRow() {
//     return TableRow(
//       decoration: BoxDecoration(color: AppCustomTheme.lightBlueBg),
//       children: [
//         _headerCell('Contact Name'),
//         _headerCell('Company Name'),
//         _headerCell('Email'),
//         _headerCell('Phone'),
//         _headerCell('Tags'),
//         _headerCell('Created By'),
//       ],
//     );
//   }

//   TableRow _buildDataRow({
//     required String contactName,
//     required String companyName,
//     required String email,
//     required String phone,
//     required String tags,
//     required String createdBy,
//   }) {
//     return TableRow(
//       children: [
//         // _dataCell(
//         //   GestureDetector(
//         //     onTap: () {
//         //       context.go('/contacts/${Uri.encodeComponent(contactName)}');
//         //     },
//         //     child: Text(
//         //       contactName,
//         //       style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
//         //     ),
//         //   ),
//         // ),
//         _dataCell(Text(contactName)),
//         _dataCell(Text(companyName)),
//         _dataCell(Text(email)),
//         _dataCell(Text(phone)),
//         _dataCell(Text(tags)),
//         _dataCell(Text(createdBy)),
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

class FollowUpTable extends StatefulWidget {
  final Function(String) onFollowUpTap;
  final bool isPanelOpen;
  final String statusFilter;

  FollowUpTable({
    required this.onFollowUpTap,
    required this.isPanelOpen,
    required this.statusFilter,
  });

  @override
  State<FollowUpTable> createState() => _FollowUpTableState();
}

class _FollowUpTableState extends State<FollowUpTable> {
  // Sample static data for demo, ideally this should come from backend filtered by statusFilter
  final List<Map<String, String>> followUpData = [
    {
      'contactName': 'Bilal Shaikh',
      'companyName': 'Zylker Corp',
      'email': 'sbillu93@gmail.com',
      'phone': '+91 9769175240',
      'tags': 'Owais Patel',
      'createdBy': 'Bilal',
      'status': 'Overdue',
      'type': 'Call',
      'stage': 'Prospecting',
      'dueDate': 'Jul 8, 2025 9:47 PM',
      'dueDateAgo': '7 days ago',
      'ownerInitials': 'BS',
    },
    {
      'contactName': 'Bilal Shaikh',
      'companyName': 'Zylker Corp',
      'email': 'sbillu93@gmail.com',
      'phone': '+91 9769175240',
      'tags': 'Owais Patel',
      'createdBy': 'Bilal',
      'status': 'Open',
      'type': 'Call',
      'stage': 'Prospecting',
      'dueDate': 'Jul 8, 2025 9:47 PM',
      'dueDateAgo': '7 days ago',
      'ownerInitials': 'BS',
    },
    // You can add more entries here for testing
  ];

  @override
  Widget build(BuildContext context) {
    // Filter data by widget.statusFilter
    final filteredData =
        followUpData
            .where((item) => item['status'] == widget.statusFilter)
            .toList();

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
          6: FlexColumnWidth(2), // For Actions column
        },
        border: TableBorder.all(color: Colors.grey.shade300, width: 1),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          _buildHeaderRow(),
          ...filteredData.map((data) => _buildDataRow(data)).toList(),
          if (filteredData.isEmpty)
            TableRow(
              children: List.generate(
                7,
                (index) => _dataCell(
                  index == 0
                      ? const Text(
                        'No data available',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      )
                      : const SizedBox.shrink(),
                ),
              ),
            ),
        ],
      ),
    );
  }

  TableRow _buildHeaderRow() {
    return TableRow(
      decoration: BoxDecoration(color: AppCustomTheme.lightBlueBg),
      children: [
        _headerCell('Contact'),
        _headerCell('Stage'),
        _headerCell('Due Date'),
        _headerCell('Assigned To'),
        _headerCell('Type'),
        _headerCell('Tags'),
        _headerCell('Actions'),
      ],
    );
  }

  TableRow _buildDataRow(Map<String, String> data) {
    return TableRow(
      children: [
        _dataCell(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  context.go(
                    '/contacts/${Uri.encodeComponent(data['contactName'] ?? '')}',
                  );
                },
                child: Text(
                  data['contactName'] ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              InkWell(
                onTap: () => widget.onFollowUpTap(data['contactName'] ?? ''),
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
        _dataCell(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data['stage'] ?? ''),
              Text(
                data['companyName'] ?? '',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
        _dataCell(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data['dueDate'] ?? ''),
              Text(
                data['dueDateAgo'] ?? '',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
        _dataCell(
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.cyan,
                child: Text(
                  data['ownerInitials'] ?? '',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(width: 8),
              Text(data['createdBy'] ?? ''),
            ],
          ),
        ),
        _dataCell(Text(data['type'] ?? '')),
        _dataCell(Text(data['tags'] ?? '')),
        _dataCell(
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Add your action here
            },
          ),
        ),
      ],
    );
  }

  Widget _headerCell(String label) => Padding(
    padding: const EdgeInsets.all(12.0),
    child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
  );

  Widget _dataCell(Widget child) =>
      Padding(padding: const EdgeInsets.all(12.0), child: child);
}
