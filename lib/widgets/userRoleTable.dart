import 'package:flutter/material.dart';
import 'package:sahibot_crm_web/config/app_theme.dart';

class Userroletable extends StatelessWidget {
  const Userroletable({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Table(
          border: TableBorder.all(color: Colors.grey.shade300),
          columnWidths: const {
            0: FlexColumnWidth(2),
            1: FlexColumnWidth(2),
            2: FlexColumnWidth(2),
            3: FlexColumnWidth(1),
            4: FlexColumnWidth(1),
          },
          children: [
            _buildHeaderRow(),
            _buildDataRow(
              role: 'Manager',
              access: 'All Leads',
              users: '1',
              // reportsTo: 'Bilal Shaikh',
              // role: 'Admin',
            ),
          ],
        ),
      ],
    );
  }

  TableRow _buildHeaderRow() {
    return TableRow(
      decoration: BoxDecoration(color: AppCustomTheme.lightBlueBg),
      children: [
        _headerCell('Role'),
        _headerCell('Access'),
        _headerCell('Users'),
        _headerCell('Actions'),
      ],
    );
  }

  TableRow _buildDataRow({
    required String role,
    required String access,
    required String users,
    // required String reportsTo,
    // required String role,
  }) {
    return TableRow(
      children: [
        // _cell(
        //   Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Text(role, style: const TextStyle(fontWeight: FontWeight.bold)),
        //       Text(access),
        //     ],
        //   ),
        // ),
        _cell(Text(role)),
        _cell(Text(access)),
        _cell(Text(users)),
        // _cell(
        //   Container(
        //     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        //     decoration: BoxDecoration(
        //       color: AppCustomTheme.lightBlueBg,
        //       borderRadius: BorderRadius.circular(4),
        //     ),
        //     child: Text(role, style: const TextStyle(fontSize: 12)),
        //   ),
        // ),
        _cell(
          Row(
            children: const [
              Icon(Icons.edit, size: 18),
              SizedBox(width: 8),
              Icon(Icons.delete, size: 18, color: Colors.red),
            ],
          ),
        ),
      ],
    );
  }

  Widget _headerCell(String label) => Padding(
    padding: const EdgeInsets.all(12),
    child: Text(
      label,
      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    ),
  );

  Widget _cell(Widget child) =>
      Padding(padding: const EdgeInsets.all(12), child: child);
}
