// // import 'package:flutter/material.dart';
// // import 'package:sahibot_crm_web/widgets/leads_section_sidebar.dart';
// // import '../../../widgets/topbar.dart';
// // import '../../../widgets/sidebar.dart';

// // class pipelinesScreen extends StatefulWidget {
// //   const pipelinesScreen({super.key});

// //   @override
// //   State<pipelinesScreen> createState() => _pipelinesScreenState();
// // }

// // class _pipelinesScreenState extends State<pipelinesScreen>
// //     with SingleTickerProviderStateMixin {
// //   String selectedPipelines = '';

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Stack(
// //         children: [
// //           Row(
// //             children: [
// //               const Sidebar(),
// //               const LeadsSectionSidebar(),
// //               Expanded(child: Center(child: Text("Pipelines Panel"))),
// //             ],
// //           ),
// //           const Positioned(top: 0, left: 0, right: 0, child: TopBar()),
// //         ],
// //       ),
// //     );
// //   }
// // }

//main working starts

// import 'package:flutter/material.dart';
// import 'package:sahibot_crm_web/widgets/leads_section_sidebar.dart';
// import '../../../widgets/topbar.dart';
// import '../../../widgets/sidebar.dart';

// /// Simple in-memory models (frontend-only)
// class Stage {
//   final String id;
//   String title;
//   Stage({required this.id, required this.title});
// }

// class Deal {
//   final String id;
//   String title;
//   double amount;
//   String company;
//   String owner;
//   Color color;
//   Deal({
//     required this.id,
//     required this.title,
//     required this.amount,
//     required this.company,
//     required this.owner,
//     required this.color,
//   });
// }

// /// Payload carried while dragging
// class DragPayload {
//   final String fromStageId;
//   final Deal deal;
//   DragPayload({required this.fromStageId, required this.deal});
// }

// class pipelinesScreen extends StatefulWidget {
//   const pipelinesScreen({super.key});

//   @override
//   State<pipelinesScreen> createState() => _pipelinesScreenState();
// }

// class _pipelinesScreenState extends State<pipelinesScreen>
//     with SingleTickerProviderStateMixin {
//   // Stages (columns)
//   final List<Stage> _stages = [
//     Stage(id: 'new', title: 'New'),
//     Stage(id: 'qualified', title: 'Qualified'),
//     Stage(id: 'proposal', title: 'Proposal'),
//     Stage(id: 'won', title: 'Won'),
//     Stage(id: 'lost', title: 'Lost'),
//   ];

//   // Deals per stage (in-memory)
//   late Map<String, List<Deal>> _deals;

//   // Hover state for drag highlight
//   String? _hoveringStageId;

//   @override
//   void initState() {
//     super.initState();
//     _deals = {
//       'new': [
//         Deal(
//           id: 'd1',
//           title: 'Acme – Website Revamp',
//           amount: 250000,
//           company: 'Acme Inc',
//           owner: 'OP',
//           color: Colors.blue,
//         ),
//         Deal(
//           id: 'd2',
//           title: 'Globex – CRM Pilot',
//           amount: 120000,
//           company: 'Globex',
//           owner: 'BS',
//           color: Colors.green,
//         ),
//       ],
//       'qualified': [
//         Deal(
//           id: 'd3',
//           title: 'Soylent – Mobile App',
//           amount: 180000,
//           company: 'Soylent',
//           owner: 'AP',
//           color: Colors.orange,
//         ),
//       ],
//       'proposal': [],
//       'won': [],
//       'lost': [],
//     };
//   }

//   // Create a new stage
//   Future<void> _addStage() async {
//     final controller = TextEditingController();
//     final ok = await showDialog<bool>(
//       context: context,
//       builder:
//           (ctx) => AlertDialog(
//             title: const Text('Add Stage'),
//             content: TextField(
//               controller: controller,
//               decoration: const InputDecoration(hintText: 'e.g. Negotiation'),
//             ),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.pop(ctx, false),
//                 child: const Text('Cancel'),
//               ),
//               ElevatedButton(
//                 onPressed: () => Navigator.pop(ctx, true),
//                 child: const Text('Add'),
//               ),
//             ],
//           ),
//     );
//     if (ok == true && controller.text.trim().isNotEmpty) {
//       final id = controller.text.trim().toLowerCase().replaceAll(' ', '_');
//       setState(() {
//         _stages.add(Stage(id: id, title: controller.text.trim()));
//         _deals[id] = [];
//       });
//     }
//   }

//   // Create a new deal within a stage
//   Future<void> _addDeal(String stageId) async {
//     final title = TextEditingController();
//     final amount = TextEditingController();
//     final company = TextEditingController();
//     final ok = await showDialog<bool>(
//       context: context,
//       builder:
//           (ctx) => AlertDialog(
//             title: const Text('Add Deal'),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextField(
//                   controller: title,
//                   decoration: const InputDecoration(labelText: 'Title'),
//                 ),
//                 TextField(
//                   controller: amount,
//                   decoration: const InputDecoration(labelText: 'Amount'),
//                   keyboardType: TextInputType.number,
//                 ),
//                 TextField(
//                   controller: company,
//                   decoration: const InputDecoration(labelText: 'Company'),
//                 ),
//               ],
//             ),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.pop(ctx, false),
//                 child: const Text('Cancel'),
//               ),
//               ElevatedButton(
//                 onPressed: () => Navigator.pop(ctx, true),
//                 child: const Text('Add'),
//               ),
//             ],
//           ),
//     );
//     if (ok == true && title.text.trim().isNotEmpty) {
//       setState(() {
//         _deals[stageId]!.add(
//           Deal(
//             id: UniqueKey().toString(),
//             title: title.text.trim(),
//             amount: double.tryParse(amount.text.trim()) ?? 0,
//             company: company.text.trim().isEmpty ? '—' : company.text.trim(),
//             owner: 'OP',
//             color: Colors.purple,
//           ),
//         );
//       });
//     }
//   }

//   // Move deal between stages (append to end in v1)
//   void _moveDeal(DragPayload payload, String toStageId) {
//     final from = payload.fromStageId;
//     if (from == toStageId) return;
//     setState(() {
//       final fromList = _deals[from]!;
//       final toList = _deals[toStageId]!;
//       final idx = fromList.indexWhere((d) => d.id == payload.deal.id);
//       if (idx != -1) {
//         final deal = fromList.removeAt(idx);
//         toList.add(deal);
//       }
//       _hoveringStageId = null;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Row(
//             children: [
//               const Sidebar(),
//               const LeadsSectionSidebar(),
//               // Board
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 64.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       _boardHeader(),
//                       const Divider(height: 1),
//                       Expanded(
//                         child: SingleChildScrollView(
//                           scrollDirection: Axis.horizontal,
//                           padding: const EdgeInsets.all(16),
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               for (final stage in _stages)
//                                 _KanbanColumn(
//                                   key: ValueKey(stage.id),
//                                   stage: stage,
//                                   deals: _deals[stage.id]!,
//                                   hovering: _hoveringStageId == stage.id,
//                                   onAddDeal: () => _addDeal(stage.id),
//                                   onEnter:
//                                       () => setState(
//                                         () => _hoveringStageId = stage.id,
//                                       ),
//                                   onExit:
//                                       () => setState(
//                                         () => _hoveringStageId = null,
//                                       ),
//                                   onAccept:
//                                       (payload) => _moveDeal(payload, stage.id),
//                                 ),
//                               _AddStageTile(onTap: _addStage),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const Positioned(top: 0, left: 0, right: 0, child: TopBar()),
//         ],
//       ),
//     );
//   }

//   Widget _boardHeader() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//       child: Row(
//         children: [
//           const Text(
//             'Pipelines',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
//           ),
//           const SizedBox(width: 16),
//           OutlinedButton.icon(
//             onPressed: _addStage,
//             icon: const Icon(Icons.add),
//             label: const Text('Add Stage'),
//           ),
//           const Spacer(),
//           // Placeholder actions
//           OutlinedButton.icon(
//             onPressed: () {
//               // later: open filters panel
//             },
//             icon: const Icon(Icons.filter_alt),
//             label: const Text('Filter'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// /// Single Kanban column with a DragTarget covering the list area
// class _KanbanColumn extends StatelessWidget {
//   final Stage stage;
//   final List<Deal> deals;
//   final bool hovering;
//   final VoidCallback onAddDeal;
//   final VoidCallback onEnter;
//   final VoidCallback onExit;
//   final void Function(DragPayload payload) onAccept;

//   const _KanbanColumn({
//     super.key,
//     required this.stage,
//     required this.deals,
//     required this.hovering,
//     required this.onAddDeal,
//     required this.onEnter,
//     required this.onExit,
//     required this.onAccept,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final borderColor = hovering ? Colors.blue : Colors.transparent;

//     return Padding(
//       padding: const EdgeInsets.only(right: 16),
//       child: Container(
//         width: 320,
//         decoration: BoxDecoration(
//           color: Colors.grey.shade50,
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(color: borderColor, width: hovering ? 2 : 1),
//         ),
//         child: Column(
//           children: [
//             // Header
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade100,
//                 borderRadius: const BorderRadius.vertical(
//                   top: Radius.circular(12),
//                 ),
//               ),
//               child: Row(
//                 children: [
//                   Text(
//                     stage.title,
//                     style: const TextStyle(fontWeight: FontWeight.w700),
//                   ),
//                   const SizedBox(width: 8),
//                   _CountBadge(count: deals.length),
//                   const Spacer(),
//                   IconButton(
//                     tooltip: 'Add Deal',
//                     onPressed: onAddDeal,
//                     icon: const Icon(Icons.add),
//                   ),
//                 ],
//               ),
//             ),

//             // Drop zone + list
//             Expanded(
//               child: DragTarget<DragPayload>(
//                 onWillAccept: (_) {
//                   onEnter();
//                   return true;
//                 },
//                 onLeave: (_) => onExit(),
//                 onAccept: onAccept,
//                 builder: (context, candidateData, rejectedData) {
//                   return ListView.builder(
//                     padding: const EdgeInsets.all(12),
//                     itemCount: deals.length,
//                     itemBuilder: (ctx, i) {
//                       final d = deals[i];
//                       return Padding(
//                         padding: const EdgeInsets.only(bottom: 12),
//                         child: _DealCard(deal: d, stageId: stage.id),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// /// Draggable deal card
// class _DealCard extends StatelessWidget {
//   final Deal deal;
//   final String stageId;
//   const _DealCard({required this.deal, required this.stageId});

//   @override
//   Widget build(BuildContext context) {
//     return LongPressDraggable<DragPayload>(
//       data: DragPayload(fromStageId: stageId, deal: deal),
//       feedback: Material(
//         elevation: 6,
//         borderRadius: BorderRadius.circular(12),
//         child: _DealCardBody(deal: deal, isGhost: true),
//       ),
//       childWhenDragging: Opacity(
//         opacity: 0.3,
//         child: _DealCardBody(deal: deal),
//       ),
//       child: _DealCardBody(deal: deal),
//     );
//   }
// }

// class _DealCardBody extends StatelessWidget {
//   final Deal deal;
//   final bool isGhost;
//   const _DealCardBody({required this.deal, this.isGhost = false});

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 120),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.grey.shade300),
//         boxShadow:
//             isGhost
//                 ? [
//                   BoxShadow(
//                     color: Colors.black12,
//                     blurRadius: 8,
//                     offset: const Offset(0, 4),
//                   ),
//                 ]
//                 : [
//                   BoxShadow(
//                     color: Colors.black12,
//                     blurRadius: 3,
//                     offset: const Offset(0, 2),
//                   ),
//                 ],
//       ),
//       padding: const EdgeInsets.all(12),
//       width: 296,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               _ColorDot(color: deal.color),
//               const SizedBox(width: 8),
//               Expanded(
//                 child: Text(
//                   deal.title,
//                   style: const TextStyle(fontWeight: FontWeight.w600),
//                 ),
//               ),
//               Text(
//                 '₹${deal.amount.toStringAsFixed(0)}',
//                 style: const TextStyle(fontWeight: FontWeight.w700),
//               ),
//             ],
//           ),
//           const SizedBox(height: 6),
//           Row(
//             children: [
//               Icon(Icons.apartment, size: 16, color: Colors.grey.shade600),
//               const SizedBox(width: 6),
//               Expanded(
//                 child: Text(
//                   deal.company,
//                   style: TextStyle(color: Colors.grey.shade700),
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//               const SizedBox(width: 8),
//               CircleAvatar(
//                 radius: 12,
//                 backgroundColor: Colors.blue.shade100,
//                 child: Text(
//                   deal.owner,
//                   style: const TextStyle(
//                     fontSize: 10,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black87,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _ColorDot extends StatelessWidget {
//   final Color color;
//   const _ColorDot({required this.color});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 10,
//       height: 10,
//       decoration: BoxDecoration(color: color, shape: BoxShape.circle),
//     );
//   }
// }

// class _AddStageTile extends StatelessWidget {
//   final VoidCallback onTap;
//   const _AddStageTile({required this.onTap});
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(12),
//       child: Container(
//         width: 220,
//         height: 60,
//         alignment: Alignment.center,
//         margin: const EdgeInsets.only(left: 8, right: 8, top: 4),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(
//             color: Colors.grey.shade400,
//             style: BorderStyle.solid,
//           ),
//           color: Colors.white,
//         ),
//         child: const Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [Icon(Icons.add), SizedBox(width: 8), Text('Add Stage')],
//         ),
//       ),
//     );
//   }
// }

// class _CountBadge extends StatelessWidget {
//   final int count;
//   const _CountBadge({required this.count});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//       decoration: BoxDecoration(
//         color: Colors.grey.shade300,
//         borderRadius: BorderRadius.circular(999),
//       ),
//       child: Text(
//         '$count',
//         style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
//       ),
//     );
//   }
// }
//main working ends

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sahibot_crm_web/config/app_theme.dart';
import 'package:sahibot_crm_web/screens/kanban/kanban_models.dart';
import 'package:sahibot_crm_web/screens/kanban/pipeline_details_screen.dart';
import 'package:sahibot_crm_web/widgets/leads_section_sidebar.dart';
import 'package:sahibot_crm_web/widgets/move_lead_dialog.dart';
import '../../../widgets/topbar.dart';
import '../../../widgets/sidebar.dart';
import 'package:sahibot_crm_web/screens/kanban/AddDealDrawer.dart';

/// Simple in-memory models (frontend-only)
// class Stage {
//   final String id;
//   String title;
//   Stage({required this.id, required this.title});
// }

// class Deal {
//   final String id;
//   String title;
//   double amount;
//   String company;
//   String owner;
//   Color color;

//   // NEW fields to match the richer card UI
//   DateTime createdAt;
//   DateTime updatedAt;
//   DateTime? closeDate;
//   String assignedTo;

//   Deal({
//     required this.id,
//     required this.title,
//     required this.amount,
//     required this.company,
//     required this.owner,
//     required this.color,
//     DateTime? createdAt,
//     DateTime? updatedAt,
//     this.closeDate,
//     String? assignedTo,
//   }) : createdAt = createdAt ?? DateTime.now(),
//        updatedAt = updatedAt ?? DateTime.now(),
//        assignedTo = assignedTo ?? owner;
// }

/// Payload carried while dragging
class DragPayload {
  final String fromStageId;
  final Deal deal;
  DragPayload({required this.fromStageId, required this.deal});
}

class pipelinesScreen extends StatefulWidget {
  const pipelinesScreen({super.key});

  @override
  State<pipelinesScreen> createState() => _pipelinesScreenState();
}

class _pipelinesScreenState extends State<pipelinesScreen>
    with SingleTickerProviderStateMixin {
  // Pipelines dropdown (UI-only)
  final List<String> _pipelines = const ['Software Sale Pipeline'];
  String _selectedPipeline = 'Software Sale Pipeline';

  //bool _isBoardView = true;

  // Search text
  String _search = '';
  bool _isBoardView = true; // true = board, false = list

  // Stages (columns)
  final List<Stage> _stages = [
    Stage(id: 'prospecting', title: 'Prospecting'),
    Stage(id: 'product_demo', title: 'Product Demo'),
    Stage(id: 'proposal_sent', title: 'Proposal Sent'),
    Stage(id: 'negotiation', title: 'Negotiation'),
  ];

  // Deals per stage (in-memory)
  late Map<String, List<Deal>> _deals;

  // Hover state for drag highlight
  String? _hoveringStageId;

  Stage _byId(String id) => _stages.firstWhere((s) => s.id == id);

  Future<void> _onDrop(DragPayload payload, String toStageId) async {
    if (payload.fromStageId == toStageId) return;

    final from = _stages.firstWhere((s) => s.id == payload.fromStageId);
    final to = _stages.firstWhere((s) => s.id == toStageId);

    // show the same “Move Lead” dialog you already built
    final ok = await showMoveLeadDialog(
      context: context,
      title: payload.deal.title,
      pipelineName: _selectedPipeline,
      from: from,
      to: to,
    );

    if (ok == true) {
      _moveDeal(payload, toStageId); // your existing mover
    } else {
      setState(() => _hoveringStageId = null);
    }
  }

  Future<void> _requestMove(DragPayload payload, String toStageId) async {
    final ok = await showMoveLeadDialog(
      context: context,
      title: payload.deal.title,
      pipelineName: _selectedPipeline,
      from: _byId(payload.fromStageId),
      to: _byId(toStageId),
    );
    if (ok == true) {
      _moveDeal(payload, toStageId); // your existing move logic
    }
  }

  bool _matches(Deal d) {
    final q = _search.toLowerCase();
    if (q.isEmpty) return true;
    return d.title.toLowerCase().contains(q) ||
        d.owner.toLowerCase().contains(q);
  }

  String _fmtDate(DateTime? d) =>
      d == null ? '—' : '${d.day}/${d.month}/${d.year}';

  String _initials(String name) {
    final parts =
        name.trim().split(RegExp(r'\s+')).where((e) => e.isNotEmpty).toList();
    if (parts.isEmpty) return '?';
    final first = parts.first[0];
    final last = parts.length > 1 ? parts.last[0] : '';
    return (first + last).toUpperCase();
  }

  String _stageTitle(String id) =>
      _stages
          .firstWhere((s) => s.id == id, orElse: () => Stage(id: id, title: id))
          .title;

  Widget _stagePill(String title) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
    decoration: BoxDecoration(
      color: const Color(0xFFFFF1DB),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: const Color(0xFFF7A645)),
    ),
    child: Text(title),
  );

  Widget _circleAction(IconData icon) => Container(
    width: 36,
    height: 36,
    decoration: const BoxDecoration(
      color: Color(0xFFF2F5FA),
      shape: BoxShape.circle,
    ),
    child: Icon(icon, color: Colors.grey.shade700),
  );

  void _openDealDetails(Deal d, String stageId) {
    context.pushNamed(
      'pipeline-details',
      extra: PipelineDetailsArgs(
        pipelineName: _selectedPipeline,
        currentStageId: stageId,
        stages: _stages,
        deal: d,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();

    _deals = {
      'prospecting': [
        Deal(
          id: 'd1',
          title: 'T1',
          amount: 6000,
          company: 'Acme Inc',
          owner: 'Bilal Shaikh',
          color: Colors.blue,
          createdAt: now.subtract(const Duration(days: 33)),
          updatedAt: now.subtract(const Duration(days: 33)),
          closeDate: DateTime(now.year, 6, 27),
        ),
      ],
      'product_demo': [
        Deal(
          id: 'd2',
          title: 'SahiBot x Elegent',
          amount: 6000,
          company: 'Globex',
          owner: 'Bilal Shaikh',
          color: Colors.green,
          createdAt: now.subtract(const Duration(days: 33)),
          updatedAt: now.subtract(const Duration(days: 33)),
          closeDate: DateTime(now.year, 6, 27),
        ),
      ],
      'proposal_sent': [],
      'negotiation': [],
    };
  }

  // Create a new stage
  Future<void> _addStage() async {
    final controller = TextEditingController();
    final ok = await showDialog<bool>(
      context: context,
      builder:
          (ctx) => AlertDialog(
            title: const Text('Add Stage'),
            content: TextField(
              controller: controller,
              decoration: const InputDecoration(hintText: 'e.g. Negotiation'),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(ctx, true),
                child: const Text('Add'),
              ),
            ],
          ),
    );
    if (ok == true && controller.text.trim().isNotEmpty) {
      final id = controller.text.trim().toLowerCase().replaceAll(' ', '_');
      setState(() {
        _stages.add(Stage(id: id, title: controller.text.trim()));
        _deals[id] = [];
      });
    }
  }

  void _toggleView() => setState(() => _isBoardView = !_isBoardView);

  // Create a new deal within a stage
  Future<void> _addDeal(String stageId) async {
    final title = TextEditingController();
    final amount = TextEditingController();
    final company = TextEditingController();
    final ok = await showDialog<bool>(
      context: context,
      builder:
          (ctx) => AlertDialog(
            title: const Text('Add Deal'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: title,
                  decoration: const InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: amount,
                  decoration: const InputDecoration(labelText: 'Amount'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: company,
                  decoration: const InputDecoration(labelText: 'Company'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(ctx, true),
                child: const Text('Add'),
              ),
            ],
          ),
    );
    if (ok == true && title.text.trim().isNotEmpty) {
      setState(() {
        _deals[stageId]!.add(
          Deal(
            id: UniqueKey().toString(),
            title: title.text.trim(),
            amount: double.tryParse(amount.text.trim()) ?? 0,
            company: company.text.trim().isEmpty ? '—' : company.text.trim(),
            owner: 'OP',
            color: Colors.purple,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            closeDate: null,
          ),
        );
      });
    }
  }

  // Move deal between stages (append to end)
  void _moveDeal(DragPayload payload, String toStageId) {
    final from = payload.fromStageId;
    if (from == toStageId) return;
    setState(() {
      final fromList = _deals[from]!;
      final toList = _deals[toStageId]!;
      final idx = fromList.indexWhere((d) => d.id == payload.deal.id);
      if (idx != -1) {
        final deal = fromList.removeAt(idx);
        deal.updatedAt = DateTime.now();
        toList.add(deal);
      }
      _hoveringStageId = null;
    });
  }

  // ---------- helpers for summary ----------
  int _stageAmount(String stageId) =>
      _deals[stageId]!.fold(0, (sum, d) => sum + d.amount.toInt());

  int get _totalLeads => _stages.fold(0, (s, st) => s + _deals[st.id]!.length);
  int get _totalAmount => _stages.fold(0, (s, st) => s + _stageAmount(st.id));

  int get _openLeads => _totalLeads; // demo (no won/lost columns yet)
  int get _openAmount => _totalAmount;
  //int get _wonLeads => 0, _wonAmount => 0;, _lostLeads => 0, _lostAmount => 0;

  int get _wonLeads => 0;
  int get _wonAmount => 0;
  int get _lostLeads => 0;
  int get _lostAmount => 0;

  String _money(int n) {
    // quick "12,000/-" formatter (Indian-ish feel)
    final s = n.toString();
    if (s.length <= 3) return '$s/-';
    final head = s.substring(0, s.length - 3);
    final tail = s.substring(s.length - 3);
    final headWithCommas = head.replaceAllMapped(
      RegExp(r'(\d)(?=(\d{2})+(?!\d))'),
      (m) => '${m[1]},',
    );
    return '$headWithCommas,$tail/-';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              const Sidebar(),
              const LeadsSectionSidebar(),
              // Board
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 64.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _toolbar(),
                      const SizedBox(height: 8),
                      _summaryRow(),
                      const SizedBox(height: 8),
                      //const Divider(height: 1),
                      Expanded(
                        child: _isBoardView ? _buildBoard() : _buildList(),
                      ),
                      // Expanded(
                      //   child: SingleChildScrollView(
                      //     scrollDirection: Axis.horizontal,
                      //     padding: const EdgeInsets.all(16),
                      //     child: Row(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         for (final stage in _stages)
                      //           _KanbanColumn(
                      //             key: ValueKey(stage.id),
                      //             stage: stage,
                      //             deals:
                      //                 _deals[stage.id]!
                      //                     .where(
                      //                       (d) =>
                      //                           _search.isEmpty ||
                      //                           d.title.toLowerCase().contains(
                      //                             _search.toLowerCase(),
                      //                           ) ||
                      //                           d.owner.toLowerCase().contains(
                      //                             _search.toLowerCase(),
                      //                           ),
                      //                     )
                      //                     .toList(),
                      //             hovering: _hoveringStageId == stage.id,
                      //             onAddDeal: () => _addDeal(stage.id),
                      //             onEnter:
                      //                 () => setState(
                      //                   () => _hoveringStageId = stage.id,
                      //                 ),
                      //             onExit:
                      //                 () => setState(
                      //                   () => _hoveringStageId = null,
                      //                 ),
                      //             onAccept:
                      //                 (payload) => _moveDeal(payload, stage.id),
                      //           ),
                      //         _AddStageTile(onTap: _addStage),
                      //       ],
                      //     ),
                      //   ),
                      // ),
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
              builder: (ctx) => const TopBar(), // ctx is under GoRouter
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBoard() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final stage in _stages)
            _KanbanColumn(
              key: ValueKey(stage.id),
              stage: stage,
              deals: _deals[stage.id]!.where(_matches).toList(),
              hovering: _hoveringStageId == stage.id,
              onAddDeal: () => _addDeal(stage.id),
              onEnter: () => setState(() => _hoveringStageId = stage.id),
              onExit: () => setState(() => _hoveringStageId = null),
              // onAccept: (payload) => _moveDeal(payload, stage.id),
              // onAccept: (payload) => _requestMove(payload, stage.id),//working
              onAccept: (payload) => _onDrop(payload, stage.id),
              // ⬇️ pass from parent
              allStages: _stages,
              pipelineName: _selectedPipeline,
            ),
          _AddStageTile(onTap: _addStage),
        ],
      ),
    );
  }

  Widget _buildList() {
    // flatten deals with their stage
    final rows = <DataRow>[];
    int index = 0;
    for (final st in _stages) {
      for (final d in _deals[st.id]!.where(_matches)) {
        final open = () => _openDealDetails(d, st.id);
        rows.add(
          DataRow(
            color: MaterialStatePropertyAll(
              index.isEven ? Colors.white : const Color(0xFFF6F8FB),
            ),
            //onSelectChanged: (_) => open(), // tap anywhere in the row
            cells: [
              // checkbox
              const DataCell(Checkbox(value: false, onChanged: null)),
              // Title
              DataCell(
                Text(
                  d.title,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              // Contact Person
              DataCell(Text(d.owner)),
              // Estimated Amount
              DataCell(Text(_money(d.amount.toInt()))),
              // Date column (3 lines)
              // DataCell(
              //   Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       const Text('Created At: about a month ago'),
              //       const Text('Updated At: about a month ago'),
              //       Text('Close Date: ${_fmtDate(d.closeDate)}'),
              //     ],
              //   ),
              // ),
              DataCell(
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 260,
                  ), // gives that column space
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // don’t force extra height
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Created At: about a month ago',
                        style: TextStyle(fontSize: 12),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        'Updated At: about a month ago',
                        style: TextStyle(fontSize: 12),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Close Date: ${_fmtDate(d.closeDate)}',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                //onTap: open,
              ),

              // Assigned To (avatar + name)
              DataCell(
                Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: const Color(0xFFDCE3F6),
                      child: Text(
                        _initials(d.owner),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(d.owner),
                  ],
                ),
                //onTap: open,
              ),
              // Stage pill
              DataCell(_stagePill(_stageTitle(st.id))),
              // Action icons
              DataCell(
                Row(
                  children: [
                    IconButton(
                      onPressed: open,
                      icon: Icon(Icons.visibility_outlined),
                    ),
                    //_circleAction(Icons.visibility_outlined),
                    const SizedBox(width: 8),
                    _circleAction(Icons.more_vert),
                  ],
                ),
              ),
            ],
          ),
        );
        index++;
      }
    }

    final headingStyle = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w700,
    );

    final table = DataTable(
      headingRowColor: MaterialStatePropertyAll(
        AppCustomTheme.bluePrimary,
      ), // green header
      columnSpacing: 24,
      horizontalMargin: 16,
      headingRowHeight: 52,
      dataRowMinHeight: 72, // <-- key lines
      dataRowMaxHeight: 88, // <-- key lines
      columns:
          const [
            DataColumn(label: SizedBox(width: 24)), // checkbox header
            DataColumn(label: Text('Title')),
            DataColumn(label: Text('Contact Person')),
            DataColumn(label: Text('Estimated Amount')),
            DataColumn(label: Text('Date')),
            DataColumn(label: Text('Assigned To')),
            DataColumn(label: Text('Stage')),
            DataColumn(label: Text('Action')),
          ].map((c) {
            // apply heading text style
            return DataColumn(
              label: DefaultTextStyle.merge(
                style: headingStyle,
                child: c.label,
              ),
              numeric: c.numeric,
              tooltip: c.tooltip,
              onSort: c.onSort,
            );
          }).toList(),
      rows: rows,
    );

    // return Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    //   child: ClipRRect(
    //     borderRadius: BorderRadius.circular(12),
    //     child: SingleChildScrollView(
    //       scrollDirection: Axis.horizontal,
    //       child: SingleChildScrollView(child: table),
    //     ),
    //   ),
    // );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: LayoutBuilder(
          builder: (ctx, cons) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: cons.maxWidth),
                child: SingleChildScrollView(
                  child: table, // the DataTable from above
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // ---------- UI: toolbar & summary ----------

  // Widget _toolbar() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
  //     child: Row(
  //       children: [
  //         // Pipeline dropdown
  //         SizedBox(
  //           width: 260,
  //           child: DropdownButtonFormField<String>(
  //             value: _selectedPipeline,
  //             items:
  //                 _pipelines
  //                     .map((p) => DropdownMenuItem(value: p, child: Text(p)))
  //                     .toList(),
  //             onChanged:
  //                 (v) =>
  //                     setState(() => _selectedPipeline = v ?? _pipelines.first),
  //             decoration: InputDecoration(
  //               contentPadding: const EdgeInsets.symmetric(
  //                 horizontal: 12,
  //                 vertical: 10,
  //               ),
  //               border: OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(8),
  //               ),
  //             ),
  //           ),
  //         ),
  //         const SizedBox(width: 8),

  //         // + Lead
  //         ElevatedButton.icon(
  //           onPressed: () {},
  //           icon: const Icon(Icons.add, color: Colors.white),
  //           label: const Text('Lead'),
  //           style: ElevatedButton.styleFrom(
  //             backgroundColor: Colors.green,
  //             foregroundColor: Colors.white,
  //             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(8),
  //             ),
  //           ),
  //         ),
  //         const SizedBox(width: 8),

  //         // Search
  //         SizedBox(
  //           width: 200,
  //           child: TextField(
  //             onChanged: (v) => setState(() => _search = v),
  //             decoration: InputDecoration(
  //               hintText: 'Search Leads',
  //               prefixIcon: const Icon(Icons.search),
  //               isDense: true,
  //               border: OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(8),
  //               ),
  //               contentPadding: const EdgeInsets.symmetric(
  //                 horizontal: 12,
  //                 vertical: 12,
  //               ),
  //             ),
  //           ),
  //         ),
  //         const SizedBox(width: 8),

  //         // _iconBtn(Icons.view_kanban_outlined),
  //         const SizedBox(width: 6),

  //         // Filter
  //         // ElevatedButton.icon(
  //         //   onPressed: () {},
  //         //   icon: const Icon(Icons.filter_alt, color: Colors.white),
  //         //   label: const Text('Filter'),
  //         //   style: ElevatedButton.styleFrom(
  //         //     backgroundColor: Colors.teal,
  //         //     foregroundColor: Colors.white,
  //         //     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
  //         //     shape: RoundedRectangleBorder(
  //         //       borderRadius: BorderRadius.circular(8),
  //         //     ),
  //         //   ),
  //         // ),
  //         //const SizedBox(width: 6),

  //         // Sort (static)
  //         SizedBox(
  //           width: 190,
  //           child: DropdownButtonFormField<String>(
  //             value: 'Created Sequence',
  //             items: const [
  //               DropdownMenuItem(
  //                 value: 'Created Sequence',
  //                 child: Text('Created Sequence'),
  //               ),
  //               DropdownMenuItem(
  //                 value: 'Amount High → Low',
  //                 child: Text('Amount High → Low'),
  //               ),
  //               DropdownMenuItem(
  //                 value: 'Amount Low → High',
  //                 child: Text('Amount Low → High'),
  //               ),
  //             ],
  //             onChanged: (_) {},
  //             decoration: InputDecoration(
  //               contentPadding: const EdgeInsets.symmetric(
  //                 horizontal: 12,
  //                 vertical: 10,
  //               ),
  //               border: OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(8),
  //               ),
  //             ),
  //           ),
  //         ),
  //         // const SizedBox(width: 6),
  //         // _iconBtn(Icons.swap_vert),
  //         // const SizedBox(width: 6),
  //         // _iconBtn(Icons.refresh),
  //       ],
  //     ),
  //   );
  // }

  Widget _toolbar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          // Pipeline dropdown
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 220, maxWidth: 220),
            child: DropdownButtonFormField<String>(
              value: _selectedPipeline,
              items:
                  _pipelines
                      .map((p) => DropdownMenuItem(value: p, child: Text(p)))
                      .toList(),
              onChanged:
                  (v) =>
                      setState(() => _selectedPipeline = v ?? _pipelines.first),
              isDense: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),

          // + Lead
          ElevatedButton.icon(
            onPressed: () {
              showGeneralDialog(
                context: context,
                barrierDismissible: true,
                barrierLabel: "Add Deal",
                transitionDuration: const Duration(milliseconds: 300),
                pageBuilder:
                    (c, a, s) => Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: MediaQuery.of(c).size.width * 0.40, // 40% drawer
                        child: AddDealDrawer(
                          onSubmit: (deal) {
                            // TODO: wire to backend later
                            // print(deal);
                          },
                        ),
                      ),
                    ),
                transitionBuilder:
                    (c, a, s, child) => SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1, 0),
                        end: Offset.zero,
                      ).animate(a),
                      child: child,
                    ),
              );
            },
            icon: const Icon(Icons.add, color: Colors.white),
            label: const Text('Lead'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppCustomTheme.bluePrimary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),

          // Search
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 200, maxWidth: 200),
            child: TextField(
              onChanged: (v) => setState(() => _search = v),
              decoration: InputDecoration(
                hintText: 'Search Leads',
                prefixIcon: const Icon(Icons.search),
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
              ),
            ),
          ),

          // (optional) board icon to show current mode – kept compact
          // _iconBtn(Icons.view_kanban_outlined),

          // // Filter
          // ElevatedButton.icon(
          //   onPressed: () {},
          //   icon: const Icon(Icons.filter_alt, color: Colors.white),
          //   label: const Text('Filter'),
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: Colors.teal,
          //     foregroundColor: Colors.white,
          //     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(8),
          //     ),
          //   ),
          // ),

          // <-- SWITCH ICON before Sort (toggles board <-> list)
          // _iconBtn(
          //   _isBoardView
          //       ? Icons.view_kanban_outlined
          //       : Icons.table_rows_outlined,
          //   onPressed: _toggleView,
          // ),
          ViewModeSwitch(
            isBoard: _isBoardView,
            onChanged: (v) => setState(() => _isBoardView = v),
          ),

          // Sort dropdown (reduced width to avoid overflows)
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 180, maxWidth: 210),
            child: DropdownButtonFormField<String>(
              value: 'Created Sequence',
              items: const [
                DropdownMenuItem(
                  value: 'Created Sequence',
                  child: Text('Created Sequence'),
                ),
                DropdownMenuItem(
                  value: 'Amount High → Low',
                  child: Text('Amount High → Low'),
                ),
                DropdownMenuItem(
                  value: 'Amount Low → High',
                  child: Text('Amount Low → High'),
                ),
              ],
              onChanged: (_) {},
              isDense: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),

          // _iconBtn(Icons.swap_vert), // sort order
          // _iconBtn(Icons.refresh), // refresh
        ],
      ),
    );
  }

  Widget _summaryRow() {
    Widget chip(String title, int count, int amount) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$title: $count',
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            Text(
              'Amount : ${_money(amount)}',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      // scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          chip('Total', _totalLeads, _totalAmount),
          chip('Open', _openLeads, _openAmount),
          chip('Won', _wonLeads, _wonAmount),
          chip('Lost', _lostLeads, _lostAmount),
        ],
      ),
    );
  }

  Widget _iconBtn(IconData icon, {VoidCallback? onPressed}) => Container(
    decoration: BoxDecoration(
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(8),
    ),
    child: IconButton(onPressed: onPressed ?? () {}, icon: Icon(icon)),
  );

  // Widget _iconBtn(IconData icon) => Container(
  //   decoration: BoxDecoration(
  //     color: Colors.grey.shade200,
  //     borderRadius: BorderRadius.circular(8),
  //   ),
  //   child: IconButton(onPressed: () {}, icon: Icon(icon)),
  // );
}

class ViewModeSwitch extends StatelessWidget {
  final bool isBoard;
  final ValueChanged<bool> onChanged;
  const ViewModeSwitch({
    super.key,
    required this.isBoard,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    const double h = 32;
    const double w = 68;
    const double pad = 4;
    const double knob = h - pad * 2;

    return GestureDetector(
      onTap: () => onChanged(!isBoard),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        width: w,
        height: h,
        padding: const EdgeInsets.all(pad),
        decoration: BoxDecoration(
          color: const Color(0xFF505A64),
          borderRadius: BorderRadius.circular(h),
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // ICON moves to the opposite side of the knob
            AnimatedAlign(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              alignment: isBoard ? Alignment.centerLeft : Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Icon(
                  isBoard
                      ? Icons.view_kanban_outlined
                      : Icons.table_rows_outlined,
                  size: 18,
                  color: Colors.white,
                ),
              ),
            ),

            // KNOB slides left/right
            AnimatedAlign(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              alignment: isBoard ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: knob,
                height: knob,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x33000000),
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class ViewModeSwitch extends StatelessWidget {
//   final bool isBoard;
//   final ValueChanged<bool> onChanged;
//   const ViewModeSwitch({
//     super.key,
//     required this.isBoard,
//     required this.onChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     // Sizes tuned to match the screenshot style
//     const double h = 32;
//     const double w = 68;
//     const double pad = 4;
//     const double knob = h - pad * 2;

//     return GestureDetector(
//       onTap: () => onChanged(!isBoard),
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 200),
//         curve: Curves.easeOut,
//         width: w,
//         height: h,
//         padding: const EdgeInsets.all(pad),
//         decoration: BoxDecoration(
//           color: const Color(0xFF505A64), // dark grey track
//           borderRadius: BorderRadius.circular(h),
//           boxShadow: const [
//             BoxShadow(
//               color: Color(0x14000000),
//               blurRadius: 6,
//               offset: Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             // the small icon inside the track (left)
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 6),
//                 child: Icon(
//                   isBoard
//                       ? Icons.view_kanban_outlined
//                       : Icons.table_rows_outlined,
//                   size: 18,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             // Sliding white knob
//             AnimatedAlign(
//               duration: const Duration(milliseconds: 200),
//               curve: Curves.easeOut,
//               alignment: isBoard ? Alignment.centerRight : Alignment.centerLeft,
//               child: Container(
//                 width: knob,
//                 height: knob,
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   shape: BoxShape.circle,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Color(0x33000000),
//                       blurRadius: 6,
//                       offset: Offset(0, 2),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

/// Single Kanban column with a DragTarget covering the list area
class _KanbanColumn extends StatelessWidget {
  final Stage stage;
  final List<Deal> deals;
  final bool hovering;
  final VoidCallback onAddDeal;
  final VoidCallback onEnter;
  final VoidCallback onExit;
  final void Function(DragPayload payload) onAccept;

  final List<Stage> allStages;
  final String pipelineName;

  const _KanbanColumn({
    super.key,
    required this.stage,
    required this.deals,
    required this.hovering,
    required this.onAddDeal,
    required this.onEnter,
    required this.onExit,
    required this.onAccept,
    required this.allStages, // ⬅️ NEW
    required this.pipelineName, // ⬅️ NEW
  });

  String _money(int n) {
    final s = n.toString();
    if (s.length <= 3) return '$s/-';
    final head = s.substring(0, s.length - 3);
    final tail = s.substring(s.length - 3);
    final headWithCommas = head.replaceAllMapped(
      RegExp(r'(\d)(?=(\d{2})+(?!\d))'),
      (m) => '${m[1]},',
    );
    return '$headWithCommas,$tail/-';
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = hovering ? Colors.blue : Colors.grey.shade300;
    final stageAmount = deals.fold<int>(0, (s, d) => s + d.amount.toInt());

    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Container(
        width: 320,
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor, width: hovering ? 2 : 1),
        ),
        child: Column(
          children: [
            // Blue-ish header
            Container(
              padding: const EdgeInsets.fromLTRB(12, 10, 8, 8),
              decoration: const BoxDecoration(
                color: Color(0xFFE9F2FF),
                borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          stage.title,
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Text(
                              '${deals.length} leads',
                              style: TextStyle(color: Colors.grey.shade700),
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.monetization_on,
                              size: 16,
                              color: Colors.orange,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              _money(stageAmount),
                              style: TextStyle(color: Colors.grey.shade900),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: onAddDeal,
                    icon: const Icon(Icons.more_vert),
                  ),
                ],
              ),
            ),

            // Drop zone + list
            Expanded(
              child: DragTarget<DragPayload>(
                onWillAccept: (_) {
                  onEnter();
                  return true;
                },
                onLeave: (_) => onExit(),
                onAccept: onAccept,
                builder: (context, candidateData, rejectedData) {
                  if (deals.isEmpty) {
                    return Center(
                      child: Text(
                        'No Leads Found',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: deals.length,
                    itemBuilder: (ctx, i) {
                      final d = deals[i];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        // child: _DealCard(
                        //   deal: d,
                        //   stageId: stage.id,
                        //   allStages: allStages,
                        //   pipelineName: pipelineName,
                        // ),
                        child: _DraggableDeal(
                          deal: d,
                          stageId: stage.id,
                          allStages: allStages,
                          pipelineName: pipelineName,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DraggableDeal extends StatelessWidget {
  final Deal deal;
  final String stageId;
  final List<Stage> allStages;
  final String pipelineName;

  const _DraggableDeal({
    required this.deal,
    required this.stageId,
    required this.allStages,
    required this.pipelineName,
  });

  @override
  Widget build(BuildContext context) {
    return Draggable<DragPayload>(
      data: DragPayload(fromStageId: stageId, deal: deal),
      feedback: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(8),
        child: _DealCardBody(deal: deal, isGhost: true),
      ),
      childWhenDragging: Opacity(
        opacity: 0.3,
        child: _DealCardBody(deal: deal),
      ),
      child: InkWell(
        onTap: () {
          // go_router
          context.pushNamed(
            'pipeline-details',
            extra: PipelineDetailsArgs(
              pipelineName: pipelineName,
              currentStageId: stageId,
              stages: allStages,
              deal: deal,
            ),
          );
        },
        child: _DealCardBody(deal: deal),
      ),
    );
  }
}


/// Draggable deal card
class _DealCard extends StatelessWidget {
  final Deal deal;
  final String stageId;
  final List<Stage> allStages; // pass this through where you create _DealCard
  final String pipelineName; // pass current pipeline name
  const _DealCard({
    required this.deal,
    required this.stageId,
    required this.allStages,
    required this.pipelineName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () {
      //   Navigator.of(context).push(
      //     MaterialPageRoute(
      //       builder:
      //           (_) => PipelineDetailsScreen(
      //             pipelineName: pipelineName,
      //             currentStageId: stageId,
      //             stages: allStages,
      //             deal: deal,
      //           ),
      //     ),
      //   );
      // },
      onTap: () {
        // final router = GoRouter.of(context);
        // // Navigator.of(context).pushNamed(
        // //   'pipeline-details',
        // //   extra: PipelineDetailsArgs(
        // //     pipelineName: pipelineName,
        // //     currentStageId: stageId,
        // //     stages: allStages,
        // //     deal: deal,
        // //   ),
        // // );
        // router.pushNamed(
        //   'pipeline-details',
        //   extra: PipelineDetailsArgs(
        //     pipelineName: pipelineName,
        //     currentStageId: stageId,
        //     stages: allStages,
        //     deal: deal,
        //   ),
        // );

        GoRouter.of(context).pushNamed(
          'pipeline-details',
          extra: PipelineDetailsArgs(
            pipelineName: pipelineName,
            currentStageId: stageId,
            stages: allStages,
            deal: deal,
          ),
        );
      },
      child: LongPressDraggable<DragPayload>(
        data: DragPayload(fromStageId: stageId, deal: deal),
        feedback: Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(8),
          child: _DealCardBody(deal: deal, isGhost: true),
        ),
        childWhenDragging: Opacity(
          opacity: 0.3,
          child: _DealCardBody(deal: deal),
        ),
        child: _DealCardBody(deal: deal),
      ),
    );
  }
}

class _DealCardBody extends StatelessWidget {
  final Deal deal;
  final bool isGhost;
  const _DealCardBody({required this.deal, this.isGhost = false});

  String _fmtDate(DateTime? d) =>
      d == null ? '—' : '${d.day}/${d.month}/${d.year}';

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 120),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: isGhost ? 10 : 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      width: 296,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title & actions
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  'L-1',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  deal.title,
                  style: const TextStyle(fontWeight: FontWeight.w800),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz, size: 20),
              ),
            ],
          ),
          const SizedBox(height: 6),

          // Created / Updated (static-ish strings for demo)
          Row(
            children: [
              const Icon(Icons.schedule, size: 16),
              const SizedBox(width: 6),
              Text(
                'about a month ago',
                style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Row(
            children: [
              const Icon(Icons.update, size: 16),
              const SizedBox(width: 6),
              Text(
                'Updated At: about a month ago',
                style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Owner
          Row(
            children: [
              const Icon(Icons.person, size: 16),
              const SizedBox(width: 6),
              Text(
                deal.owner,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 6),

          // Amount
          Row(
            children: const [
              Icon(Icons.account_balance_wallet_outlined, size: 16),
              SizedBox(width: 6),
              Text('Amount : ', style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
          Text(
            '${deal.amount.toStringAsFixed(0)}',
            style: const TextStyle(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 6),

          // Close Date
          Row(
            children: [
              const Icon(Icons.event_available, size: 16),
              const SizedBox(width: 6),
              const Text(
                'Close Date : ',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                _fmtDate(deal.closeDate),
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),

          // Assigned To
          Row(
            children: [
              const Icon(Icons.groups, size: 16),
              const SizedBox(width: 6),
              const Text(
                'Assigned To : ',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(deal.assignedTo, style: const TextStyle(color: Colors.blue)),
            ],
          ),
        ],
      ),
    );
  }
}

class _ColorDot extends StatelessWidget {
  final Color color;
  const _ColorDot({required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _AddStageTile extends StatelessWidget {
  final VoidCallback onTap;
  const _AddStageTile({required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 220,
        height: 60,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 8, right: 8, top: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey.shade400,
            style: BorderStyle.solid,
          ),
          color: Colors.white,
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [Icon(Icons.add), SizedBox(width: 8), Text('Add Stage')],
        ),
      ),
    );
  }
}

class _CountBadge extends StatelessWidget {
  final int count;
  const _CountBadge({required this.count});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        '$count',
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
      ),
    );
  }
}
