// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:sahibot_crm_web/config/app_theme.dart';
// import 'package:sahibot_crm_web/widgets/CompanyDropdown.dart';
// import 'package:sahibot_crm_web/widgets/customerDropdown.dart';

// class AddTask extends StatefulWidget {
//   @override
//   State<AddTask> createState() => _AddTaskState();
// }

// class _AddTaskState extends State<AddTask> {
//   final _formKey = GlobalKey<FormState>();

//   String selectedCountry = 'India';
//   String selectedCompanyName = 'Select Company Name';
//   String selectedLeadSource = 'Select Lead Source';
//   String get countryCode => selectedCountry == 'India' ? '+91' : '+971';

//   DateTime? dob;
//   DateTime? anniversary;

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.white,
//       elevation: 8,
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Text(
//                   "Add Task",
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 Spacer(),
//                 IconButton(
//                   icon: Icon(Icons.close),
//                   onPressed: () => Navigator.pop(context),
//                 ),
//               ],
//             ),
//             Divider(),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Form(
//                       key: _formKey,
//                       child: Column(
//                         children: [
//                           // const Align(
//                           //   alignment: Alignment.centerLeft,
//                           //   child: Text(
//                           //     "Add Follow Up",
//                           //     style: TextStyle(fontWeight: FontWeight.bold),
//                           //   ),
//                           // ),
//                           const SizedBox(height: 12),
//                           Row(children: [Expanded(child: Customerdropdown())]),
//                           const SizedBox(height: 12),
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: _buildTextField('Follow Up Description'),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 12),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("Follow Up Type"),
//                               SizedBox(width: 12),
//                               Row(
//                                 children: [
//                                   ChoiceChip(
//                                     label: Text('Call'),
//                                     selected: false,
//                                     onSelected: (_) {},
//                                   ),
//                                   const SizedBox(width: 8),
//                                   ChoiceChip(
//                                     label: Text('WhatsApp'),
//                                     selected: false,
//                                     onSelected: (_) {},
//                                   ),
//                                   const SizedBox(width: 8),
//                                   ChoiceChip(
//                                     label: Text('Email'),
//                                     selected: false,
//                                     onSelected: (_) {},
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 12),
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: _buildDateField(
//                                   "Follow Up Date",
//                                   anniversary,
//                                   (val) => setState(() => anniversary = val),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 12),
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: _buildTextField(
//                                   'Add Follow Up Reminder',
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 12),
//                         ],
//                       ),
//                     ),
//                     // Your form fields go here
//                   ],
//                 ),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 SizedBox(
//                   child: ElevatedButton.icon(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         // TODO: save the contact
//                         Navigator.pop(context);
//                       }
//                     },
//                     label: const Text(
//                       'Cancel',
//                       style: TextStyle(color: AppCustomTheme.bluePrimary),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       side: const BorderSide(
//                         color: AppCustomTheme.bluePrimary,
//                         width: 2,
//                       ),
//                       backgroundColor: Colors.transparent,
//                       foregroundColor: AppCustomTheme.bluePrimary,
//                       padding: const EdgeInsets.symmetric(
//                         vertical: 16,
//                         horizontal: 24,
//                       ),
//                       textStyle: const TextStyle(fontWeight: FontWeight.bold),
//                       elevation: 0,
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10),

//                 SizedBox(
//                   // width: 250,
//                   child: ElevatedButton.icon(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         // TODO: save the contact
//                         Navigator.pop(context);
//                       }
//                     },
//                     // icon: const Icon(Icons.add, color: Colors.white),
//                     label: const Text(
//                       'Add Follow Up',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: AppCustomTheme.bluePrimary,
//                       padding: const EdgeInsets.symmetric(
//                         vertical: 16,
//                         horizontal: 24,
//                       ),
//                       textStyle: const TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             // ElevatedButton(
//             //   onPressed: () {
//             //     // Save contact
//             //   },
//             //   child: Text("Add Contact"),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(String hint, {bool dense = false}) {
//     return TextFormField(
//       decoration: InputDecoration(
//         labelText: hint,
//         isDense: dense,
//         border: const OutlineInputBorder(),
//       ),
//     );
//   }

//   Widget _buildDateField(
//     String label,
//     DateTime? value,
//     void Function(DateTime?) onChanged,
//   ) {
//     return TextFormField(
//       controller: TextEditingController(
//         text: value != null ? DateFormat('dd/MM/yyyy').format(value) : '',
//       ),
//       // readOnly: true,
//       decoration: InputDecoration(
//         labelText: label,
//         suffixIcon: const Icon(Icons.calendar_today),
//         border: const OutlineInputBorder(),
//       ),
//       onTap: () async {
//         final picked = await showDatePicker(
//           context: context,
//           firstDate: DateTime(1950),
//           lastDate: DateTime(2100),
//           initialDate: DateTime.now(),
//         );
//         if (picked != null) {
//           onChanged(picked);
//         }
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sahibot_crm_web/config/app_theme.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final _formKey = GlobalKey<FormState>();

  // controllers / state
  final _taskNameCtl = TextEditingController();
  final _descCtl = TextEditingController();
  DateTime? _dueDate;

  // Related-to selection
  String? _selectedCategory; // Contacts / Pipelines / Parties
  String? _selectedItem; // e.g. "Bilal Shaikh"

  // Demo data (frontend only)
  final Map<String, List<String>> _relatedOptions = const {
    'Contacts': ['Bilal Shaikh', 'Owais Patel', 'Asha Iyer'],
    'Parties': ['Zylker Corp', 'Acme LLC', 'Globex Inc.'],
    'Pipelines': ['Website Redesign', 'Mobile App Deal', 'Enterprise RFP'],
    'Projects': ['Acme LLC','Zylker Corp', 'NoNo', 'Globex Inc.'],
  };

  @override
  void dispose() {
    _taskNameCtl.dispose();
    _descCtl.dispose();
    super.dispose();
  }

  Future<void> _pickDueDate() async {
    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
      initialDate: _dueDate ?? DateTime.now(),
    );
    if (picked != null) setState(() => _dueDate = picked);
  }

  void _openRelatedPicker() async {
    final result = await showDialog<_RelatedPickResult>(
      context: context,
      builder:
          (_) => _RelatedPickerDialog(
            options: _relatedOptions,
            initialCategory: _selectedCategory,
            initialItem: _selectedItem,
          ),
    );
    if (result != null) {
      setState(() {
        _selectedCategory = result.category;
        _selectedItem = result.item;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final headerBg = AppCustomTheme.lightBlueBg; // light section bg

    return Material(
      color: Colors.white,
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Drawer header
            Row(
              children: [
                const Text(
                  'Task Information',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context, false),
                ),
              ],
            ),
            const Divider(),

            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Task Name
                      _LabeledField(
                        // label: 'Task Name',
                        child: TextFormField(
                          controller: _taskNameCtl,
                          validator:
                              (v) =>
                                  (v == null || v.trim().isEmpty)
                                      ? 'Please enter a task name'
                                      : null,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hint: Text('Task Name'),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),

                      // Due Date
                      _LabeledField(
                        // label: 'Due Date',
                        child: TextFormField(
                          readOnly: true,
                          controller: TextEditingController(
                            text:
                                _dueDate == null
                                    ? ''
                                    : DateFormat(
                                      'dd/MM/yyyy',
                                    ).format(_dueDate!),
                          ),
                          onTap: _pickDueDate,
                          decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.calendar_today),
                            border: OutlineInputBorder(),
                            hint: Text('Due Date'),
                          ),
                          validator:
                              (_) =>
                                  _dueDate == null
                                      ? 'Please select due date'
                                      : null,
                        ),
                      ),
                      const SizedBox(height: 6),

                      // Related to (multi-level picker)
                      _LabeledField(
                        //label: 'Related to',
                        child: InkWell(
                          onTap: _openRelatedPicker,
                          borderRadius: BorderRadius.circular(6),
                          child: InputDecorator(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hint: Text('Related to'),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    (_selectedCategory == null ||
                                            _selectedItem == null)
                                        ? 'Related to'
                                        : '$_selectedCategory → $_selectedItem',
                                    style: TextStyle(
                                      color:
                                          (_selectedCategory == null ||
                                                  _selectedItem == null)
                                              ? Colors.black
                                              : Colors.black,
                                    ),
                                  ),
                                ),
                                const Icon(Icons.unfold_more),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),

                      // Description
                      _LabeledField(
                        //label: 'Description',
                        child: TextFormField(
                          controller: _descCtl,
                          maxLines: 4,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hint: Text('Description'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Footer actions
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context, false),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: AppCustomTheme.bluePrimary,
                    side: const BorderSide(color: AppCustomTheme.bluePrimary),
                    elevation: 0,
                  ),
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;
                    // Frontend-only: return a simple map so caller can inspect if needed
                    Navigator.pop(context, {
                      'taskName': _taskNameCtl.text.trim(),
                      'dueDate': _dueDate?.toIso8601String(),
                      'relatedCategory': _selectedCategory,
                      'relatedItem': _selectedItem,
                      'description': _descCtl.text.trim(),
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppCustomTheme.bluePrimary,
                  ),
                  child: const Text('Add Task'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Simple label + field wrapper (to visually resemble the table-like rows)
class _LabeledField extends StatelessWidget {
  final Widget child;
  const _LabeledField({required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [child],
    );
  }
}

// /// Result model for the picker dialog
// class _RelatedPickResult {
//   final String category;
//   final String item;
//   _RelatedPickResult(this.category, this.item);
// }

// class _RelatedPickerDialog extends StatefulWidget {
//   final Map<String, List<String>> options;
//   final String? initialCategory;
//   final String? initialItem;

//   const _RelatedPickerDialog({
//     required this.options,
//     this.initialCategory,
//     this.initialItem,
//   });

//   @override
//   State<_RelatedPickerDialog> createState() => _RelatedPickerDialogState();
// }

// class _RelatedPickerDialogState extends State<_RelatedPickerDialog> {
//   late String _category;
//   String? _selectedItem;

//   @override
//   void initState() {
//     super.initState();
//     _category = widget.initialCategory ?? widget.options.keys.first;
//     _selectedItem = widget.initialItem;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final items = widget.options[_category] ?? const <String>[];

//     return Dialog(
//       insetPadding: const EdgeInsets.symmetric(horizontal: 60, vertical: 80),
//       backgroundColor: Colors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       clipBehavior: Clip.antiAlias, // ← ROUND the dialog & clip children
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(16), // ← extra safety
//         child: Container(
//           decoration: BoxDecoration(
//             border: Border.all(color: AppCustomTheme.bluePrimary, width: 1.25),
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: SizedBox(
//             width: 560,
//             height: 360,
//             child: Row(
//               children: [
//                 // LEFT: categories
//                 Container(
//                   width: 200,
//                   decoration: BoxDecoration(
//                     color: Colors.grey.shade50,
//                     border: Border(
//                       right: BorderSide(color: Colors.grey.shade300),
//                     ),
//                   ),
//                   child: ListView(
//                     children:
//                         widget.options.keys.map((cat) {
//                           final selected = cat == _category;
//                           return ListTile(
//                             selected: selected,
//                             selectedTileColor: AppCustomTheme.lightBlueBg,
//                             title: Text(
//                               cat,
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w600,
//                                 // ← BLUE when selected
//                                 color:
//                                     selected
//                                         ? AppCustomTheme.bluePrimary
//                                         : Colors.black87,
//                               ),
//                             ),
//                             trailing: Icon(
//                               Icons.chevron_right,
//                               color:
//                                   selected
//                                       ? AppCustomTheme.bluePrimary
//                                       : Colors.black45,
//                             ),
//                             onTap:
//                                 () => setState(() {
//                                   _category = cat;
//                                   _selectedItem = null;
//                                 }),
//                           );
//                         }).toList(),
//                   ),
//                 ),

//                 // RIGHT: items
//                 Expanded(
//                   child: Column(
//                     children: [
//                       Container(
//                         height: 48,
//                         alignment: Alignment.centerLeft,
//                         padding: const EdgeInsets.symmetric(horizontal: 12),
//                         decoration: BoxDecoration(
//                           color: AppCustomTheme.lightBlueBg.withOpacity(.4),
//                           border: Border(
//                             bottom: BorderSide(
//                               color: AppCustomTheme.bluePrimary,
//                               width: 1,
//                             ),
//                           ),
//                         ),
//                         child: Text(
//                           '$_category',
//                           style: const TextStyle(
//                             fontWeight: FontWeight.w700,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: ListView.builder(
//                           itemCount: items.length,
//                           itemBuilder: (_, i) {
//                             final it = items[i];
//                             return RadioListTile<String>(
//                               value: it,
//                               groupValue: _selectedItem,
//                               activeColor: AppCustomTheme.bluePrimary,
//                               title: Text(it),
//                               onChanged:
//                                   (v) => setState(() => _selectedItem = v),
//                             );
//                           },
//                         ),
//                       ),
//                       const Divider(height: 1),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 12,
//                           vertical: 10,
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             TextButton(
//                               onPressed: () => Navigator.pop(context),
//                               style: TextButton.styleFrom(
//                                 foregroundColor: AppCustomTheme.bluePrimary,
//                               ),
//                               child: const Text('Cancel'),
//                             ),
//                             const SizedBox(width: 8),
//                             ElevatedButton(
//                               onPressed:
//                                   _selectedItem == null
//                                       ? null
//                                       : () => Navigator.pop(
//                                         context,
//                                         _RelatedPickResult(
//                                           _category,
//                                           _selectedItem!,
//                                         ),
//                                       ),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: AppCustomTheme.bluePrimary,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                               ),
//                               child: const Text('Select'),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

/// Result model for the picker dialog
class _RelatedPickResult {
  final String category;
  final String item;
  _RelatedPickResult(this.category, this.item);
}

class _RelatedPickerDialog extends StatefulWidget {
  final Map<String, List<String>> options;
  final String? initialCategory;
  final String? initialItem;

  const _RelatedPickerDialog({
    required this.options,
    this.initialCategory,
    this.initialItem,
  });

  @override
  State<_RelatedPickerDialog> createState() => _RelatedPickerDialogState();
}

class _RelatedPickerDialogState extends State<_RelatedPickerDialog> {
  late String _category;
  String? _selectedItem;

  // 🔎 search
  final _searchCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _category = widget.initialCategory ?? widget.options.keys.first;
    _selectedItem = widget.initialItem;
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  List<String> get _items => widget.options[_category] ?? const <String>[];

  List<String> get _filteredItems {
    final q = _searchCtrl.text.trim().toLowerCase();
    if (q.isEmpty) return _items;
    return _items.where((e) => e.toLowerCase().contains(q)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 60, vertical: 80),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias, // round + clip children
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppCustomTheme.bluePrimary, width: 1.25),
            borderRadius: BorderRadius.circular(16),
          ),
          child: SizedBox(
            width: 680,
            height: 460,
            child: Row(
              children: [
                // LEFT: categories
                Container(
                  width: 220,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    border: Border(
                      right: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  child: ListView(
                    children: widget.options.keys.map((cat) {
                      final selected = cat == _category;
                      return ListTile(
                        selected: selected,
                        selectedTileColor: AppCustomTheme.lightBlueBg,
                        title: Text(
                          cat,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: selected
                                ? AppCustomTheme.bluePrimary
                                : Colors.black87,
                          ),
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                          color: selected
                              ? AppCustomTheme.bluePrimary
                              : Colors.black45,
                        ),
                        onTap: () => setState(() {
                          _category = cat;
                          _selectedItem = null;
                          _searchCtrl.clear(); // reset search on category change
                        }),
                      );
                    }).toList(),
                  ),
                ),

                // RIGHT: header + search + items
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // header
                      Container(
                        height: 52,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: AppCustomTheme.lightBlueBg.withOpacity(.4),
                          border: Border(
                            bottom: BorderSide(
                              color: AppCustomTheme.bluePrimary,
                              width: 1,
                            ),
                          ),
                        ),
                        child: Text(
                          _category,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                      ),

                      // 🔎 search field
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        child: TextField(
                          controller: _searchCtrl,
                          onChanged: (_) => setState(() {}),
                          decoration: InputDecoration(
                            hintText: 'Search $_category',
                            isDense: true,
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon: _searchCtrl.text.isEmpty
                                ? null
                                : IconButton(
                                    icon: const Icon(Icons.clear),
                                    onPressed: () {
                                      _searchCtrl.clear();
                                      setState(() {});
                                    },
                                  ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: AppCustomTheme.bluePrimary,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),

                      // items
                      Expanded(
                        child: _filteredItems.isEmpty
                            ? const Center(
                                child: Text(
                                  'No results',
                                  style: TextStyle(color: Colors.black45),
                                ),
                              )
                            : ListView.separated(
                                keyboardDismissBehavior:
                                    ScrollViewKeyboardDismissBehavior.onDrag,
                                itemCount: _filteredItems.length,
                                separatorBuilder: (_, __) =>
                                    const Divider(height: 1),
                                itemBuilder: (_, i) {
                                  final it = _filteredItems[i];
                                  return RadioListTile<String>(
                                    value: it,
                                    groupValue: _selectedItem,
                                    activeColor: AppCustomTheme.bluePrimary,
                                    title: Text(it),
                                    onChanged: (v) =>
                                        setState(() => _selectedItem = v),
                                  );
                                },
                              ),
                      ),

                      const Divider(height: 1),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              style: TextButton.styleFrom(
                                foregroundColor: AppCustomTheme.bluePrimary,
                              ),
                              child: const Text('Cancel'),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: _selectedItem == null
                                  ? null
                                  : () => Navigator.pop(
                                        context,
                                        _RelatedPickResult(
                                          _category,
                                          _selectedItem!,
                                        ),
                                      ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppCustomTheme.bluePrimary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text('Select'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
