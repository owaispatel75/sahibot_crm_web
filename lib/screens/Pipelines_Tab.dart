import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sahibot_crm_web/config/app_theme.dart';
import 'package:sahibot_crm_web/screens/kanban/AddDealDrawer.dart';

/// Replace with your theme if you already have one
// class AppCustomTheme {
//   static const bluePrimary = Color(0xFF2563EB);
//   static const lightBlueBg = Color(0xFFEFF6FF);
//   static final lightgrayBg = Colors.grey.shade300;
// }

/// ============== PIPELINES TAB =================
class PipelinesTab extends StatefulWidget {
  const PipelinesTab({super.key});

  @override
  State<PipelinesTab> createState() => _PipelinesTabState();
}

class _PipelinesTabState extends State<PipelinesTab> {
  final List<_Deal> _deals = []; // start empty to show “no primary deals”
  String _filter = 'Sales Pipeline';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Top strip
          Container(
            decoration: BoxDecoration(
              //color: AppCustomTheme.lightBlueBg.withOpacity(.45),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
            child: Row(
              children: [
                // “Primary records” + tiny dropdown arrow
                PopupMenuButton<String>(
                  initialValue: _filter,
                  onSelected: (v) => setState(() => _filter = v),
                  itemBuilder:
                      (ctx) => const [
                        PopupMenuItem(
                          value: 'Sales Pipeline',
                          child: Text('Sales Pipeline'),
                        ),
                        PopupMenuItem(
                          value: 'Software Pipeline',
                          child: Text('Software Pipeline'),
                        ),
                      ],
                  child: Row(
                    children: [
                      Text(
                        _filter,
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(width: 6),
                      const Icon(Icons.keyboard_arrow_down, size: 18),
                    ],
                  ),
                ),
                //const SizedBox(width: 20),
                // Team pipeline label
                // const Text(
                //   'Team Pipeline : ',
                //   style: TextStyle(color: Colors.black54),
                // ),
                // const Text(
                //   'Sales Pipeline',
                //   style: TextStyle(fontWeight: FontWeight.w600),
                // ),
                const Spacer(),
                // + Deal button
                TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: AppCustomTheme.bluePrimary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () async {
                    final created = await showGeneralDialog<_Deal>(
                      context: context,
                      barrierDismissible: true,
                      barrierLabel: '+ Deal',
                      transitionDuration: const Duration(milliseconds: 260),
                      pageBuilder:
                          (c, a1, a2) => Align(
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              width: MediaQuery.of(c).size.width * 0.42,
                              child: AddDealDrawer(
                                onSave: (d) => Navigator.pop(c, d),
                                onCancel: () => Navigator.pop(c),
                              ),
                            ),
                          ),
                      transitionBuilder:
                          (c, anim, _, child) => SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(1, 0),
                              end: Offset.zero,
                            ).animate(anim),
                            child: child,
                          ),
                    );

                    if (created != null) setState(() => _deals.add(created));
                  },
                  icon: const Icon(Icons.add, size: 18, color: Colors.white),
                  label: const Text(
                    'Deal',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // Table
          Container(
            decoration: BoxDecoration(
              //border: Border.all(color: AppCustomTheme.lightgrayBg),
              borderRadius: BorderRadius.circular(8),
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                Container(
                  color: AppCustomTheme.lightBlueBg,
                  child: Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    columnWidths: const {
                      0: FlexColumnWidth(3),
                      1: FlexColumnWidth(2),
                      2: FlexColumnWidth(2),
                      3: FlexColumnWidth(2),
                      4: FixedColumnWidth(
                        40,
                      ), // right icon slot (per screenshot)
                    },
                    children: [
                      TableRow(
                        children: [
                          _th('Deal Name'),
                          _th('Amount'),
                          _th('Stage'),
                          _th('Closing Date'),
                          const SizedBox.shrink(),
                        ],
                      ),
                    ],
                  ),
                ),
                if (_deals.isEmpty)
                  SizedBox(
                    height: 120,
                    child: Center(
                      child: Text(
                        "This record doesn't have any primary deals.",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    ),
                  )
                else
                  Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    columnWidths: const {
                      0: FlexColumnWidth(3),
                      1: FlexColumnWidth(2),
                      2: FlexColumnWidth(2),
                      3: FlexColumnWidth(2),
                      4: FixedColumnWidth(40),
                    },
                    border: TableBorder.symmetric(
                      inside: BorderSide(color: AppCustomTheme.lightgrayBg),
                    ),
                    children: [
                      for (final d in _deals)
                        TableRow(
                          children: [
                            _td(
                              Text(
                                d.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            _td(
                              Text(
                                d.amount == null
                                    ? '-'
                                    : '₹ ${d.amount!.toStringAsFixed(0)}',
                              ),
                            ),
                            _td(Text(d.stage)),
                            _td(
                              Text(
                                DateFormat('dd MMM yyyy').format(d.closingDate),
                              ),
                            ),
                            _td(
                              IconButton(
                                icon: const Icon(Icons.more_vert, size: 18),
                                onPressed: () {},
                              ),
                              pad: 4,
                            ),
                          ],
                        ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _th(String label) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    child: Text(label, style: const TextStyle(fontWeight: FontWeight.w700)),
  );

  Widget _td(Widget child, {double pad = 12}) =>
      Padding(padding: EdgeInsets.all(pad), child: child);
}

// /// ============== ADD DEAL DRAWER =================
// /// Pure-frontend form (no backend). Returns a _Deal via onSave.
// class AddDealDrawer extends StatefulWidget {
//   final void Function(_Deal deal) onSave;
//   final VoidCallback onCancel;

//   const AddDealDrawer({
//     super.key,
//     required this.onSave,
//     required this.onCancel,
//   });

//   @override
//   State<AddDealDrawer> createState() => _AddDealDrawerState();
// }

// class _AddDealDrawerState extends State<AddDealDrawer> {
//   final _form = GlobalKey<FormState>();

//   // fields
//   String _name = '';
//   DateTime? _closing;
//   String _pipeline = 'Sales Pipeline';
//   String _stage = 'Prospecting';
//   String _party = 'Zylker Corp';
//   String _contact = 'Bilal Shaikh';
//   double? _amount;
//   String _source = 'Website';
//   String _desc = '';

//   // demo data
//   final _pipelines = const ['Sales Pipeline', 'Implementation'];
//   final Map<String, List<String>> _stages = const {
//     'Sales Pipeline': ['Prospecting', 'Qualified', 'Proposal', 'Won', 'Lost'],
//     'Implementation': ['Kickoff', 'In Progress', 'Go-Live'],
//   };
//   final _parties = const ['Zylker Corp', 'Acme LLC', 'Globex Inc.'];
//   final _contacts = const ['Bilal Shaikh', 'Owais Patel', 'Asha Iyer'];
//   final _sources = const ['Website', 'Referral', 'Google Ads', 'Event'];

//   Future<void> _pickDate() async {
//     final now = DateTime.now();
//     final p = await showDatePicker(
//       context: context,
//       firstDate: DateTime(now.year - 1),
//       lastDate: DateTime(now.year + 5),
//       initialDate: _closing ?? now,
//     );
//     if (p != null) setState(() => _closing = p);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final stageList = _stages[_pipeline] ?? const <String>[];
//     if (!stageList.contains(_stage)) _stage = stageList.first;

//     return Material(
//       color: Colors.white,
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(20, 20, 20, 14),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 const Text(
//                   'Deal Information',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 const Spacer(),
//                 IconButton(
//                   onPressed: widget.onCancel,
//                   icon: const Icon(Icons.close),
//                 ),
//               ],
//             ),
//             const Divider(),

//             Expanded(
//               child: SingleChildScrollView(
//                 child: Form(
//                   key: _form,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Row 1: Deal Name / Closing Date
//                       Row(
//                         children: [
//                           Expanded(
//                             child: _field(
//                               label: 'Deal Name',
//                               child: TextFormField(
//                                 decoration: const InputDecoration(
//                                   border: OutlineInputBorder(),
//                                 ),
//                                 onChanged: (v) => _name = v.trim(),
//                                 validator:
//                                     (v) =>
//                                         (v == null || v.trim().isEmpty)
//                                             ? 'Enter deal name'
//                                             : null,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: _field(
//                               label: 'Closing Date',
//                               child: InkWell(
//                                 onTap: _pickDate,
//                                 child: InputDecorator(
//                                   decoration: const InputDecoration(
//                                     border: OutlineInputBorder(),
//                                   ),
//                                   child: Row(
//                                     children: [
//                                       Expanded(
//                                         child: Text(
//                                           _closing == null
//                                               ? 'Select date'
//                                               : DateFormat(
//                                                 'dd/MM/yyyy',
//                                               ).format(_closing!),
//                                         ),
//                                       ),
//                                       const Icon(
//                                         Icons.calendar_today,
//                                         size: 18,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 12),

//                       // Row 2: Pipeline / Stage
//                       Row(
//                         children: [
//                           Expanded(
//                             child: _field(
//                               label: 'Pipeline',
//                               child: DropdownButtonFormField<String>(
//                                 value: _pipeline,
//                                 items:
//                                     _pipelines
//                                         .map(
//                                           (e) => DropdownMenuItem(
//                                             value: e,
//                                             child: Text(e),
//                                           ),
//                                         )
//                                         .toList(),
//                                 onChanged:
//                                     (v) => setState(
//                                       () => _pipeline = v ?? _pipeline,
//                                     ),
//                                 decoration: const InputDecoration(
//                                   border: OutlineInputBorder(),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: _field(
//                               label: 'Stage',
//                               child: DropdownButtonFormField<String>(
//                                 value: _stage,
//                                 items:
//                                     stageList
//                                         .map(
//                                           (e) => DropdownMenuItem(
//                                             value: e,
//                                             child: Text(e),
//                                           ),
//                                         )
//                                         .toList(),
//                                 onChanged:
//                                     (v) => setState(() => _stage = v ?? _stage),
//                                 decoration: const InputDecoration(
//                                   border: OutlineInputBorder(),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 12),

//                       // Row 3: Party / Contact
//                       Row(
//                         children: [
//                           Expanded(
//                             child: _field(
//                               label: 'Party',
//                               child: DropdownButtonFormField<String>(
//                                 value: _party,
//                                 items:
//                                     _parties
//                                         .map(
//                                           (e) => DropdownMenuItem(
//                                             value: e,
//                                             child: Text(e),
//                                           ),
//                                         )
//                                         .toList(),
//                                 onChanged:
//                                     (v) => setState(() => _party = v ?? _party),
//                                 decoration: const InputDecoration(
//                                   border: OutlineInputBorder(),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: _field(
//                               label: 'Contact',
//                               child: DropdownButtonFormField<String>(
//                                 value: _contact,
//                                 items:
//                                     _contacts
//                                         .map(
//                                           (e) => DropdownMenuItem(
//                                             value: e,
//                                             child: Text(e),
//                                           ),
//                                         )
//                                         .toList(),
//                                 onChanged:
//                                     (v) => setState(
//                                       () => _contact = v ?? _contact,
//                                     ),
//                                 decoration: const InputDecoration(
//                                   border: OutlineInputBorder(),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 12),

//                       // Row 4: Amount / Source
//                       Row(
//                         children: [
//                           Expanded(
//                             child: _field(
//                               label: 'Amount',
//                               child: TextFormField(
//                                 keyboardType: TextInputType.number,
//                                 decoration: const InputDecoration(
//                                   border: OutlineInputBorder(),
//                                 ),
//                                 onChanged:
//                                     (v) =>
//                                         _amount = double.tryParse(
//                                           v.replaceAll(',', ''),
//                                         ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: _field(
//                               label: 'Source',
//                               child: DropdownButtonFormField<String>(
//                                 value: _source,
//                                 items:
//                                     _sources
//                                         .map(
//                                           (e) => DropdownMenuItem(
//                                             value: e,
//                                             child: Text(e),
//                                           ),
//                                         )
//                                         .toList(),
//                                 onChanged:
//                                     (v) =>
//                                         setState(() => _source = v ?? _source),
//                                 decoration: const InputDecoration(
//                                   border: OutlineInputBorder(),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 12),

//                       // Description (full width)
//                       _field(
//                         label: 'Description',
//                         child: TextFormField(
//                           minLines: 3,
//                           maxLines: 6,
//                           decoration: const InputDecoration(
//                             border: OutlineInputBorder(),
//                           ),
//                           onChanged: (v) => _desc = v,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),

//             // actions
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 TextButton(
//                   onPressed: widget.onCancel,
//                   style: TextButton.styleFrom(
//                     foregroundColor: AppCustomTheme.bluePrimary,
//                     side: const BorderSide(
//                       color: AppCustomTheme.bluePrimary,
//                       width: 2,
//                     ),
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 18,
//                       vertical: 12,
//                     ),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   child: const Text('Cancel'),
//                 ),
//                 const SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: () {
//                     if (!(_form.currentState?.validate() ?? false)) return;
//                     if (_closing == null) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(
//                           content: Text('Please select Closing Date'),
//                         ),
//                       );
//                       return;
//                     }
//                     widget.onSave(
//                       _Deal(
//                         name: _name,
//                         closingDate: _closing!,
//                         pipeline: _pipeline,
//                         stage: _stage,
//                         party: _party,
//                         contact: _contact,
//                         amount: _amount,
//                         source: _source,
//                         description: _desc,
//                       ),
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: AppCustomTheme.bluePrimary,
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 22,
//                       vertical: 12,
//                     ),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   child: const Text(
//                     'Add Deal',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _field({required String label, required Widget child}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
//         ),
//         const SizedBox(height: 6),
//         child,
//       ],
//     );
//   }
// }

/// simple demo model used in this UI
class _Deal {
  final String name;
  final DateTime closingDate;
  final String pipeline;
  final String stage;
  final String party;
  final String contact;
  final double? amount;
  final String source;
  final String description;

  _Deal({
    required this.name,
    required this.closingDate,
    required this.pipeline,
    required this.stage,
    required this.party,
    required this.contact,
    required this.amount,
    required this.source,
    required this.description,
  });
}
