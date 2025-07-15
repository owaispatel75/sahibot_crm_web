import 'package:flutter/material.dart';

class TaskTabView extends StatelessWidget {
  const TaskTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'All Tasks',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(label: Text('Task Name')),
                DataColumn(label: Text('Due Date')),
                DataColumn(label: Text('Status')),
                DataColumn(label: Text('Task Owner')),
              ],
              rows: const [
                DataRow(
                  cells: [
                    DataCell(
                      Text(
                        'Prepare a presentation for the demo',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataCell(Text('Jul 17, 2025')),
                    DataCell(Text('Not Started')),
                    DataCell(
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              'assets/images/avatar.jpg',
                            ), // Replace with your asset path
                            radius: 12,
                          ),
                          SizedBox(width: 8),
                          Text('owais Patel'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}