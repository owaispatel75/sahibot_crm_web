// import 'package:flutter/material.dart';
// import 'package:sahibot_crm_web/widgets/billing_sidebar.dart';
// import '../../../widgets/topbar.dart';
// import '../../../widgets/sidebar.dart';

// class CustomizeScreen extends StatefulWidget {
//   const CustomizeScreen({super.key});

//   @override
//   State<CustomizeScreen> createState() => _CustomizeScreenState();
// }

// class _CustomizeScreenState extends State<CustomizeScreen>
//     with SingleTickerProviderStateMixin {
//   //String selectedPipelines = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Row(
//             children: [
//               const Sidebar(),
//               const BillingSidebar(),
//               Expanded(child: Center(child: Text("Customize Screen Panel"))),
//             ],
//           ),
//           const Positioned(top: 0, left: 0, right: 0, child: TopBar()),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:sahibot_crm_web/widgets/team_Sidebar.dart';
import '../../widgets/topbar.dart';
import '../../widgets/sidebar.dart';

class CustomizeScreen extends StatefulWidget {
  const CustomizeScreen({super.key});
  @override
  State<CustomizeScreen> createState() => _CustomizeScreenState();
}

class _CustomizeScreenState extends State<CustomizeScreen> {
  // --- Customize palette (matches screenshot) ---
  static const _bgPage = Color(0xFFF8FAFD);
  static const _textMain = Color(0xFF0F172A);

  // simple in-memory model
  final List<_PipelineItem> _pipelines = [
    _PipelineItem(
      id: 'p1',
      name: 'Sample',
      createdAt: DateTime(2025, 8, 9),
      createdBy: 'Bilal Shaikh',
    ),
    _PipelineItem(
      id: 'p2',
      name: 'Software Sale Pipeline',
      createdAt: DateTime(2025, 6, 20),
      createdBy: 'Bilal Shaikh',
    ),
  ];

  // Future<void> _createPipeline() async {
  //   final nameCtrl = TextEditingController();
  //   final ok = await showDialog<bool>(
  //     context: context,
  //     builder:
  //         (_) => AlertDialog(
  //           title: const Text('Create pipeline'),
  //           content: TextField(
  //             controller: nameCtrl,
  //             autofocus: true,
  //             decoration: const InputDecoration(
  //               labelText: 'Pipeline name',
  //               hintText: 'e.g. Marketing Funnel',
  //             ),
  //             onSubmitted: (_) => Navigator.pop(context, true),
  //           ),
  //           actions: [
  //             TextButton(
  //               onPressed: () => Navigator.pop(context, false),
  //               child: const Text('Cancel'),
  //             ),
  //             ElevatedButton(
  //               onPressed: () => Navigator.pop(context, true),
  //               child: const Text('Create'),
  //             ),
  //           ],
  //         ),
  //   );
  //   final name = nameCtrl.text.trim();
  //   if (ok == true && name.isNotEmpty) {
  //     setState(() {
  //       _pipelines.insert(
  //         0,
  //         _PipelineItem(
  //           id: DateTime.now().millisecondsSinceEpoch.toString(),
  //           name: name,
  //           createdAt: DateTime.now(),
  //           createdBy: 'You', // replace with logged-in user later
  //         ),
  //       );
  //     });
  //     // later: call ApiService.createPipeline(name)
  //   }
  // }

  Future<void> _createPipeline() async {
    final result = await showDialog<_PipelineResult>(
      context: context,
      barrierDismissible: false,
      builder: (_) => const _CreatePipelineDialog(),
    );

    if (result == null) return; // cancelled

    setState(() {
      _pipelines.insert(
        0,
        _PipelineItem(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          name: result.name,
          createdAt: DateTime.now(),
          createdBy: 'You',
          openStages: result.openStages,
          closeStages: result.closeStages,
          // stages: result.stages, // <— keep stages with the item (frontend only)
        ),
      );
    });

    // later: call API to persist
    // await ApiService.createPipeline(name: result.name, stages: result.stages);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgPage,
      body: Stack(
        children: [
          Row(
            children: [
              const Sidebar(),
              const TeamSidebar(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 64),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Customize',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            color: _textMain,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Top actions
                        LayoutBuilder(
                          builder: (_, cons) {
                            final isNarrow = cons.maxWidth < 1100;
                            final row = [
                              _ActionCard(
                                title: 'Start from blank',
                                icon: Icons.add_box_rounded,
                                onTap: _createPipeline,
                              ),
                              _ActionCard(
                                title: 'Use pre-built Templates',
                                icon: Icons.view_quilt_rounded,
                                onTap: null, // disabled
                              ),
                              _ActionCard(
                                title: 'Create Pipeline with AI',
                                icon: Icons.auto_awesome, // sparkle icon
                                onTap: null, // disabled
                              ),
                            ];
                            return isNarrow
                                ? Column(
                                  children:
                                      row
                                          .map(
                                            (w) => Padding(
                                              padding: const EdgeInsets.only(
                                                bottom: 12,
                                              ),
                                              child: w,
                                            ),
                                          )
                                          .toList(),
                                )
                                : Row(
                                  children: [
                                    Expanded(child: row[0]),
                                    const SizedBox(width: 12),
                                    Expanded(child: row[1]),
                                    const SizedBox(width: 12),
                                    Expanded(child: row[2]),
                                  ],
                                );
                          },
                        ),

                        const SizedBox(height: 16),

                        // Pipelines list
                        for (final p in _pipelines) ...[
                          _PipelineRow(
                            item: p,
                            onOpen: () {
                              // TODO: navigate to builder for p.id
                              // context.go('/pipelines/${p.id}');
                            },
                          ),
                          const SizedBox(height: 12),
                        ],
                      ],
                    ),
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

// class _ActionCard extends StatelessWidget {
//   final String title;
//   final IconData icon;
//   final VoidCallback? onTap; // null = disabled
//   const _ActionCard({required this.title, required this.icon, this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     final disabled = onTap == null;
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(12),
//       child: Container(
//         height: 86,
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         decoration: BoxDecoration(
//           // color:
//           //     disabled
//           //         ? Colors.grey.shade900
//           //         : Colors.grey.shade900.withOpacity(0.9),
//           color: _cardBg,
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(
//             color: _cardBr,
//             // color: disabled ? Colors.grey.shade800 : Colors.blueGrey.shade700,
//           ),
//         ),
//         child: Row(
//           children: [
//             Icon(icon, size: 32, color: disabled ? Colors.grey : Colors.white),
//             const SizedBox(width: 14),
//             Expanded(
//               child: Text(
//                 title,
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w700,
//                   color: disabled ? Colors.grey : Colors.white,
//                 ),
//               ),
//             ),
//             if (!disabled)
//               const Icon(Icons.chevron_right, color: Colors.white70)
//             else
//               const Icon(Icons.lock, color: Colors.grey),
//           ],
//         ),
//       ),
//     );
//   }
// }

class _ActionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap; // null = disabled (but still same style)

  const _ActionCard({required this.title, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    // --- Customize palette (matches screenshot) ---
    const _cardBg = Colors.white;
    const _cardBr = Color(0xFFE6EBF1);
    const _textMain = Color(0xFF0F172A);
    final disabled = onTap == null;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 132,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: _cardBg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: _cardBr),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 42, color: _textMain),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: _textMain,
              ),
            ),
            const SizedBox(width: 16),
            if (!disabled)
              const Icon(Icons.chevron_right, color: Colors.white70)
            else
              const Icon(Icons.lock, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

class _PipelineRow extends StatelessWidget {
  final _PipelineItem item;
  final VoidCallback onOpen;
  const _PipelineRow({required this.item, required this.onOpen});

  String _fmt(DateTime d) => '${_month(d.month)} ${d.day}, ${d.year}';
  String _month(int m) =>
      const [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec',
      ][m - 1];
  static const _cardBr = Color(0xFFE6EBF1);
  static const _tileBg = Color(0xFFF3F6FA);
  static const _textMain = Color(0xFF0F172A);
  static const _textSub = Color(0xFF64748B);
  static const _chevCol = Color(0xFF8B97A7);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onOpen,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        // height: 92,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: _tileBg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: _cardBr),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: _textMain,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 24,
                    runSpacing: 6,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Created At:',
                            style: TextStyle(color: _textSub, fontSize: 16),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            _fmt(item.createdAt),
                            style: const TextStyle(
                              color: _textMain,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            'Created by:',
                            style: TextStyle(color: _textSub, fontSize: 16),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            item.createdBy,
                            style: const TextStyle(
                              color: _textMain,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: _chevCol),
          ],
        ),
      ),
    );
  }
}

// class _PipelineRow extends StatelessWidget {
//   final _PipelineItem item;
//   final VoidCallback onOpen;
//   const _PipelineRow({required this.item, required this.onOpen});

//   String _fmt(DateTime d) => '${_month(d.month)} ${d.day}, ${d.year}';
//   String _month(int m) =>
//       const [
//         'Jan',
//         'Feb',
//         'Mar',
//         'Apr',
//         'May',
//         'Jun',
//         'Jul',
//         'Aug',
//         'Sep',
//         'Oct',
//         'Nov',
//         'Dec',
//       ][m - 1];

//   // --- Customize palette (matches screenshot) ---
//   const _bgPage = Color(0xFFF8FAFD);
//   const _cardBg = Colors.white;
//   const _cardBr = Color(0xFFE6EBF1);
//   const _tileBg = Color(0xFFF3F6FA);
//   const _textMain = Color(0xFF0F172A);
//   const _textSub = Color(0xFF64748B);
//   const _chevCol = Color(0xFF8B97A7);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onOpen,
//       borderRadius: BorderRadius.circular(8),
//       child: Container(
//         height: 78,
//         padding: const EdgeInsets.symmetric(horizontal: 18),
//         decoration: BoxDecoration(
//           color: const Color.fromARGB(255, 227, 241, 255),
//           borderRadius: BorderRadius.circular(8),
//           border: Border.all(color: const Color.fromARGB(255, 235, 245, 255)),
//         ),
//         child: Row(
//           children: [
//             Expanded(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     item.name,
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Wrap(
//                     spacing: 16,
//                     children: [
//                       Row(
//                         children: [
//                           const Text(
//                             'Created At:',
//                             style: TextStyle(color: Colors.white54),
//                           ),
//                           const SizedBox(width: 6),
//                           Text(
//                             _fmt(item.createdAt),
//                             style: const TextStyle(color: Colors.white),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           const Text(
//                             'Created by:',
//                             style: TextStyle(color: Colors.white54),
//                           ),
//                           const SizedBox(width: 6),
//                           Text(
//                             item.createdBy,
//                             style: const TextStyle(color: Colors.white),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             const Icon(Icons.chevron_right, color: Colors.white54),
//           ],
//         ),
//       ),
//     );
//   }
// }

class _PipelineItem {
  final String id;
  final String name;
  final DateTime createdAt;
  final String createdBy;
  final List<String> openStages;
  final List<String> closeStages;
  // final List<String> stages;
  _PipelineItem({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.createdBy,
    this.openStages = const [],
    this.closeStages = const [],
    // this.stages = const [],
  });
}

class _PipelineResult {
  final String name;
  final List<String> openStages;
  final List<String> closeStages;
  // final List<String> stages;
  const _PipelineResult(this.name, this.openStages, this.closeStages);
}

class _CreatePipelineDialog extends StatefulWidget {
  const _CreatePipelineDialog({super.key});

  @override
  State<_CreatePipelineDialog> createState() => _CreatePipelineDialogState();
}

class _CreatePipelineDialogState extends State<_CreatePipelineDialog> {
  final _nameCtrl = TextEditingController();
  final _nameFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  // final List<TextEditingController> _stageCtrls = [
  //   TextEditingController(text: 'Prospecting'),
  //   TextEditingController(text: 'Product Demo'),
  // ];

  final List<TextEditingController> _openCtrls = [
    TextEditingController(text: 'Prospecting'),
    TextEditingController(text: 'Product Demo'),
  ];

  final List<TextEditingController> _closeCtrls = [
    TextEditingController(text: 'Won'),
    TextEditingController(text: 'Lost'),
  ];

  // which item is currently being edited (for inline pencil->textfield)
  int? _editOpenIndex;
  int? _editCloseIndex;

  void _addOpen() {
    setState(() {
      _openCtrls.add(TextEditingController());
      _editOpenIndex = _openCtrls.length - 1;
    });
  }

  void _addClose() {
    setState(() {
      _closeCtrls.add(TextEditingController());
      _editCloseIndex = _closeCtrls.length - 1;
    });
  }

  void _removeOpen(int i) => setState(() => _openCtrls.removeAt(i));
  void _removeClose(int i) => setState(() => _closeCtrls.removeAt(i));

  // void _addStage() {
  //   setState(() => _stageCtrls.add(TextEditingController()));
  // }

  // void _removeStage(int i) {
  //   setState(() => _stageCtrls.removeAt(i));
  // }

  // void _save() {
  //   if (!_formKey.currentState!.validate()) return;

  //   final name = _nameCtrl.text.trim();
  //   final stages =
  //       _stageCtrls
  //           .map((c) => c.text.trim())
  //           .where((s) => s.isNotEmpty)
  //           .toList();

  //   if (stages.isEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Please add at least one stage.')),
  //     );
  //     return;
  //   }

  //   Navigator.pop(context, _PipelineResult(name, stages));
  // }

  void _save() {
    if (!_formKey.currentState!.validate()) return;

    final name = _nameCtrl.text.trim();
    final open =
        _openCtrls
            .map((c) => c.text.trim())
            .where((s) => s.isNotEmpty)
            .toList();
    final close =
        _closeCtrls
            .map((c) => c.text.trim())
            .where((s) => s.isNotEmpty)
            .toList();

    if (open.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please add at least one OPEN stage.')),
      );
      return;
    }
    if (close.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please add at least one CLOSE stage.')),
      );
      return;
    }

    Navigator.pop(context, _PipelineResult(name, open, close));
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _nameFocus.dispose();
    for (final c in _openCtrls) c.dispose();
    for (final c in _closeCtrls) c.dispose();
    // for (final c in _stageCtrls) c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // light look + centered card
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 720),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Row(
                children: [
                  const Text(
                    'Create Pipeline',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                  const Spacer(),
                  IconButton(
                    tooltip: 'Close',
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Pipeline name
                    _sectionHeader('Pipeline Name'),
                    TextFormField(
                      controller: _nameCtrl,
                      focusNode: _nameFocus,
                      maxLength: 100,
                      decoration: InputDecoration(
                        hintText: 'Please enter a pipeline name',
                        // hintText: 'e.g. Software Sale Pipeline',
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator:
                          (v) =>
                              (v == null || v.trim().isEmpty)
                                  ? 'Please enter a pipeline name'
                                  : null,
                      onFieldSubmitted: (_) => _addOpen(),
                    ),
                    const SizedBox(height: 12),

                    // ---- Open Stages ----
                    _sectionHeader('Open Stages'),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFE6EBF1)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                      child: Column(
                        children: [
                          for (int i = 0; i < _openCtrls.length; i++) ...[
                            _StageRow(
                              controller: _openCtrls[i],
                              isEditing: _editOpenIndex == i,
                              onStartEdit:
                                  () => setState(() => _editOpenIndex = i),
                              onFinishEdit:
                                  () => setState(() => _editOpenIndex = null),
                              onRemove:
                                  _openCtrls.length > 1
                                      ? () => _removeOpen(i)
                                      : null,
                            ),
                            if (i != _openCtrls.length - 1)
                              const SizedBox(height: 10),
                          ],
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton.icon(
                              onPressed: _addOpen,
                              icon: const Icon(Icons.add),
                              label: const Text('Add stage'),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),

                    // ---- Close Stages ----
                    _sectionHeader('Close Stages'),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFE6EBF1)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                      child: Column(
                        children: [
                          for (int i = 0; i < _closeCtrls.length; i++) ...[
                            _StageRow(
                              controller: _closeCtrls[i],
                              isEditing: _editCloseIndex == i,
                              onStartEdit:
                                  () => setState(() => _editCloseIndex = i),
                              onFinishEdit:
                                  () => setState(() => _editCloseIndex = null),
                              onRemove:
                                  _closeCtrls.length > 1
                                      ? () => _removeClose(i)
                                      : null,
                            ),
                            if (i != _closeCtrls.length - 1)
                              const SizedBox(height: 10),
                          ],
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton.icon(
                              onPressed: _addClose,
                              icon: const Icon(Icons.add),
                              label: const Text('Add stage'),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // // Stages (single list — no open/close split)
                    // _sectionHeader('Stages'),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     border: Border.all(color: const Color(0xFFE6EBF1)),
                    //     borderRadius: BorderRadius.circular(8),
                    //   ),
                    //   padding: const EdgeInsets.symmetric(
                    //     horizontal: 12,
                    //     vertical: 12,
                    //   ),
                    //   child: Column(
                    //     children: [
                    //       // simple, non-draggable list
                    //       ListView.separated(
                    //         shrinkWrap: true,
                    //         physics: const NeverScrollableScrollPhysics(),
                    //         itemCount: _stageCtrls.length,
                    //         separatorBuilder:
                    //             (_, __) => const SizedBox(height: 10),
                    //         itemBuilder: (context, i) {
                    //           final ctrl = _stageCtrls[i];
                    //           return Row(
                    //             children: [
                    //               // (optional) index
                    //               // Padding(
                    //               //   padding: const EdgeInsets.only(right: 8),
                    //               //   child: Text('${i + 1}.', style: const TextStyle(color: Colors.grey)),
                    //               // ),
                    //               Expanded(
                    //                 child: TextFormField(
                    //                   controller: ctrl,
                    //                   decoration: InputDecoration(
                    //                     hintText: 'Stage name',
                    //                     isDense: true,
                    //                     border: OutlineInputBorder(
                    //                       borderRadius: BorderRadius.circular(
                    //                         8,
                    //                       ),
                    //                     ),
                    //                   ),
                    //                   validator:
                    //                       (v) =>
                    //                           (v == null || v.trim().isEmpty)
                    //                               ? ' '
                    //                               : null, // keep height
                    //                 ),
                    //               ),
                    //               const SizedBox(width: 8),
                    //               IconButton(
                    //                 tooltip: 'Remove',
                    //                 onPressed:
                    //                     _stageCtrls.length > 1
                    //                         ? () => _removeStage(i)
                    //                         : null,
                    //                 icon: const Icon(Icons.delete_outline),
                    //               ),
                    //             ],
                    //           );
                    //         },
                    //       ),

                    //       // Add stage
                    //       Align(
                    //         alignment: Alignment.centerRight,
                    //         child: TextButton.icon(
                    //           onPressed: _addStage,
                    //           icon: const Icon(Icons.add),
                    //           label: const Text('Add stage'),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    //working above
                    // Container(
                    //   decoration: BoxDecoration(
                    //     border: Border.all(color: const Color(0xFFE6EBF1)),
                    //     borderRadius: BorderRadius.circular(8),
                    //   ),
                    //   padding: const EdgeInsets.symmetric(
                    //     horizontal: 12,
                    //     vertical: 12,
                    //   ),
                    //   child: Column(
                    //     children: [
                    //       // Reorderable list of stage text fields
                    //       ReorderableListView.builder(
                    //         shrinkWrap: true,
                    //         physics: const NeverScrollableScrollPhysics(),
                    //         itemCount: _stageCtrls.length,
                    //         onReorder: (oldIndex, newIndex) {
                    //           setState(() {
                    //             if (newIndex > oldIndex) newIndex -= 1;
                    //             final item = _stageCtrls.removeAt(oldIndex);
                    //             _stageCtrls.insert(newIndex, item);
                    //           });
                    //         },
                    //         itemBuilder: (context, i) {
                    //           final ctrl = _stageCtrls[i];
                    //           return Padding(
                    //             key: ValueKey(ctrl),
                    //             padding: const EdgeInsets.only(bottom: 10),
                    //             child: Row(
                    //               children: [
                    //                 const Icon(
                    //                   Icons.drag_indicator,
                    //                   color: Colors.grey,
                    //                 ),
                    //                 const SizedBox(width: 8),
                    //                 Expanded(
                    //                   child: TextFormField(
                    //                     controller: ctrl,
                    //                     decoration: InputDecoration(
                    //                       hintText: 'Stage name',
                    //                       isDense: true,
                    //                       border: OutlineInputBorder(
                    //                         borderRadius: BorderRadius.circular(
                    //                           8,
                    //                         ),
                    //                       ),
                    //                     ),
                    //                     validator:
                    //                         (v) =>
                    //                             (v == null || v.trim().isEmpty)
                    //                                 ? ' '
                    //                                 : null, // keep height
                    //                   ),
                    //                 ),
                    //                 const SizedBox(width: 8),
                    //                 IconButton(
                    //                   tooltip: 'Remove',
                    //                   onPressed:
                    //                       _stageCtrls.length > 1
                    //                           ? () => _removeStage(i)
                    //                           : null,
                    //                   icon: const Icon(Icons.delete_outline),
                    //                 ),
                    //               ],
                    //             ),
                    //           );
                    //         },
                    //       ),

                    //       // Add button
                    //       Align(
                    //         alignment: Alignment.centerRight,
                    //         child: TextButton.icon(
                    //           onPressed: _addStage,
                    //           icon: const Icon(Icons.add),
                    //           label: const Text('Add stage'),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Footer buttons
              Row(
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: _save,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF10B981), // green
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Create'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionHeader(String title) => Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    margin: const EdgeInsets.only(bottom: 8),
    decoration: BoxDecoration(
      //color: const Color(0xFFEFF3F8),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w900,
        color: Color(0xFF374151),
      ),
    ),
  );
}

class _StageRow extends StatefulWidget {
  final TextEditingController controller;
  final bool isEditing;
  final VoidCallback onStartEdit;
  final VoidCallback onFinishEdit;
  final VoidCallback? onRemove;

  const _StageRow({
    required this.controller,
    required this.isEditing,
    required this.onStartEdit,
    required this.onFinishEdit,
    this.onRemove,
  });

  @override
  State<_StageRow> createState() => _StageRowState();
}

class _StageRowState extends State<_StageRow> {
  final _fieldKey = GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    final editing = widget.isEditing;

    return Row(
      children: [
        Expanded(
          child:
              editing
                  ? TextFormField(
                    key: _fieldKey,
                    controller: widget.controller,
                    autofocus: true,
                    decoration: const InputDecoration(
                      hintText: 'Stage name',
                      isDense: true,
                      border: OutlineInputBorder(),
                    ),
                    onEditingComplete: widget.onFinishEdit,
                    validator:
                        (v) => (v == null || v.trim().isEmpty) ? ' ' : null,
                  )
                  : Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 8,
                    ),
                    child: Text(
                      widget.controller.text,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
        ),
        const SizedBox(width: 8),
        IconButton(
          tooltip: editing ? 'Done' : 'Edit',
          icon: Icon(editing ? Icons.check : Icons.edit, color: Colors.blue),
          onPressed: () {
            if (editing) {
              // keep non-empty
              if ((_fieldKey.currentState?.validate() ?? true) &&
                  widget.controller.text.trim().isNotEmpty) {
                widget.onFinishEdit();
              }
            } else {
              widget.onStartEdit();
            }
          },
        ),
        IconButton(
          tooltip: 'Delete',
          icon: const Icon(Icons.delete_outline, color: Colors.red),
          onPressed: widget.onRemove,
        ),
      ],
    );
  }
}
