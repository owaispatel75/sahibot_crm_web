import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sahibot_crm_web/config/app_theme.dart';

class AddDealDrawer extends StatefulWidget {
  final void Function(Map<String, dynamic> deal)? onSubmit;
  const AddDealDrawer({super.key, this.onSubmit});

  @override
  State<AddDealDrawer> createState() => _AddDealDrawerState();
}

class _AddDealDrawerState extends State<AddDealDrawer> {
  final _formKey = GlobalKey<FormState>();

  // controllers
  final _nameCtl = TextEditingController();
  final _amountCtl = TextEditingController();
  final _descCtl = TextEditingController();
  final _closingCtl = TextEditingController();
  final _source = TextEditingController();

  DateTime? _closingDate;

  // dropdown state
  String? _pipeline;
  String? _stage;
  String? _party;
  String? _contact;
  // String? _source;

  // sample data (mock; swap with backend later)
  final _pipelines = const ['Software Sale Pipeline', 'Support Pipeline'];

  final Map<String, List<String>> _stagesByPipeline = const {
    'Software Sale Pipeline': [
      'Prospecting',
      'Product Demo',
      'Proposal Sent',
      'Negotiation',
      'Won',
      'Lost',
    ],
    'Support Pipeline': ['New', 'In Progress', 'Waiting on Client', 'Resolved'],
  };

  final _parties = const ['Globex', 'Initech', 'Umbrella', 'Wayne Enterprises'];

  final Map<String, List<String>> _contactsByParty = const {
    'Globex': ['Hank Scorpio', 'Mindy Simmons'],
    'Initech': ['Peter Gibbons', 'Samir Nagheenanajar'],
    'Umbrella': ['Alice Abernathy', 'Dr. Isaacs'],
    'Wayne Enterprises': ['Lucius Fox', 'Alfred Pennyworth'],
  };

  // final _sources = const [
  //   'RCO',
  //   'Website',
  //   'Referral',
  //   'Google Ads',
  //   'YouTube',
  // ];

  @override
  void dispose() {
    _nameCtl.dispose();
    _amountCtl.dispose();
    _source.dispose();
    _descCtl.dispose();
    _closingCtl.dispose();
    super.dispose();
  }

  Future<void> _pickClosingDate() async {
    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now().subtract(const Duration(days: 0)),
      lastDate: DateTime(2100),
      initialDate: _closingDate ?? DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _closingDate = picked;
        _closingCtl.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  InputDecoration _dec(String label) => InputDecoration(
    labelText: label,
    border: const OutlineInputBorder(),
    isDense: true,
  );

  Widget _sectionTitle(String t) => Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        t,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final stages =
        _pipeline == null
            ? const <String>[]
            : (_stagesByPipeline[_pipeline!] ?? []);
    final contacts =
        _party == null ? const <String>[] : (_contactsByParty[_party!] ?? []);

    return Material(
      color: Colors.white,
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // header
            Row(
              children: [
                const Text(
                  'Add Deal',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const Divider(),

            // form
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _sectionTitle('Deal Information'),

                      // Deal Name | Closing Date
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _nameCtl,
                              decoration: _dec('Deal Name'),
                              validator:
                                  (v) =>
                                      (v == null || v.trim().isEmpty)
                                          ? 'Required'
                                          : null,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextFormField(
                              controller: _closingCtl,
                              readOnly: true,
                              decoration: _dec('Closing Date').copyWith(
                                suffixIcon: const Icon(Icons.calendar_today),
                              ),
                              onTap: _pickClosingDate,
                              validator:
                                  (_) =>
                                      _closingDate == null ? 'Required' : null,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // Pipeline | Stage
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: _pipeline,
                              items:
                                  _pipelines
                                      .map(
                                        (e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e),
                                        ),
                                      )
                                      .toList(),
                              onChanged: (v) {
                                setState(() {
                                  _pipeline = v;
                                  // reset stage if pipeline changes
                                  _stage = null;
                                });
                              },
                              decoration: _dec('Pipeline'),
                              validator:
                                  (v) =>
                                      (v == null || v.isEmpty)
                                          ? 'Required'
                                          : null,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: _stage,
                              items:
                                  stages
                                      .map(
                                        (e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e),
                                        ),
                                      )
                                      .toList(),
                              onChanged: (v) => setState(() => _stage = v),
                              decoration: _dec('Stage'),
                              validator:
                                  (v) =>
                                      (v == null || v.isEmpty)
                                          ? 'Required'
                                          : null,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // Party | Contact
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: _party,
                              items:
                                  _parties
                                      .map(
                                        (e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e),
                                        ),
                                      )
                                      .toList(),
                              onChanged: (v) {
                                setState(() {
                                  _party = v;
                                  _contact = null;
                                });
                              },
                              decoration: _dec('Party'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: _contact,
                              items:
                                  contacts
                                      .map(
                                        (e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e),
                                        ),
                                      )
                                      .toList(),
                              onChanged: (v) => setState(() => _contact = v),
                              decoration: _dec('Contact'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // Amount | Source
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _amountCtl,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                    signed: false,
                                    decimal: true,
                                  ),
                              decoration: _dec('Amount'),
                              validator: (v) {
                                if (v == null || v.trim().isEmpty)
                                  return null; // optional
                                final num? n = num.tryParse(v);
                                return n == null ? 'Enter a number' : null;
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                           Expanded(
                            child: TextFormField(
                              controller: _source,
                              decoration: _dec('Source'),
                              validator:
                                  (v) =>
                                      (v == null || v.trim().isEmpty)
                                          ? 'Required'
                                          : null,
                            ),
                          ),
                          // Expanded(
                          //   child: DropdownButtonFormField<String>(
                          //     value: _source,
                          //     items:
                          //         _sources
                          //             .map(
                          //               (e) => DropdownMenuItem(
                          //                 value: e,
                          //                 child: Text(e),
                          //               ),
                          //             )
                          //             .toList(),
                          //     onChanged: (v) => setState(() => _source = v),
                          //     decoration: _dec('Source'),
                          //   ),
                          // ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // Description (full width)
                      TextFormField(
                        controller: _descCtl,
                        maxLines: 4,
                        decoration: _dec('Description'),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // footer actions
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  label: const Text(
                    'Cancel',
                    style: TextStyle(color: AppCustomTheme.bluePrimary),
                  ),
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(
                      color: AppCustomTheme.bluePrimary,
                      width: 2,
                    ),
                    backgroundColor: Colors.transparent,
                    foregroundColor: AppCustomTheme.bluePrimary,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 24,
                    ),
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                    elevation: 0,
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final map = {
                        'name': _nameCtl.text.trim(),
                        'closingDate': _closingDate?.toIso8601String(),
                        'pipeline': _pipeline,
                        'stage': _stage,
                        'party': _party,
                        'contact': _contact,
                        'amount': _amountCtl.text.trim(),
                        'source': _source,
                        'description': _descCtl.text.trim(),
                      };
                      widget.onSubmit?.call(map);
                      Navigator.pop(context);
                    }
                  },
                  label: const Text(
                    'Add Deal',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppCustomTheme.bluePrimary,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 24,
                    ),
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
