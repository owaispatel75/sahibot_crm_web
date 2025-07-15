import 'package:flutter/material.dart';

class CallsTable extends StatelessWidget {
  const CallsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(2), // To/From
          1: FlexColumnWidth(2), // Call Type
          2: FlexColumnWidth(2), // Call Start Time
          3: FlexColumnWidth(2), // Modified Time
          4: FlexColumnWidth(2), // Call Owner
          5: FlexColumnWidth(2), // Call Duration
        },
        border: TableBorder.all(color: Colors.grey.shade300, width: 1),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          _buildHeaderRow(),
          _buildEmptyRow(), // You can replace this later with dynamic rows
        ],
      ),
    );
  }

  TableRow _buildHeaderRow() {
    return TableRow(
      decoration: const BoxDecoration(color: Color(0xFFF0F4F8)),
      children: [
        _headerCell('To/From'),
        _headerCell('Call Type'),
        _headerCell('Call Start Time'),
        _headerCell('Modified Time'),
        _headerCell('Call Owner'),
        _headerCell('Call Duration'),
      ],
    );
  }

  TableRow _buildEmptyRow() {
    return TableRow(
      children: [
        _dataCell(
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 32),
            child: Center(
              child: Text(
                "This record doesn't have any calls.",
                style: TextStyle(color: Colors.black54),
              ),
            ),
          ),
          span: 6,
        ),
      ],
    );
  }

  Widget _headerCell(String label) => Padding(
    padding: const EdgeInsets.all(12.0),
    child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
  );

  Widget _dataCell(Widget child, {int span = 1}) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Table(
        columnWidths: {
          for (int i = 0; i < span; i++) i: const FlexColumnWidth(),
        },
        children: [
          TableRow(
            children: List.generate(
              span,
              (_) => Padding(padding: const EdgeInsets.all(12.0), child: child),
            ),
          ),
        ],
      ),
    );
  }
}
