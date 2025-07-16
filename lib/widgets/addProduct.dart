import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sahibot_crm_web/config/app_theme.dart';
import 'package:sahibot_crm_web/widgets/CompanyDropdown.dart';
import 'package:sahibot_crm_web/widgets/customerDropdown.dart';

class AddProduct extends StatefulWidget {
  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();

  String selectedCountry = 'India';
  String selectedCompanyName = 'Select Company Name';
  String selectedLeadSource = 'Select Lead Source';
  String get countryCode => selectedCountry == 'India' ? '+91' : '+971';

  DateTime? dob;
  DateTime? anniversary;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Add Products",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            Divider(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // const Align(
                          //   alignment: Alignment.centerLeft,
                          //   child: Text(
                          //     "Add Follow Up",
                          //     style: TextStyle(fontWeight: FontWeight.bold),
                          //   ),
                          // ),
                          // const SizedBox(height: 12),
                          // Row(children: [Expanded(child: Customerdropdown())]),
                          //const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(child: _buildTextField('Product Name')),
                            ],
                          ),
                          const SizedBox(height: 12),

                          Row(
                            children: [
                              Expanded(child: _buildTextField('Product Code')),
                            ],
                          ),
                          const SizedBox(height: 12),

                          Row(
                            children: [
                              Expanded(
                                child: _buildTextField('Product Category'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),

                          Row(
                            children: [
                              Expanded(child: _buildTextField('Unit Price')),
                            ],
                          ),
                          const SizedBox(height: 12),

                          Row(
                            children: [
                              Expanded(child: _buildTextField('Description')),
                            ],
                          ),
                          const SizedBox(height: 12),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Text("Follow Up Type"),
                          //     SizedBox(width: 12),
                          //     Row(
                          //       children: [
                          //         ChoiceChip(
                          //           label: Text('Call'),
                          //           selected: false,
                          //           onSelected: (_) {},
                          //         ),
                          //         const SizedBox(width: 8),
                          //         ChoiceChip(
                          //           label: Text('WhatsApp'),
                          //           selected: false,
                          //           onSelected: (_) {},
                          //         ),
                          //         const SizedBox(width: 8),
                          //         ChoiceChip(
                          //           label: Text('Email'),
                          //           selected: false,
                          //           onSelected: (_) {},
                          //         ),
                          //       ],
                          //     ),
                          //   ],
                          // ),
                          // const SizedBox(height: 12),
                          // Row(
                          //   children: [
                          //     Expanded(
                          //       child: _buildDateField(
                          //         "Follow Up Date",
                          //         anniversary,
                          //         (val) => setState(() => anniversary = val),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // const SizedBox(height: 12),
                          // Row(
                          //   children: [
                          //     Expanded(
                          //       child: _buildTextField(
                          //         'Add Follow Up Reminder',
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // const SizedBox(height: 12),
                        ],
                      ),
                    ),
                    // Your form fields go here
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // TODO: save the contact
                        Navigator.pop(context);
                      }
                    },
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
                ),
                SizedBox(width: 10),

                SizedBox(
                  // width: 250,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // TODO: save the contact
                        Navigator.pop(context);
                      }
                    },
                    // icon: const Icon(Icons.add, color: Colors.white),
                    label: const Text(
                      'Add Product',
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
                ),
              ],
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     // Save contact
            //   },
            //   child: Text("Add Contact"),
            // ),
          ],
        ),
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

  Widget _buildDateField(
    String label,
    DateTime? value,
    void Function(DateTime?) onChanged,
  ) {
    return TextFormField(
      controller: TextEditingController(
        text: value != null ? DateFormat('dd/MM/yyyy').format(value) : '',
      ),
      // readOnly: true,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: const Icon(Icons.calendar_today),
        border: const OutlineInputBorder(),
      ),
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          firstDate: DateTime(1950),
          lastDate: DateTime(2100),
          initialDate: DateTime.now(),
        );
        if (picked != null) {
          onChanged(picked);
        }
      },
    );
  }
}
