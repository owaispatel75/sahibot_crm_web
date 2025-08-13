import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class TeamsUserAccessScreenF extends StatefulWidget {
  const TeamsUserAccessScreenF({Key? key}) : super(key: key);

  @override
  State<TeamsUserAccessScreenF> createState() => _TeamsUserAccessScreenFState();
}

class _TeamsUserAccessScreenFState extends State<TeamsUserAccessScreenF> {
  late Future<List<TeamMember>> _future;
  TeamMember? _selected;
  String _query = '';

  @override
  void initState() {
    super.initState();
    _future = ApiServiceFake.getTeamMembers();
  }

  void _refresh() => setState(() => _future = ApiServiceFake.getTeamMembers());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: const [
              Sidebar(),
              TeamSidebar(),
            ],
          ),
          // content
          Padding(
            padding: const EdgeInsets.only(left: 280.0, top: 64), // space for sidebars & topbar
            child: Column(
              children: [
                _header(),
                const SizedBox(height: 8),
                Expanded(
                  child: FutureBuilder<List<TeamMember>>(
                    future: _future,
                    builder: (ctx, snap) {
                      if (snap.connectionState != ConnectionState.done) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snap.hasError) {
                        return Center(child: Text('Error: ${snap.error}'));
                      }
                      final members = snap.data!;
                      final filtered = _query.isEmpty
                          ? members
                          : members
                              .where((m) =>
                                  m.name.toLowerCase().contains(_query) ||
                                  m.email.toLowerCase().contains(_query) ||
                                  m.role.toLowerCase().contains(_query))
                              .toList();
                      return AccessControlTable(
                        members: filtered,
                        selected: _selected,
                        onSelectMember: (m) =>
                            setState(() => _selected = _selected == m ? null : m),
                        onStatusToggled: (m, isActive) async {
                          final ok = await ApiServiceFake.updateUserStatus(m.id, isActive ? 1 : 0);
                          if (!ok) {
                            if (!mounted) return;
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Couldn't update status")),
                            );
                          } else {
                            _refresh();
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const Positioned(top: 0, left: 0, right: 0, child: TopBar()),
        ],
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Row(
        children: [
          ElevatedButton.icon(
            onPressed: _refresh,
            style: ElevatedButton.styleFrom(backgroundColor: AppCustomTheme.bluePrimary),
            icon: const Icon(Icons.refresh, color: Colors.white),
            label: const Text('Refresh', style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 260,
            child: TextField(
              onChanged: (v) => setState(() => _query = v.trim().toLowerCase()),
              decoration: InputDecoration(
                hintText: 'Search user / email / role',
                prefixIcon: const Icon(Icons.search),
                isDense: true,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: AppCustomTheme.lightBlueBg,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: AppCustomTheme.lightgrayBg),
            ),
            child: FutureBuilder<List<TeamMember>>(
              future: _future,
              builder: (_, s) {
                final n = (s.data ?? const []).length;
                return Text('$n Members',
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold));
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// ----------------------------- ACCESS TABLE -----------------------------
class AccessControlTable extends StatefulWidget {
  final List<TeamMember> members;
  final TeamMember? selected;
  final ValueChanged<TeamMember> onSelectMember;
  final Future<void> Function(TeamMember member, bool isActive) onStatusToggled;

  const AccessControlTable({
    Key? key,
    required this.members,
    required this.selected,
    required this.onSelectMember,
    required this.onStatusToggled,
  }) : super(key: key);

  @override
  State<AccessControlTable> createState() => _AccessControlTableState();
}

class _AccessControlTableState extends State<AccessControlTable> {
  late Future<Map<int, PermissionSet>> _permsFuture;
  Map<int, PermissionSet> _perms = {};

  static const modules = <String>[
    'Dashboard',
    'Contacts',
    'Parties',
    'Pipelines',
    'Products',
    'Activities',
    'Follow-ups',
    'Billing',
    'Customize',
    'Teams',
  ];

  @override
  void initState() {
    super.initState();
    _permsFuture = _loadPerms();
  }

  Future<Map<int, PermissionSet>> _loadPerms() async {
    final list = await ApiServiceFake.getPermissions();
    final by = {for (final p in list) p.userId: p};
    _perms = by;
    return by;
  }

  Future<void> _save(int userId) async {
    final set = _perms[userId];
    if (set == null) return;
    await ApiServiceFake.savePermissions(set);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Permissions saved')));
  }

  Widget _headerCell(String txt) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(txt, style: const TextStyle(fontWeight: FontWeight.w700)),
      );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<int, PermissionSet>>(
      future: _permsFuture,
      builder: (ctx, snap) {
        if (snap.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snap.hasError) {
          return Center(child: Text('Error: ${snap.error}'));
        }
        // ensure local cache if first time
        _perms = snap.data ?? {};

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Table(
              border: TableBorder.all(color: Colors.grey.shade300),
              columnWidths: const {
                0: FlexColumnWidth(3),
                1: FlexColumnWidth(2),
                2: FlexColumnWidth(1),
                3: FlexColumnWidth(1),
              },
              children: [
                TableRow(
                  decoration: BoxDecoration(color: AppCustomTheme.lightBlueBg),
                  children: [
                    _headerCell('User'),
                    _headerCell('Role'),
                    _headerCell('Active'),
                    _headerCell('Manage'),
                  ],
                ),
                for (final m in widget.members) ...[
                  TableRow(
                    children: [
                      _cell(
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(m.name,
                                style: const TextStyle(
                                    color: Colors.blue, fontWeight: FontWeight.w700)),
                            const SizedBox(height: 2),
                            Text(m.email, style: const TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),
                      _cell(_roleChip(m.role)),
                      _cell(
                        Switch(
                          value: m.isActive == 1,
                          onChanged: (v) => widget.onStatusToggled(m, v),
                        ),
                      ),
                      _cell(
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton.icon(
                            onPressed: () => widget.onSelectMember(m),
                            icon: Icon(
                              widget.selected == m ? Icons.expand_less : Icons.tune,
                              size: 18,
                            ),
                            label: Text(widget.selected == m ? 'Hide' : 'Manage'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (widget.selected == m)
                    TableRow(
                      children: [
                        _cellSpan(
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 14.0),
                            child: _permissionsEditor(m),
                          ),
                          span: 4,
                        ),
                      ],
                    ),
                ],
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _permissionsEditor(TeamMember m) {
    final current = _perms[m.id] ?? PermissionSet.blankFor(m.id, modules);

    void update(void Function() fn) {
      setState(() {
        fn();
        _perms[m.id] = current;
      });
    }

    Widget scopeRadio(String label, AccessScope scope) {
      return Expanded(
        child: RadioListTile<AccessScope>(
          value: scope,
          groupValue: current.scope,
          dense: true,
          onChanged: (v) => update(() => current.scope = v ?? current.scope),
          title: Text(label),
        ),
      );
    }

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Scope
            const Text('Access Scope',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
            const SizedBox(height: 4),
            Row(
              children: [
                scopeRadio('All', AccessScope.all),
                scopeRadio('My Team', AccessScope.team),
                scopeRadio('Only Me', AccessScope.me),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(height: 1),
            const SizedBox(height: 10),

            // Matrix header
            Row(
              children: const [
                Expanded(flex: 3, child: Text('Module', style: _hdrStyle)),
                Expanded(child: Text('View', style: _hdrStyle)),
                Expanded(child: Text('Create', style: _hdrStyle)),
                Expanded(child: Text('Edit', style: _hdrStyle)),
                Expanded(child: Text('Delete', style: _hdrStyle)),
              ],
            ),
            const SizedBox(height: 6),
            // Rows
            for (final mod in modules) ...[
              const Divider(height: 1),
              _permRow(
                label: mod,
                p: current.module(mod),
                onChanged: (np) => update(() => current.setModule(mod, np)),
              ),
            ],
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () => _save(m.id),
                icon: const Icon(Icons.save),
                label: const Text('Save Permissions'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _permRow({
    required String label,
    required ModulePermission p,
    required ValueChanged<ModulePermission> onChanged,
  }) {
    Widget cb(bool v, ValueChanged<bool> set) => Checkbox(
          value: v,
          onChanged: (x) => onChanged(p.copyWith(
            view: set == ((_) {}) ? p.view : (set == ((_) {}) ? p.view : v),
          )),
        );

    // simpler: individual handlers
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
            )),
        Expanded(
          child: Center(
            child: Checkbox(
              value: p.view,
              onChanged: (v) => onChanged(p.copyWith(view: v ?? false)),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Checkbox(
              value: p.create,
              onChanged: (v) => onChanged(p.copyWith(create: v ?? false)),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Checkbox(
              value: p.edit,
              onChanged: (v) => onChanged(p.copyWith(edit: v ?? false)),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Checkbox(
              value: p.delete,
              onChanged: (v) => onChanged(p.copyWith(delete: v ?? false)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _cell(Widget child) =>
      Padding(padding: const EdgeInsets.all(12.0), child: child);

  Widget _cellSpan(Widget child, {required int span}) => TableCell(
        verticalAlignment: TableCellVerticalAlignment.fill,
        child: Container(
          padding: const EdgeInsets.all(0),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey.shade300))),
          child: child,
        ),
      );

  Widget _roleChip(String role) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: AppCustomTheme.lightBlueBg,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(role, style: const TextStyle(fontSize: 12)),
      );
}

const _hdrStyle = TextStyle(fontWeight: FontWeight.w800);

/// ----------------------------- MODELS -----------------------------
class TeamMember {
  final int id;
  final String name;
  final String email;
  final int mobile;
  final String role;
  final int isActive;

  const TeamMember({
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
    required this.role,
    required this.isActive,
  });

  TeamMember copyWith({int? isActive}) => TeamMember(
        id: id,
        name: name,
        email: email,
        mobile: mobile,
        role: role,
        isActive: isActive ?? this.isActive,
      );
}

enum AccessScope { all, team, me }

class ModulePermission {
  final bool view;
  final bool create;
  final bool edit;
  final bool delete;

  const ModulePermission({
    required this.view,
    required this.create,
    required this.edit,
    required this.delete,
  });

  ModulePermission copyWith({bool? view, bool? create, bool? edit, bool? delete}) =>
      ModulePermission(
        view: view ?? this.view,
        create: create ?? this.create,
        edit: edit ?? this.edit,
        delete: delete ?? this.delete,
      );

  static const none = ModulePermission(view: false, create: false, edit: false, delete: false);
  static const read = ModulePermission(view: true, create: false, edit: false, delete: false);
}

class PermissionSet {
  final int userId;
  AccessScope scope;
  final Map<String, ModulePermission> _byModule;

  PermissionSet({
    required this.userId,
    required this.scope,
    required Map<String, ModulePermission> byModule,
  }) : _byModule = Map<String, ModulePermission>.from(byModule);

  ModulePermission module(String name) => _byModule[name] ?? ModulePermission.none;
  void setModule(String name, ModulePermission p) => _byModule[name] = p;

  static PermissionSet blankFor(int userId, List<String> modules) => PermissionSet(
        userId: userId,
        scope: AccessScope.me,
        byModule: {for (final m in modules) m: ModulePermission.none},
      );

  PermissionSet copy() => PermissionSet(
        userId: userId,
        scope: scope,
        byModule: Map.of(_byModule),
      );
}

/// ----------------------------- FAKE API -----------------------------
class ApiServiceFake {
  static final List<TeamMember> _members = [
    const TeamMember(
      id: 1,
      name: 'Bilal Shaikh',
      email: 'sbillu93@gmail.com',
      mobile: 9769175240,
      role: 'Admin',
      isActive: 1,
    ),
    const TeamMember(
      id: 2,
      name: 'Owais Patel',
      email: 'owais@zylker.com',
      mobile: 9876501234,
      role: 'Manager',
      isActive: 1,
    ),
    const TeamMember(
      id: 3,
      name: 'Aria Gupta',
      email: 'aria@zylker.com',
      mobile: 9988776655,
      role: 'User',
      isActive: 0,
    ),
  ];

  static final Map<int, PermissionSet> _perms = {
    1: PermissionSet(
      userId: 1,
      scope: AccessScope.all,
      byModule: {
        for (final m in _modules)
          m: const ModulePermission(view: true, create: true, edit: true, delete: true),
      },
    ),
    2: PermissionSet(
      userId: 2,
      scope: AccessScope.team,
      byModule: {
        'Dashboard': ModulePermission.read,
        'Contacts': const ModulePermission(view: true, create: true, edit: true, delete: false),
        'Parties': const ModulePermission(view: true, create: true, edit: false, delete: false),
        'Pipelines': const ModulePermission(view: true, create: true, edit: true, delete: false),
        'Products': ModulePermission.read,
        'Activities': const ModulePermission(view: true, create: true, edit: false, delete: false),
        'Follow-ups': ModulePermission.read,
        'Billing': ModulePermission.none,
        'Customize': ModulePermission.none,
        'Teams': ModulePermission.none,
      },
    ),
    3: PermissionSet.blankFor(3, _modules),
  };

  static const _modules = <String>[
    'Dashboard',
    'Contacts',
    'Parties',
    'Pipelines',
    'Products',
    'Activities',
    'Follow-ups',
    'Billing',
    'Customize',
    'Teams',
  ];

  static Future<List<TeamMember>> getTeamMembers() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return List<TeamMember>.from(_members);
  }

  static Future<List<PermissionSet>> getPermissions() async {
    await Future.delayed(const Duration(milliseconds: 150));
    return _perms.values.map((e) => e.copy()).toList();
  }

  static Future<bool> savePermissions(PermissionSet set) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _perms[set.userId] = set.copy();
    return true;
  }

  static Future<bool> updateUserStatus(int userId, int isActive) async {
    await Future.delayed(const Duration(milliseconds: 150));
    final i = _members.indexWhere((m) => m.id == userId);
    if (i == -1) return false;
    _members[i] = _members[i].copyWith(isActive: isActive);
    return true;
  }
}

/// ----------------------------- STUB UI PARTS (safe to replace) -----------------------------
class AppCustomTheme {
  static const bluePrimary = Color(0xFF2563EB);
  static const lightBlueBg = Color(0xFFEFF6FF);
  static final lightgrayBg = Colors.grey.shade300;
}

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      height: 64,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      //color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/logo.png', // Replace with your logo
            height: 30,
          ),
          const SizedBox(width: 24),
          const SizedBox(
            width: 400,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search (CTRL/CMD+K)',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide.none,
                ),
                fillColor: Color(0xFFF1F3F4),
                filled: true,
                isDense: true,
              ),
            ),
          ),
          const SizedBox(width: 24),
          Row(
            children: [
              const Icon(Icons.notifications, color: Colors.grey),
              const SizedBox(width: 16),
              const CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("BS", style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(width: 8),
              const Text("Bilal\nManager", style: TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouterState.of(context).uri.toString();

    final isLeadsSectionActive =
        currentLocation.startsWith('/pipelines') ||
        currentLocation.startsWith('/contacts') ||
        currentLocation.startsWith('/parties') ||
        currentLocation.startsWith('/followup') ||
        currentLocation.startsWith('/products') ||
        currentLocation.startsWith('/activities');

    final isTeamsSectionActive =
        currentLocation.startsWith('/team') ||
        currentLocation.startsWith('/useraccess') || currentLocation.startsWith('/customize');    
    
    final isBillingSectionActive =
        currentLocation.startsWith('/billing');

    return Container(
      width: 65,
      margin: EdgeInsets.all(0),
      color: AppCustomTheme.bluePrimary,
      child: Column(
        children: [
          // const SizedBox(height: 0),
          // Logo
          // Padding(
          //   padding: const EdgeInsets.all(10.0),
          //   child: Image.asset('assets/logo.png', height: 40),
          // ),
          const SizedBox(height: 60),
          _buildMenuItem(
            context,
            route: '/',
            icon: Icons.grid_view,
            label: 'My Apps',
            isSelected: currentLocation == '/',
            isTop: true,
          ),
          const SizedBox(height: 8),
          _buildMenuItem(
            context,
            route: '/pipelines',
            icon: Icons.bar_chart,
            label: 'Pipelines',
            // isSelected: currentLocation == '/leads',
            isSelected: isLeadsSectionActive,
          ),
          // _buildMenuItem(
          //   context,
          //   route: '/links',
          //   icon: Icons.link,
          //   label: 'Links',
          //   isSelected: currentLocation == '/links',
          // ),
          // _buildMenuItem(
          //   context,
          //   route: '/team',
          //   icon: Icons.groups,
          //   label: 'Team',
          //   isSelected: currentLocation == '/team',
          // ),
          // const Divider(color: Colors.white),
          // _buildMenuItem(
          //   context,
          //   route: '/settings',
          //   icon: Icons.settings,
          //   label: 'Settings',
          //   isSelected: currentLocation == '/settings',
          // ),
          // _buildMenuItem(
          //   context,
          //   route: '/support',
          //   icon: Icons.help,
          //   label: 'Support',
          //   isSelected: currentLocation == '/support',
          // ),
          // _buildMenuItem(
          //   context,
          //   route: '/billing',
          //   icon: Icons.receipt_long,
          //   label: 'Billing',
          //   isSelected: currentLocation == '/billing',
          // ),
          _buildMenuItem(
            context,
            route: '/team',
            icon: Icons.groups,
            label: 'Team',
            isSelected: isTeamsSectionActive,
            //isSelected: currentLocation == '/team',
          ),
          _buildMenuItem(
            context,
            route: '/billing',
            icon: Icons.receipt_long,
            label: 'Billing',
            isSelected: isBillingSectionActive
            // isSelected: currentLocation == '/billing',
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required String route,
    required IconData icon,
    required String label,
    required bool isSelected,
    bool isTop = false,
  }) {
    final bgColor = isSelected ? Colors.white : AppCustomTheme.bluePrimary;
    final iconColor = isSelected ? AppCustomTheme.bluePrimary : Colors.white;
    final textColor = iconColor;

    return InkWell(
      onTap: () {
        final currentLocation = GoRouterState.of(context).uri.toString();
        if (currentLocation != route) {
          context.go(route);
        }
      },
      child: Container(
        width: double.infinity,
        color: bgColor,
        padding: const EdgeInsets.symmetric(vertical: 16),
        // decoration: BoxDecoration(
        //   border: Border.all(color: AppCustomTheme.yellowPrimary),
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 20),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(color: textColor, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class TeamSidebar extends StatelessWidget {
  const TeamSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentPath = GoRouterState.of(context).uri.toString();

    // final isTeamsSectionActive =
    //     currentPath.startsWith('/teams') ||
    //     currentPath.startsWith('/useraccess') ||currentPath.startsWith('/customize') ;

    return Container(
      width: 180,
      color: AppCustomTheme.lightBlueBg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 64),
          // _menuItem(
          //   context,
          //   label: 'Dashboard',
          //   icon: Icons.dashboard,
          //   // route: '/pipelines/dashboard',
          //   route: '/dashboard',
          //   isSelected: currentPath == '/dashboard',
          //   // isSelected: currentPath == '/pipelines/dashboard',
          // ),
          // _menuItem(
          //   context,
          //   label: 'Pipelines',
          //   icon: Icons.filter_alt,
          //   route: '/pipelines',
          //   isSelected: currentPath == '/pipelines',
          // ),
          // _menuItem(
          //   context,
          //   label: 'Contacts',
          //   icon: Icons.contacts,
          //   route: '/contacts',
          //   // Highlight if path is '/contacts' or starts with '/contacts/'
          //   isSelected:
          //       currentPath == '/contacts' ||
          //       currentPath.startsWith('/contacts/'),
          //   // isSelected: currentPath == '/contacts',
          // ),
          // _menuItem(
          //   context,
          //   label: 'Parties',
          //   icon: Icons.apartment,
          //   route: '/parties',
          //   isSelected:
          //       currentPath == '/parties' ||
          //       currentPath.startsWith('/parties/'),
          //   // isSelected: currentPath == '/parties',
          // ),
          _menuItem(
            context,
            label: 'All Members',
            icon: Icons.directions_run,
            route: '/team',
            //isSelected: isTeamsSectionActive,
            isSelected: currentPath == '/team',
          ),
          _menuItem(
            context,
            label: 'User Access',
            icon: Icons.directions_run,
            route: '/useraccess',
            isSelected: currentPath == '/useraccess',
          ),
          _menuItem(
            context,
            label: 'Customize',
            icon: Icons.directions_run,
            route: '/customize',
            isSelected: currentPath == '/customize',
          ),

          // _menuItem(
          //   context,
          //   label: 'Sales Team',
          //   icon: Icons.person,
          //   route: '/team',
          //   isSelected: currentPath == '/team',
          // ),
          // _menuItem(
          //   context,
          //   label: 'User Roles',
          //   icon: Icons.shopping_cart,
          //   route: '/userroles',
          //   isSelected: currentPath == '/userroles',
          //   // isSelected:
          //   //     currentPath == '/products' ||
          //   //     currentPath.startsWith('/products/'),
          // ),
          // _menuItem(
          //   context,
          //   label: 'All Members',
          //   icon: Icons.directions_run,
          //   route: '/allmembers',
          //   isSelected: currentPath == '/allmembers',
          // ),
        ],
      ),
    );
  }

  Widget _menuItem(
    BuildContext context, {
    required String label,
    required IconData icon,
    required String route,
    required bool isSelected,
  }) {
    return InkWell(
      onTap: () => context.go(route),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        color: isSelected ? AppCustomTheme.lightBlueBg : Colors.transparent,
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? AppCustomTheme.bluePrimary : Colors.black54,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  color:
                      isSelected ? AppCustomTheme.bluePrimary : Colors.black87,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
