import 'package:flutter/material.dart';
import 'package:sahibot_crm_web/config/app_theme.dart';
import 'package:sahibot_crm_web/widgets/AddContactDrawer.dart';

/// ===================== CONTACTS TAB (for Parties) =====================
/// Looks/behaves like your Contacts list: search, table, hover eye icon.
class ContactsTab extends StatefulWidget {
  final String partyName;
  const ContactsTab({super.key, required this.partyName});

  @override
  State<ContactsTab> createState() => _ContactsTabState();
}

class _ContactsTabState extends State<ContactsTab> {
  final TextEditingController _search = TextEditingController();
  int? _hoveredRow;

  // Demo data – replace with backend later
  final List<_PartyContactRow> _rows = const [
    _PartyContactRow(
      name: 'Bilal Shaikh',
      email: 'sbillu93@gmail.com',
      phone: '9769175240',
      tags: 'VIP',
      createdBy: 'Owais',
    ),
    _PartyContactRow(
      name: 'Owais Patel',
      email: 'owais@zylker.com',
      phone: '9876501234',
      tags: 'Owner',
      createdBy: 'Bilal',
    ),
    _PartyContactRow(
      name: 'Asha Iyer',
      email: 'asha@zylker.com',
      phone: '9988776655',
      tags: 'Sales',
      createdBy: 'Owais',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final query = _search.text.trim().toLowerCase();
    final filtered =
        query.isEmpty
            ? _rows
            : _rows
                .where(
                  (r) =>
                      r.name.toLowerCase().contains(query) ||
                      r.email.toLowerCase().contains(query) ||
                      r.phone.toLowerCase().contains(query) ||
                      r.tags.toLowerCase().contains(query) ||
                      r.createdBy.toLowerCase().contains(query),
                )
                .toList();

    return Column(
      children: [
        // Header controls row
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // SizedBox(
              //   width: 320,
              //   child: TextField(
              //     controller: _search,
              //     onChanged: (_) => setState(() {}),
              //     decoration: InputDecoration(
              //       hintText: 'Search',
              //       prefixIcon: const Icon(Icons.search),
              //       isDense: true,
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(8),
              //       ),
              //     ),
              //   ),
              // ),
              //const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppCustomTheme.lightBlueBg,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppCustomTheme.lightgrayBg),
                ),
                child: Text(
                  '${filtered.length} Contacts',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              TextButton.icon(
                // onPressed: _showAddContactPlaceholder,
                onPressed: () {
                  showGeneralDialog(
                    context: context,
                    barrierDismissible: true,
                    barrierLabel: "Add Contact",
                    transitionDuration: const Duration(milliseconds: 300),
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: AddContactDrawer(),
                        ),
                      );
                    },
                    transitionBuilder: (
                      context,
                      animation,
                      secondaryAnimation,
                      child,
                    ) {
                      final slideAnimation = Tween<Offset>(
                        begin: const Offset(1, 0),
                        end: Offset.zero,
                      ).animate(animation);

                      return SlideTransition(
                        position: slideAnimation,
                        child: child,
                      );
                    },
                  );
                },
                icon: const Icon(Icons.add, color: Colors.white, size: 18),
                label: const Text(
                  'Add Contact',
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: AppCustomTheme.bluePrimary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Table
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(10),
            ),
            clipBehavior: Clip.antiAlias,
            child: ListView(
              children: [
                // Header
                Container(
                  color: AppCustomTheme.lightBlueBg,
                  child: Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    columnWidths: const {
                      0: FlexColumnWidth(3),
                      1: FlexColumnWidth(3),
                      2: FlexColumnWidth(2),
                      3: FlexColumnWidth(2),
                      4: FlexColumnWidth(2),
                    },
                    children: const [
                      TableRow(
                        children: [
                          _HeaderCell('Contact Name'),
                          _HeaderCell('Email'),
                          _HeaderCell('Phone'),
                          _HeaderCell('Tags'),
                          _HeaderCell('Created By'),
                        ],
                      ),
                    ],
                  ),
                ),
                // Rows
                Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  columnWidths: const {
                    0: FlexColumnWidth(3),
                    1: FlexColumnWidth(3),
                    2: FlexColumnWidth(2),
                    3: FlexColumnWidth(2),
                    4: FlexColumnWidth(2),
                  },
                  border: TableBorder(
                    horizontalInside: BorderSide(color: Colors.grey.shade300),
                  ),
                  children: [
                    for (int i = 0; i < filtered.length; i++)
                      TableRow(
                        children: _wrapHover(
                          rowIndex: i,
                          children: [
                            _cell(
                              Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {},
                                      child: Text(
                                        filtered[i].name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 32,
                                    height: 32,
                                    child: IgnorePointer(
                                      ignoring: _hoveredRow != i,
                                      child: AnimatedOpacity(
                                        duration: const Duration(
                                          milliseconds: 120,
                                        ),
                                        opacity: _hoveredRow == i ? 1 : 0,
                                        child: InkWell(
                                          onTap:
                                              () {}, // open details panel if you want
                                          customBorder: const CircleBorder(),
                                          child: const CircleAvatar(
                                            radius: 16,
                                            backgroundColor: Colors.white,
                                            child: Icon(
                                              Icons.remove_red_eye,
                                              color: AppCustomTheme.bluePrimary,
                                              size: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            _cell(Text(filtered[i].email)),
                            _cell(Text(filtered[i].phone)),
                            _cell(Text(filtered[i].tags)),
                            _cell(Text(filtered[i].createdBy)),
                          ],
                        ),
                      ),
                    if (filtered.isEmpty)
                      const TableRow(
                        children: [
                          _cell(
                            Text(
                              'No contacts found',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          _cell(SizedBox.shrink()),
                          _cell(SizedBox.shrink()),
                          _cell(SizedBox.shrink()),
                          _cell(SizedBox.shrink()),
                        ],
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

  List<Widget> _wrapHover({
    required int rowIndex,
    required List<Widget> children,
  }) {
    return children
        .map(
          (c) => MouseRegion(
            onEnter: (_) => setState(() => _hoveredRow = rowIndex),
            onExit: (_) {
              if (_hoveredRow == rowIndex) setState(() => _hoveredRow = null);
            },
            child: c,
          ),
        )
        .toList();
  }

  void _showAddContactPlaceholder() {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('Add Contact'),
            content: Text(
              'This button will open your AddContact drawer.\n\nParty: ${widget.partyName}',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ],
          ),
    );
  }
}

class _HeaderCell extends StatelessWidget {
  final String label;
  const _HeaderCell(this.label);

  @override
  Widget build(BuildContext context) {
    return constPadding(
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.w700)),
    );
  }

  Widget constPadding({required Widget child}) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    child: child,
  );
}

class _cell extends StatelessWidget {
  final Widget child;
  const _cell(this.child);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(12.0), child: child);
  }
}

class _PartyContactRow {
  final String name;
  final String email;
  final String phone;
  final String tags;
  final String createdBy;

  const _PartyContactRow({
    required this.name,
    required this.email,
    required this.phone,
    required this.tags,
    required this.createdBy,
  });
}
