import 'package:flutter/material.dart';
import 'package:sahibot_crm_web/screens/kanban/kanban_models.dart';

Future<bool?> showMoveLeadDialog({
  required BuildContext context,
  required String title, // Deal title
  required String pipelineName,
  required Stage from,
  required Stage to,
}) {
  final remarks = TextEditingController();

  Widget _stageChip(String text, Color bg, Color border) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    decoration: BoxDecoration(
      color: bg,
      borderRadius: BorderRadius.circular(22),
      border: Border.all(color: border),
    ),
    child: Text(text, style: const TextStyle(fontWeight: FontWeight.w700)),
  );

  return showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (ctx) {
      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header row
                Row(
                  children: [
                    const Text(
                      'Move Lead',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(ctx, false),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Title + pipeline
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(color: Colors.black87),
                          children: [
                            const TextSpan(
                              text: 'Title : ',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            TextSpan(text: title),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(color: Colors.black87),
                          children: [
                            const TextSpan(
                              text: 'Pipeline : ',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            TextSpan(text: pipelineName),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),

                // From -> To chips
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _stageChip(
                      from.title,
                      const Color(0xFFFFF1DB),
                      const Color(0xFFF7A645),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: Icon(Icons.arrow_right_alt_rounded, size: 28),
                    ),
                    _stageChip(
                      to.title,
                      const Color(0xFFE9F2FF),
                      const Color(0xFF6DA6FF),
                    ),
                  ],
                ),
                const SizedBox(height: 14),

                // Remarks
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Remarks',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 6),
                TextField(
                  controller: remarks,
                  minLines: 4,
                  maxLines: 6,
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Add next follow-up (stub row)
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFE5E7EB)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    dense: true,
                    leading: const Icon(Icons.phone, size: 20),
                    title: const Text('Add Next Followup'),
                    trailing: const Icon(Icons.expand_more),
                    onTap: () {}, // TODO: expand to show follow-up inputs later
                  ),
                ),
                const SizedBox(height: 12),

                // Attach / mic (stubs)
                Row(
                  children: [
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.attach_file_outlined),
                      label: const Text(''),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(12),
                      ),
                    ),
                    const SizedBox(width: 10),
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.mic_none_outlined),
                      label: const Text(''),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(12),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 16),

                // CTA
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton.icon(
                    onPressed: () => Navigator.pop(ctx, true),
                    icon: const Icon(Icons.arrow_right_alt),
                    label: const Text('Move Lead'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF18C36E), // green
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}