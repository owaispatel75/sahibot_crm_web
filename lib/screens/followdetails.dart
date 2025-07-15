import 'package:flutter/material.dart';
import 'package:sahibot_crm_web/config/app_theme.dart';

class SlideInFollowUpDetailsPanel extends StatelessWidget {
  final String contactName;
  final VoidCallback onClose;

  const SlideInFollowUpDetailsPanel({
    super.key,
    required this.contactName,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Lead Details',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(icon: const Icon(Icons.close), onPressed: onClose),
                ],
              ),
              const SizedBox(height: 12),
              _sectionLabel('Pipeline'),
              _valueBox('Software Sale Pipeline', AppCustomTheme.lightBlueBg),

              _sectionLabel('Stage'),
              _dropdownField('Prospecting'),

              _sectionLabel('Assigned To'),
              _assignedUserTile('Bilal Shaikh', 'BS'),

              _sectionLabel('Amount'),
              _simpleText('6000'),

              _sectionLabel('Source'),
              _simpleText('RCO'),

              _sectionLabel('Closing at'),
              _simpleText('27/6/2025'),

              const Divider(height: 32),
              _sectionLabel('Contact Details'),
              _fieldRow('Name', 'Bilal Shaikh'),
              _fieldRow('Email', 'sbillu93@gmail.com'),
              _fieldRow('Contact No', '9769175240'),
              _fieldRow('Created at', '25 days ago'),

              const Divider(height: 32),
              _sectionLabel('Notes'),
              const SizedBox(height: 8),
              _notesBox(),
              const SizedBox(height: 8),
              _saveButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionLabel(String label) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Text(
      label,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: AppCustomTheme.bluePrimary,
      ),
    ),
  );

  Widget _valueBox(String value, Color bgColor) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(value, style: const TextStyle(color: Colors.black)),
  );

  Widget _dropdownField(String currentValue) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade300),
      borderRadius: BorderRadius.circular(6),
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: currentValue,
        items: const [
          DropdownMenuItem(value: 'Prospecting', child: Text('Prospecting')),
          DropdownMenuItem(value: 'Contacted', child: Text('Contacted')),
          DropdownMenuItem(value: 'Qualified', child: Text('Qualified')),
        ],
        onChanged: (val) {},
      ),
    ),
  );

  Widget _assignedUserTile(String name, String initials) => Row(
    children: [
      CircleAvatar(
        backgroundColor: Colors.cyan,
        child: Text(initials, style: const TextStyle(color: Colors.white)),
      ),
      const SizedBox(width: 8),
      Text(name),
    ],
  );

  Widget _simpleText(String text) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Text(text),
  );

  Widget _fieldRow(String label, String value) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 2),
    child: Row(
      children: [
        SizedBox(width: 120, child: Text(label)),
        Expanded(child: Text(value)),
      ],
    ),
  );

  Widget _notesBox() => TextField(
    maxLines: 4,
    decoration: InputDecoration(
      hintText: 'Add Notes...',
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      filled: true,
      fillColor: Colors.grey.shade100,
    ),
  );

  Widget _saveButton() => Align(
    alignment: Alignment.centerLeft,
    child: ElevatedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.save),
      label: const Text('Save'),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppCustomTheme.bluePrimary,
        foregroundColor: Colors.white,
      ),
    ),
  );
}
