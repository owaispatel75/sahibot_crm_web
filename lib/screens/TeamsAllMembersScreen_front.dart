import 'package:flutter/material.dart';
import 'package:sahibot_crm_web/widgets/sidebar.dart';
import 'package:sahibot_crm_web/widgets/team_Sidebar.dart';
import 'package:sahibot_crm_web/widgets/topbar.dart';

///--------------------------------------------------------------------------
///  SCREEN: All Members (frontend only; uses FakeApiService below)
///--------------------------------------------------------------------------
class TeamsAllMembersScreenF extends StatefulWidget {
  const TeamsAllMembersScreenF({Key? key}) : super(key: key);
  @override
  State<TeamsAllMembersScreenF> createState() => _TeamsAllMemberScreenFState();
}

class _TeamsAllMemberScreenFState extends State<TeamsAllMembersScreenF> {
  late Future<List<TeamMember>> _future;
  TeamMember? _selected;
  String _search = '';
  String _roleFilter = 'All';
  String _statusFilter = 'All';

  @override
  void initState() {
    super.initState();
    _future = FakeApiService.getTeamMembers();
  }

  void _refresh() => setState(() => _future = FakeApiService.getTeamMembers());

  void _openAddEditDrawer({TeamMember? existing}) {
    showGeneralDialog<bool>(
      context: context,
      barrierDismissible: true,
      barrierLabel: existing == null ? 'Add Member' : 'Edit Member',
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (c, a1, a2) => const SizedBox.shrink(),
      transitionBuilder: (c, anim, _, __) {
        final slide = Tween(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeOut)).animate(anim);
        return Align(
          alignment: Alignment.centerRight,
          child: SlideTransition(
            position: slide,
            child: Material(
              color: Colors.white,
              elevation: 12,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.42,
                height: double.infinity,
                child: AddTeamMemberDrawer(
                  existingMember: existing,
                  onSaved: () {
                    Navigator.of(context).pop(true);
                    _refresh();
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  List<TeamMember> _filtered(List<TeamMember> list) {
    final q = _search.trim().toLowerCase();
    return list.where((m) {
      final matchesQ =
          q.isEmpty ||
          m.name.toLowerCase().contains(q) ||
          m.email.toLowerCase().contains(q) ||
          m.mobile.contains(q);
      final matchesRole =
          _roleFilter == 'All'
              ? true
              : m.role.toLowerCase() == _roleFilter.toLowerCase();
      final matchesStatus =
          _statusFilter == 'All'
              ? true
              : (_statusFilter == 'Active' ? m.isActive == 1 : m.isActive == 0);
      return matchesQ && matchesRole && matchesStatus;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _T.pageBg,
      // appBar: AppBar(
      //   title: const Text('All Members'),
      //   backgroundColor: Colors.white,
      //   surfaceTintColor: Colors.transparent,
      // ),
      body: Stack(
        children: [
          Row(
            children: [
              const Sidebar(),
              const TeamSidebar(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 64),
                  child: FutureBuilder<List<TeamMember>>(
                    future: _future,
                    builder: (ctx, snap) {
                      if (snap.connectionState != ConnectionState.done) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snap.hasError) {
                        return Center(child: Text('Error: ${snap.error}'));
                      }

                      final members = _filtered(snap.data!);
                      return Column(
                        children: [
                          _HeaderBar(
                            onAdd: () => _openAddEditDrawer(),
                            onSearch: (v) => setState(() => _search = v),
                            onRoleFilter:
                                (v) => setState(() => _roleFilter = v),
                            onStatusFilter:
                                (v) => setState(() => _statusFilter = v),
                            totalCount: members.length,
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            child: AllMemberTeamTable(
                              members: members,
                              selected: _selected,
                              onTap:
                                  (m) => setState(
                                    () => _selected = _selected == m ? null : m,
                                  ),
                              onStatusChanged: (updated) async {
                                final ok =
                                    await FakeApiService.updateUserStatus(
                                      updated.id,
                                      updated.isActive,
                                    );
                                if (!mounted) return;
                                if (!ok) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Couldn’t update status'),
                                    ),
                                  );
                                } else {
                                  _refresh();
                                }
                              },
                              onEdit: (m) => _openAddEditDrawer(existing: m),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          const Positioned(top: 0, left: 0, right: 0, child: TopBar()),
        ],
      ),
    );
  }
}

///--------------------------------------------------------------------------
///  HEADER (actions, filters, count)
///--------------------------------------------------------------------------
class _HeaderBar extends StatelessWidget {
  final VoidCallback onAdd;
  final ValueChanged<String> onSearch;
  final ValueChanged<String> onRoleFilter;
  final ValueChanged<String> onStatusFilter;
  final int totalCount;

  const _HeaderBar({
    required this.onAdd,
    required this.onSearch,
    required this.onRoleFilter,
    required this.onStatusFilter,
    required this.totalCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: _T.br)),
      ),
      child: Wrap(
        spacing: 12,
        runSpacing: 8,
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: onAdd,
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text(
                  'Member',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: _T.blue),
              ),
              const SizedBox(width: 12),
              SizedBox(
                width: 260,
                child: TextField(
                  onChanged: onSearch,
                  decoration: InputDecoration(
                    hintText: 'Search user, email or mobile',
                    prefixIcon: const Icon(Icons.search),
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _Dropdown<String>(
                label: 'Role',
                items: const ['All', 'Admin', 'Manager', 'User'],
                onChanged: onRoleFilter,
              ),
              const SizedBox(width: 8),
              _Dropdown<String>(
                label: 'Status',
                items: const ['All', 'Active', 'Inactive'],
                onChanged: onStatusFilter,
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: _T.lightBlueBg,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: _T.br),
                ),
                child: Text(
                  '$totalCount Members',
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Dropdown<T> extends StatefulWidget {
  final String label;
  final List<T> items;
  final ValueChanged<T> onChanged;
  const _Dropdown({
    required this.label,
    required this.items,
    required this.onChanged,
    super.key,
  });
  @override
  State<_Dropdown<T>> createState() => _DropdownState<T>();
}

class _DropdownState<T> extends State<_Dropdown<T>> {
  late T _value;
  @override
  void initState() {
    super.initState();
    _value = widget.items.first;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: DropdownButtonFormField<T>(
        value: _value,
        items:
            widget.items
                .map((e) => DropdownMenuItem<T>(value: e, child: Text('$e')))
                .toList(),
        onChanged: (v) {
          if (v == null) return;
          setState(() => _value = v);
          widget.onChanged(v);
        },
        decoration: InputDecoration(
          isDense: true,
          labelText: widget.label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}

///--------------------------------------------------------------------------
///  TABLE
///--------------------------------------------------------------------------
class AllMemberTeamTable extends StatelessWidget {
  final List<TeamMember> members;
  final TeamMember? selected;
  final ValueChanged<TeamMember> onTap;
  final ValueChanged<TeamMember> onEdit;
  final ValueChanged<TeamMember> onStatusChanged;

  const AllMemberTeamTable({
    super.key,
    required this.members,
    this.selected,
    required this.onTap,
    required this.onEdit,
    required this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Table(
          border: TableBorder.all(color: _T.br),
          columnWidths: const {
            0: FlexColumnWidth(3), // user
            1: FlexColumnWidth(2), // mobile
            2: FlexColumnWidth(2), // reports to
            3: FlexColumnWidth(1), // role
            4: FlexColumnWidth(1), // status
            5: FlexColumnWidth(1), // actions
          },
          children: [_headerRow(), for (final m in members) _row(context, m)],
        ),
      ],
    );
  }

  TableRow _headerRow() => TableRow(
    decoration: BoxDecoration(color: _T.lightBlueBg),
    children: [
      _cellHead('User'),
      _cellHead('Mobile'),
      _cellHead('Reports To'),
      _cellHead('Role'),
      _cellHead('Status'),
      _cellHead('Actions'),
    ],
  );

  TableRow _row(BuildContext ctx, TeamMember m) => TableRow(
    children: [
      _cell(
        GestureDetector(
          onTap: () => onTap(m),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                m.name,
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 2),
              Text(m.email, style: const TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ),
      _cell(Text(mobilePretty(m.mobile))),
      _cell(Text(m.reportsTo)),
      _cell(
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: _T.lightBlueBg,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(m.role, style: const TextStyle(fontSize: 12)),
        ),
      ),
      _cell(
        Switch(
          value: m.isActive == 1,
          onChanged: (v) => onStatusChanged(m.copyWith(isActive: v ? 1 : 0)),
        ),
      ),
      _cell(
        Row(
          children: [
            IconButton(
              tooltip: 'Edit',
              icon: const Icon(Icons.edit),
              color: _T.blue,
              onPressed: () => onEdit(m),
            ),
          ],
        ),
      ),
    ],
  );

  String mobilePretty(String s) {
    final d = s.replaceAll(RegExp(r'\D'), '');
    if (d.length == 10) {
      return '(${d.substring(0, 3)}) ${d.substring(3, 6)}-${d.substring(6)}';
    }
    return s;
  }

  TableCell _cellHead(String label) => TableCell(
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.w700)),
    ),
  );

  TableCell _cell(Widget child) => TableCell(
    child: Padding(padding: const EdgeInsets.all(12), child: child),
  );
}

///--------------------------------------------------------------------------
///  ADD / EDIT DRAWER (right slide)
///--------------------------------------------------------------------------
class AddTeamMemberDrawer extends StatefulWidget {
  final TeamMember? existingMember;
  final VoidCallback onSaved;
  const AddTeamMemberDrawer({
    super.key,
    this.existingMember,
    required this.onSaved,
  });

  @override
  State<AddTeamMemberDrawer> createState() => _AddTeamMemberDrawerState();
}

class _AddTeamMemberDrawerState extends State<AddTeamMemberDrawer> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameCtl;
  late final TextEditingController _emailCtl;
  late final TextEditingController _mobileCtl;
  late final TextEditingController _reportsToCtl;
  String _role = 'User';
  bool _saving = false;

  String countryCode = '+971';

  @override
  void initState() {
    super.initState();
    final e = widget.existingMember;
    _nameCtl = TextEditingController(text: e?.name ?? '');
    _emailCtl = TextEditingController(text: e?.email ?? '');
    _mobileCtl = TextEditingController(text: e?.mobile ?? '');
    _reportsToCtl = TextEditingController(text: e?.reportsTo ?? '');
    _role = e?.role ?? 'User';
  }

  @override
  void dispose() {
    _nameCtl.dispose();
    _emailCtl.dispose();
    _mobileCtl.dispose();
    _reportsToCtl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);

    final payload = {
      'name': _nameCtl.text.trim(),
      'email': _emailCtl.text.trim(),
      'mobile': _mobileCtl.text.trim(),
      'reportsTo': _reportsToCtl.text.trim(),
      'role': _role,
    };

    try {
      if (widget.existingMember == null) {
        await FakeApiService.createTeamMember(payload);
      } else {
        await FakeApiService.updateTeamMember(
          widget.existingMember!.id,
          payload,
        );
      }
      widget.onSaved();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Save failed: $e')));
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.existingMember != null;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                isEdit ? 'Edit Team Member' : 'Add Team Member',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () => Navigator.pop(context, false),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const Divider(height: 1),
          const SizedBox(height: 8),
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _tf(_nameCtl, 'Full Name'),
                    const SizedBox(height: 12),
                    _tf(
                      _emailCtl,
                      'Email',
                      keyboardType: TextInputType.emailAddress,
                      validator:
                          (v) =>
                              (v == null || !v.contains('@'))
                                  ? 'Enter a valid email'
                                  : null,
                    ),
                    const SizedBox(height: 12),
                    // _tf(
                    //   _mobileCtl,
                    //   'Mobile / WhatsApp',
                    //   keyboardType: TextInputType.phone,
                    // ),
                    Row(
                      children: [
                        SizedBox(
                          width: 180,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DropdownButtonFormField<String>(
                                hint: Text("Country Code"),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                                value: countryCode,
                                items: const [
                                  DropdownMenuItem(
                                    value: '+91',
                                    child: Text('+91'),
                                  ),
                                  DropdownMenuItem(
                                    value: '+971',
                                    child: Text('+971'),
                                  ),
                                ],
                                onChanged:
                                    (val) => setState(
                                      () => countryCode = val ?? '+91',
                                    ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _buildTextField(
                            'Whatsapp Number',
                            dense: true,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _tf(_reportsToCtl, 'Reports To'),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<String>(
                      value: _role,
                      items:
                          const ['Admin', 'Manager', 'User']
                              .map(
                                (r) =>
                                    DropdownMenuItem(value: r, child: Text(r)),
                              )
                              .toList(),
                      onChanged: (v) => setState(() => _role = v ?? 'User'),
                      decoration: const InputDecoration(
                        labelText: 'Role',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel'),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: _saving ? null : _save,
                child:
                    _saving
                        ? const SizedBox(
                          height: 16,
                          width: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                        : Text(isEdit ? 'Save Changes' : 'Add Member'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String hint, {bool dense = false}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: hint,
        isDense: dense,
        border: const OutlineInputBorder(),
      ),
    );
  }

  Widget _tf(
    TextEditingController c,
    String label, {
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: c,
      keyboardType: keyboardType,
      validator:
          validator ??
          (v) => (v == null || v.trim().isEmpty) ? 'Enter $label' : null,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}

///--------------------------------------------------------------------------
///  MODEL + FAKE API SERVICE (in-memory)
///--------------------------------------------------------------------------
class TeamMember {
  final int id;
  final String name;
  final String email;
  final String mobile;
  final String role;
  final int isActive; // 1 active, 0 inactive
  final String reportsTo;

  TeamMember({
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
    required this.role,
    required this.isActive,
    required this.reportsTo,
  });

  TeamMember copyWith({
    int? id,
    String? name,
    String? email,
    String? mobile,
    String? role,
    int? isActive,
    String? reportsTo,
  }) {
    return TeamMember(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      role: role ?? this.role,
      isActive: isActive ?? this.isActive,
      reportsTo: reportsTo ?? this.reportsTo,
    );
  }
}

class FakeApiService {
  static final List<TeamMember> _db = [
    TeamMember(
      id: 1,
      name: 'Bilal Shaikh',
      email: 'bilal@sahibot.com',
      mobile: '9769175240',
      role: 'Admin',
      isActive: 1,
      reportsTo: '—',
    ),
    TeamMember(
      id: 2,
      name: 'Owais Patel',
      email: 'owais@sahibot.com',
      mobile: '9876543210',
      role: 'Manager',
      isActive: 1,
      reportsTo: 'Bilal Shaikh',
    ),
    TeamMember(
      id: 3,
      name: 'Aisha Khan',
      email: 'aisha@sahibot.com',
      mobile: '9090909090',
      role: 'User',
      isActive: 0,
      reportsTo: 'Owais Patel',
    ),
    TeamMember(
      id: 4,
      name: 'Ravi Verma',
      email: 'ravi@sahibot.com',
      mobile: '9988776655',
      role: 'User',
      isActive: 1,
      reportsTo: 'Owais Patel',
    ),
    TeamMember(
      id: 5,
      name: 'Sarah Ali',
      email: 'sarah@sahibot.com',
      mobile: '9123456780',
      role: 'Manager',
      isActive: 1,
      reportsTo: 'Bilal Shaikh',
    ),
  ];
  static int _nextId = 6;

  static Future<List<TeamMember>> getTeamMembers() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return List.of(_db);
  }

  static Future<bool> updateUserStatus(int id, int isActive) async {
    await Future.delayed(const Duration(milliseconds: 150));
    final i = _db.indexWhere((e) => e.id == id);
    if (i == -1) return false;
    _db[i] = _db[i].copyWith(isActive: isActive);
    return true;
  }

  static Future<void> createTeamMember(Map<String, dynamic> payload) async {
    await Future.delayed(const Duration(milliseconds: 250));
    _db.insert(
      0,
      TeamMember(
        id: _nextId++,
        name: payload['name'] ?? '',
        email: payload['email'] ?? '',
        mobile: payload['mobile'] ?? '',
        role: (payload['role'] ?? 'User') as String,
        isActive: 1,
        reportsTo: payload['reportsTo'] ?? '—',
      ),
    );
  }

  static Future<void> updateTeamMember(
    int id,
    Map<String, dynamic> payload,
  ) async {
    await Future.delayed(const Duration(milliseconds: 250));
    final i = _db.indexWhere((e) => e.id == id);
    if (i == -1) return;
    _db[i] = _db[i].copyWith(
      name: payload['name'],
      email: payload['email'],
      mobile: payload['mobile'],
      role: payload['role'],
      reportsTo: payload['reportsTo'],
    );
  }
}

///--------------------------------------------------------------------------
///  Tiny palette
///--------------------------------------------------------------------------
class _T {
  static const pageBg = Color(0xFFF6F8FB);
  static const blue = Color(0xFF2563EB);
  static const lightBlueBg = Color(0xFFEFF6FF);
  static const br = Color(0xFFE5E7EB);
}
