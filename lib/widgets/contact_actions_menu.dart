import 'package:flutter/material.dart';
import 'package:sahibot_crm_web/config/app_theme.dart';

class ContactActionsMenu extends StatelessWidget {
  const ContactActionsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      offset: const Offset(-10, 40),
      itemBuilder:
          (context) => [
            // _popupItem(0, Icons.remove_red_eye, 'View Details', Colors.green),
            // _popupItem(1, Icons.event_note, 'Add Follow UP', Colors.orange),
            _popupItem(2, Icons.edit, 'Edit', AppCustomTheme.bluePrimary),
            _popupItem(3, Icons.delete, 'Delete', AppCustomTheme.bluePrimary),
          ],
      icon: const Icon(Icons.more_vert),
      onSelected: (index) {
        // Leave empty for now
      },
    );
  }

  PopupMenuItem<int> _popupItem(
    int value,
    IconData icon,
    String text,
    Color iconColor,
  ) {
    return PopupMenuItem<int>(
      value: value,
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 20),
          const SizedBox(width: 10),
          Text(text),
        ],
      ),
    );
  }
}
