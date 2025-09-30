import 'package:flutter/material.dart';
import 'package:sahibot_crm_web/screens/kanban/kanban_models.dart';
import 'package:sahibot_crm_web/All%20Sidebars/leads_section_sidebar.dart';
import 'package:sahibot_crm_web/widgets/move_lead_dialog.dart';
import '../../../widgets/topbar.dart';
import '../../All Sidebars/sidebar.dart';

// --- Notes & Follow-ups model/state ---
class _Note {
  final String title;
  final String body;
  final DateTime createdAt;
  _Note({required this.title, required this.body, required this.createdAt});
}

class _FollowUp {
  final String type; // e.g. Call/Meeting/WhatsApp/Email/Task
  final DateTime when;
  final String description;
  final bool remind;
  _FollowUp({
    required this.type,
    required this.when,
    required this.description,
    required this.remind,
  });
}

/// Use the same Deal/Stage you already have in pipelines screen
class PipelineDetailsScreen extends StatefulWidget {
  final String pipelineName;
  final String currentStageId;
  final List<Stage> stages;
  final Deal deal;

  const PipelineDetailsScreen({
    super.key,
    required this.pipelineName,
    required this.currentStageId,
    required this.stages,
    required this.deal,
  });

  @override
  State<PipelineDetailsScreen> createState() => _PipelineDetailsScreenState();
}

class _PipelineDetailsScreenState extends State<PipelineDetailsScreen>
    with SingleTickerProviderStateMixin {
  late String _stageId;
  late TabController _tabs;

  final List<_Note> _notes = [];
  final List<_FollowUp> _followUps = [];

  void _openAddNoteSheet() {
    _showRightSheet(
      context,
      title: 'Add Note',
      child: _AddNoteForm(
        onSubmit: (title, body) {
          setState(() {
            _notes.add(
              _Note(title: title, body: body, createdAt: DateTime.now()),
            );
          });
          _tabs.animateTo(1);
        },
      ),
    );
  }

  void _openAddFollowUpSheet() {
    _showRightSheet(
      context,
      title: 'Add Follow-up',
      child: _AddFollowUpForm(
        onSubmit: (type, when, desc, remind) {
          setState(() {
            _followUps.add(
              _FollowUp(
                type: type,
                when: when,
                description: desc,
                remind: remind,
              ),
            );
          });
          _tabs.animateTo(2);
        },
      ),
    );
  }

  void _showRightSheet(
    BuildContext context, {
    required String title,
    required Widget child,
  }) {
    showGeneralDialog(
      context: context,
      barrierLabel: 'Add',
      barrierDismissible: true,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (_, __, ___) => const SizedBox.shrink(),
      transitionBuilder: (ctx, anim, __, ___) {
        final offset = Tween(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeOut)).animate(anim);

        return Align(
          alignment: Alignment.centerRight,
          child: SlideTransition(
            position: offset,
            child: Material(
              color: Colors.white,
              elevation: 8,
              child: ConstrainedBox(
                constraints: const BoxConstraints.tightFor(
                  width: 420, // sheet width
                  height: double.infinity,
                ),
                child: Column(
                  children: [
                    // header
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF6F8FB),
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () => Navigator.of(ctx).pop(),
                          ),
                        ],
                      ),
                    ),
                    Expanded(child: child),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _notesList() {
    if (_notes.isEmpty) {
      return _emptyStub('No notes yet.');
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _notes.length,
      itemBuilder: (_, i) {
        final n = _notes[i];
        return Card(
          child: ListTile(
            leading: const Icon(Icons.sticky_note_2_outlined),
            title: Text(n.title.isEmpty ? 'Note' : n.title),
            subtitle: Text(n.body),
            trailing: Text(
              '${n.createdAt.year}-${n.createdAt.month}-${n.createdAt.day}',
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        );
      },
    );
  }

  Widget _followUpsList() {
    if (_followUps.isEmpty) {
      return _emptyStub('No follow-ups yet.');
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _followUps.length,
      itemBuilder: (_, i) {
        final f = _followUps[i];
        return Card(
          child: ListTile(
            leading: const Icon(Icons.event_available_outlined),
            title: Text('${f.type} • ${f.when}'),
            subtitle: Text(f.description),
            trailing:
                f.remind
                    ? const Icon(Icons.alarm, color: Colors.green)
                    : const SizedBox.shrink(),
          ),
        );
      },
    );
  }

  Future<void> _tryStageChange(String newId) async {
    if (newId == _stageId) return;
    final from = widget.stages.firstWhere((s) => s.id == _stageId);
    final to = widget.stages.firstWhere((s) => s.id == newId);

    final ok = await showMoveLeadDialog(
      context: context,
      title: widget.deal.title,
      pipelineName: widget.pipelineName,
      from: from,
      to: to,
    );

    if (ok == true) {
      setState(() => _stageId = newId);
      // TODO: call backend to persist
    }
  }

  @override
  void initState() {
    super.initState();
    _stageId = widget.currentStageId;
    _tabs = TabController(
      length: 3,
      vsync: this,
    ); // Timeline / Notes / Follow-up (stub)
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  Stage get _stage => widget.stages.firstWhere((s) => s.id == _stageId);

  String _fmtDate(DateTime? d) =>
      d == null ? '—' : '${d.day}/${d.month}/${d.year}';

  @override
  Widget build(BuildContext context) {
    final d = widget.deal;

    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              const Sidebar(),
              const LeadsSectionSidebar(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 64),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // header: stage chips + actions
                      _header(),
                      const SizedBox(height: 8),
                      Expanded(
                        child: Row(
                          children: [
                            // left info panel
                            _leftInfo(d),
                            const SizedBox(width: 16),
                            // right tab area
                            Expanded(child: _tabsArea(d)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // const Positioned(top: 0, left: 0, right: 0, child: TopBar()),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Builder(
              builder: (ctx) => const TopBar(), // <-- ctx has GoRouterState
            ),
          ),
        ],
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: Row(
        children: [
          // stages strip (scrollable if many)
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (final s in widget.stages)
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                        label: Text(s.title),
                        selected: _stageId == s.id,
                        // onSelected: (sel) {
                        //   if (!sel) return;
                        //   setState(() => _stageId = s.id);
                        //   // TODO: later, hit backend to move stage
                        // },
                        onSelected: (sel) {
                          if (sel) _tryStageChange(s.id);
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Actions (stubs)
          // OutlinedButton.icon(
          //   onPressed: () {},
          //   icon: const Icon(Icons.compare_arrows),
          //   label: const Text('Move To'),
          // ),
          // const SizedBox(width: 8),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.edit_outlined),
            label: const Text('Edit Lead'),
          ),
          const SizedBox(width: 8),
          OutlinedButton.icon(
            onPressed: _openAddNoteSheet, // <-- changed
            icon: const Icon(Icons.note_add_outlined),
            label: const Text('Add Notes'),
          ),
          const SizedBox(width: 8),
          OutlinedButton.icon(
            onPressed: _openAddFollowUpSheet, // <-- changed
            icon: const Icon(Icons.flag_outlined),
            label: const Text('Add Follow-up'),
          ),
          // OutlinedButton.icon(
          //   onPressed: () {},
          //   icon: const Icon(Icons.note_add_outlined),
          //   label: const Text('Add Notes'),
          // ),
          // const SizedBox(width: 8),
          // OutlinedButton.icon(
          //   onPressed: () {},
          //   icon: const Icon(Icons.flag_outlined),
          //   label: const Text('Add Follow-up'),
          // ),
        ],
      ),
    );
  }

  Widget _leftInfo(Deal d) {
    Widget _tile(IconData i, String label, String value) => Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(i, size: 18, color: Colors.black87),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black87),
                children: [
                  TextSpan(
                    text: '$label: ',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  TextSpan(text: value),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    return SizedBox(
      width: 360,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 0, 16),
        children: [
          // Lead Details card
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Lead Details',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 12),
                  _tile(Icons.tag, 'Title', d.title),
                  _tile(
                    Icons.account_balance_wallet_outlined,
                    'Amount',
                    d.amount.toStringAsFixed(0),
                  ),
                  _tile(Icons.source, 'Source', 'RCO'), // placeholder
                  _tile(Icons.cases_outlined, 'Pipeline', widget.pipelineName),
                  _tile(Icons.label_important_outline, 'Stage', _stage.title),
                  _tile(
                    Icons.event_available,
                    'Closing Date',
                    _fmtDate(d.closeDate),
                  ),
                  _tile(Icons.person, 'Assigned To', d.owner),
                  _tile(Icons.notes, 'Description', 'NA'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Contact Details
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Contact Details',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 12),
                  _tile(Icons.person, 'Name', d.owner),
                  _tile(Icons.email_outlined, 'Email', 'sbillu93@gmail.com'),
                  _tile(Icons.phone_android, 'Phone', '9769175240'),
                  _tile(Icons.location_on_outlined, 'City', 'Navi Mumbai'),
                  _tile(Icons.flag_outlined, 'State', 'Maharashtra'),
                  _tile(Icons.home_outlined, 'Address', 'Koparkhairane'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Company Details
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Company Details',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 12),
                  _tile(Icons.apartment_outlined, 'Company', d.company),
                  _tile(Icons.badge_outlined, 'Customer Code', 'IGPL'),
                  _tile(Icons.location_city_outlined, 'City', 'Navi Mumbai'),
                  _tile(Icons.flag_outlined, 'State', 'Maharashtra'),
                  _tile(Icons.home_outlined, 'Address', 'Koparkhairane'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabsArea(Deal d) {
    return Column(
      children: [
        TabBar(
          controller: _tabs,
          isScrollable: true,
          labelColor: Colors.black,
          indicatorColor: Colors.green,
          tabs: [
            const Tab(text: 'Timeline'),
            Tab(text: 'Notes (${_notes.length})'),
            Tab(text: 'Follow-up (${_followUps.length})'),
          ],
        ),
        const Divider(height: 1),
        Expanded(
          child: TabBarView(
            controller: _tabs,
            children: [
              _timelineStub(),
              _notesList(),
              _followUpsList(),
              //_emptyStub('No notes yet.'),
              //_emptyStub('No follow-ups yet.'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _timelineStub() {
    Widget item(IconData ic, String title, String by, String when) => ListTile(
      leading: Icon(ic),
      title: Text(title),
      subtitle: Text('Added by $by'),
      trailing: Text(when, style: const TextStyle(color: Colors.grey)),
    );

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        item(
          Icons.flag_outlined,
          'Follow-up added',
          'Bilal Shaikh',
          'Tue, Jul 8',
        ),
        item(
          Icons.add_circle_outline,
          'New Lead added',
          'Bilal Shaikh',
          'Fri, Jun 20',
        ),
      ],
    );
  }

  Widget _emptyStub(String msg) =>
      Center(child: Text(msg, style: const TextStyle(color: Colors.grey)));
}

class _AddNoteForm extends StatefulWidget {
  final void Function(String title, String body) onSubmit;
  const _AddNoteForm({required this.onSubmit});

  @override
  State<_AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<_AddNoteForm> {
  final _key = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _body = TextEditingController();

  @override
  void dispose() {
    _title.dispose();
    _body.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: _title,
              decoration: const InputDecoration(
                labelText: 'Title (optional)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: TextFormField(
                controller: _body,
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(
                  labelText: 'Note',
                  border: OutlineInputBorder(),
                ),
                validator:
                    (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 44,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text('Save Note'),
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    widget.onSubmit(_title.text.trim(), _body.text.trim());
                    Navigator.of(context).pop();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AddFollowUpForm extends StatefulWidget {
  final void Function(String type, DateTime when, String desc, bool remind)
  onSubmit;
  const _AddFollowUpForm({required this.onSubmit});

  @override
  State<_AddFollowUpForm> createState() => _AddFollowUpFormState();
}

class _AddFollowUpFormState extends State<_AddFollowUpForm> {
  final _key = GlobalKey<FormState>();
  final _desc = TextEditingController();
  String _type = 'Call';
  DateTime _when = DateTime.now().add(const Duration(hours: 1));
  bool _remind = true;

  @override
  void dispose() {
    _desc.dispose();
    super.dispose();
  }

  Future<void> _pickDateTime() async {
    final d = await showDatePicker(
      context: context,
      initialDate: _when,
      firstDate: DateTime.now().subtract(const Duration(days: 1)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (d == null) return;
    final t = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_when),
    );
    if (t == null) return;
    setState(() {
      _when = DateTime(d.year, d.month, d.day, t.hour, t.minute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Type
            DropdownButtonFormField<String>(
              value: _type,
              items: const [
                DropdownMenuItem(value: 'Call', child: Text('Call')),
                DropdownMenuItem(value: 'Meeting', child: Text('Meeting')),
                DropdownMenuItem(value: 'WhatsApp', child: Text('WhatsApp')),
                DropdownMenuItem(value: 'Email', child: Text('Email')),
                DropdownMenuItem(value: 'Task', child: Text('Task')),
              ],
              onChanged: (v) => setState(() => _type = v ?? 'Call'),
              decoration: const InputDecoration(
                labelText: 'Type',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            // When
            InkWell(
              onTap: _pickDateTime,
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Date & Time',
                  border: OutlineInputBorder(),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.event),
                    const SizedBox(width: 8),
                    Text(_when.toString()),
                    const Spacer(),
                    const Icon(Icons.edit_calendar_outlined),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Description
            SizedBox(
              height: 200,
              child: TextFormField(
                controller: _desc,
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                validator:
                    (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
              ),
            ),
            const SizedBox(height: 12),

            // Reminder
            SwitchListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: const Text('Set reminder'),
              value: _remind,
              onChanged: (v) => setState(() => _remind = v),
            ),
            const SizedBox(height: 6),

            SizedBox(
              width: double.infinity,
              height: 44,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text('Save Follow-up'),
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    widget.onSubmit(_type, _when, _desc.text.trim(), _remind);
                    Navigator.of(context).pop();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
