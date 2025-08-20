import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sahibot_crm_web/config/app_theme.dart';

/// =====================
/// Contact Notes Tab UI
/// =====================
/// Frontend-only (in-memory) implementation that looks/behaves like the screenshot:
/// - Composer with big textarea, Save/Cancel, "Attach File" icon, and "Add a Title"
/// - "All Notes" dropdown (non-functional placeholder)
/// - Notes list with author, timestamp, optional title, and body
/// - Per-note Edit mode with Save/Cancel
///
/// Usage:
///   TabBarView(
///     children: [
///       ...,
///       ContactNotesTab(authorName: 'Bilal Shaikh'), // Notes
///       ...,
///     ],
///   )
class ContactNotesTab extends StatefulWidget {
  final String authorName; // current user to show as note author

  const ContactNotesTab({super.key, required this.authorName});

  @override
  State<ContactNotesTab> createState() => _ContactNotesTabState();
}

class _ContactNotesTabState extends State<ContactNotesTab> {
  // --- Theme-ish bits (kept local so there's no external dependency)
  static const _blue = Color(0xFF2563EB);
  static const _blueLight = Color(0xFFEFF6FF);
  static const _panel = Color(0xFFF2F6FA);
  static const _border = Color(0xFFE5E7EB);
  static const _saveGreen = AppCustomTheme.bluePrimary;
  // static const _saveGreen = Color(0xFF22C55E);

  // Composer state
  final _bodyCtrl = TextEditingController();
  final _titleCtrl = TextEditingController();
  bool _showTitle = false;

  // Notes model (in-memory)
  final List<_Note> _notes = <_Note>[];

  @override
  void dispose() {
    _bodyCtrl.dispose();
    _titleCtrl.dispose();
    super.dispose();
  }

  void _resetComposer() {
    _bodyCtrl.clear();
    _titleCtrl.clear();
    setState(() => _showTitle = false);
  }

  void _saveNewNote() {
    final body = _bodyCtrl.text.trim();
    final title = _showTitle ? _titleCtrl.text.trim() : null;
    if (body.isEmpty && (title == null || title.isEmpty)) return;

    setState(() {
      _notes.insert(
        0,
        _Note(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          author: widget.authorName,
          title: (title != null && title.isNotEmpty) ? title : null,
          body: body,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      );
    });
    _resetComposer();
  }

  String _prettyWhen(DateTime t) {
    final now = DateTime.now();
    bool sameDay =
        t.year == now.year && t.month == now.month && t.day == now.day;
    final time = DateFormat('hh:mm a').format(t);
    if (sameDay) return 'Today, $time';
    return DateFormat('MMM d, yyyy  hh:mm a').format(t);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 24),
      children: [
        // "All Notes" dropdown (visual match; wire later if needed)
        Row(children: [_AllNotesDropdown()]),
        const SizedBox(height: 10),

        // Composer panel
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: _border),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            children: [
              // Big textarea
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                child: TextField(
                  controller: _bodyCtrl,
                  maxLines: 6,
                  minLines: 4,
                  decoration: InputDecoration(
                    hintText: "What's this note about?",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: _border),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
              ),

              // Action strip (Save / Cancel / Attach File / Add a Title)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: _panel,
                  border: Border(top: BorderSide(color: _border)),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(6),
                  ),
                ),
                child: Wrap(
                  spacing: 10,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    // Save
                    ElevatedButton(
                      onPressed: _saveNewNote,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _saveGreen,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: const Text('Save'),
                    ),

                    // Cancel
                    OutlinedButton(
                      onPressed: _resetComposer,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black87,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        side: const BorderSide(color: _border),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: const Text('Cancel'),
                    ),

                    // Attach File (visual)
                    // TextButton.icon(
                    //   onPressed: () {},
                    //   icon: const Icon(Icons.attach_file, size: 18),
                    //   label: const Text('Attach File'),
                    //   style: TextButton.styleFrom(
                    //     foregroundColor: Colors.black87,
                    //   ),
                    // ),

                    // Add a Title (toggle)
                    // TextButton(
                    //   onPressed: () => setState(() => _showTitle = true),
                    //   style: TextButton.styleFrom(
                    //     foregroundColor: Colors.black87,
                    //   ),
                    //   child: const Text('Add a Title'),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Optional Title field (shows below when toggled)
        if (_showTitle) ...[
          const SizedBox(height: 10),
          TextField(
            controller: _titleCtrl,
            decoration: InputDecoration(
              labelText: 'Title',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: _border),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        ],

        const SizedBox(height: 16),

        // Notes list
        for (final n in _notes) ...[
          _NoteTile(
            note: n,
            onSave: (title, body) {
              setState(() {
                n.title = title?.trim().isEmpty == true ? null : title?.trim();
                n.body = body.trim();
                n.updatedAt = DateTime.now();
                n.isEditing = false;
              });
            },
            onEdit: () => setState(() => n.isEditing = true),
            onCancelEdit: () => setState(() => n.isEditing = false),
            // (Optional) Delete — uncomment to show a delete action somewhere if you want.
            // onDelete: () => setState(() => _notes.remove(n)),
            prettyWhen: _prettyWhen,
            headerColor: _blueLight,
            dotColor: const Color(0xFF22C55E),
          ),
          const Divider(height: 24),
        ],

        if (_notes.isEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Text(
              'No notes yet. Write your first one above!',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ),
      ],
    );
  }
}

/// Compact "All Notes ▼" dropdown (visual only)
class _AllNotesDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      tooltip: 'Filter',
      itemBuilder:
          (_) => const [
            PopupMenuItem(value: 'All', child: Text('All Notes')),
            PopupMenuItem(value: 'Mine', child: Text('My Notes')),
          ],
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: _ContactNotesTabState._blueLight,
          border: Border.all(color: _ContactNotesTabState._border),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('All Notes', style: TextStyle(fontWeight: FontWeight.w600)),
            SizedBox(width: 4),
            Icon(Icons.arrow_drop_down, size: 20),
          ],
        ),
      ),
    );
  }
}

/// Single note tile (view + inline edit)
class _NoteTile extends StatefulWidget {
  final _Note note;
  final void Function(String? title, String body) onSave;
  final VoidCallback onEdit;
  final VoidCallback onCancelEdit;
  final String Function(DateTime) prettyWhen;
  final Color headerColor;
  final Color dotColor;

  const _NoteTile({
    required this.note,
    required this.onSave,
    required this.onEdit,
    required this.onCancelEdit,
    required this.prettyWhen,
    required this.headerColor,
    required this.dotColor,
  });

  @override
  State<_NoteTile> createState() => _NoteTileState();
}

class _NoteTileState extends State<_NoteTile> {
  late final TextEditingController _tCtrl;
  late final TextEditingController _bCtrl;

  @override
  void initState() {
    super.initState();
    _tCtrl = TextEditingController(text: widget.note.title ?? '');
    _bCtrl = TextEditingController(text: widget.note.body);
  }

  @override
  void dispose() {
    _tCtrl.dispose();
    _bCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final n = widget.note;

    // Header (avatar + author + timestamp)
    Widget header = Row(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 14,
              backgroundColor: Colors.blue.shade400,
              child: Text(
                _initials(n.author),
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
            // Positioned(
            //   right: -1,
            //   bottom: -1,
            //   child: Container(
            //     width: 10,
            //     height: 10,
            //     decoration: BoxDecoration(
            //       color: widget.dotColor,
            //       shape: BoxShape.circle,
            //       border: Border.all(color: Colors.white, width: 1.5),
            //     ),
            //   ),
            // ),
          ],
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              n.author,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
            ),
            Text(
              widget.prettyWhen(n.updatedAt),
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        const Spacer(),
        if (!n.isEditing)
          TextButton(onPressed: widget.onEdit, child: const Text('Edit')),
      ],
    );

    if (!n.isEditing) {
      // View mode
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header,
          if (n.title != null && n.title!.isNotEmpty) ...[
            const SizedBox(height: 6),
            Text(n.title!, style: const TextStyle(fontWeight: FontWeight.w700)),
          ],
          const SizedBox(height: 4),
          Text(n.body),
        ],
      );
    }

    // Edit mode
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        header,
        const SizedBox(height: 8),
        TextField(
          controller: _tCtrl,
          decoration: const InputDecoration(
            labelText: 'Title (optional)',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _bCtrl,
          maxLines: 5,
          minLines: 3,
          decoration: const InputDecoration(
            labelText: 'Note',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            ElevatedButton.icon(
              onPressed: () => widget.onSave(_tCtrl.text, _bCtrl.text),
              icon: const Icon(Icons.save, size: 18),
              label: const Text('Save'),
            ),
            const SizedBox(width: 8),
            TextButton(
              onPressed: widget.onCancelEdit,
              child: const Text('Cancel'),
            ),
          ],
        ),
      ],
    );
  }

  String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.length == 1) return parts.first.substring(0, 1).toUpperCase();
    return (parts.first.substring(0, 1) + parts.last.substring(0, 1))
        .toUpperCase();
  }
}

/// Note model (frontend-only)
class _Note {
  final String id;
  final String author;
  String? title;
  String body;
  DateTime createdAt;
  DateTime updatedAt;
  bool isEditing;

  _Note({
    required this.id,
    required this.author,
    required this.title,
    required this.body,
    required this.createdAt,
    required this.updatedAt,
    this.isEditing = false,
  });
}
