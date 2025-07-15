import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sahibot_crm_web/config/app_theme.dart';

class AddContactDialog extends StatefulWidget {
  const AddContactDialog({super.key});

  @override
  State<AddContactDialog> createState() => _AddContactDialogState();
}

class _AddContactDialogState extends State<AddContactDialog> {
  final _formKey = GlobalKey<FormState>();

  String selectedCountry = 'India';
  String get countryCode => selectedCountry == 'India' ? '+91' : '+971';

  DateTime? dob;
  DateTime? anniversary;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.all(24),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Add Contact",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: _buildTextField('Full Name')),
                        const SizedBox(width: 12),
                        Expanded(child: _buildTextField('Tax Number')),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(child: _buildTextField('Company Name')),
                        const SizedBox(width: 12),
                        Expanded(child: _buildTextField('Email')),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(

                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Country"),
                              const SizedBox(height: 4),
                              DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                                value: selectedCountry,
                                items: const [
                                  DropdownMenuItem(
                                    value: 'India',
                                    child: Text('🇮🇳 India'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'UAE',
                                    child: Text('🇦🇪 UAE'),
                                  ),
                                ],
                                onChanged:
                                    (val) => setState(
                                      () => selectedCountry = val ?? 'India',
                                    ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("WhatsApp Number"),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 9,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border(
                                        top: BorderSide(color: Colors.black),
                                        bottom: BorderSide(color: Colors.black),
                                        left: BorderSide(color: Colors.black),
                                        right: BorderSide(color: Colors.black),
                                      ),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(countryCode),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: _buildTextField(
                                      'Number',
                                      dense: true,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: _buildDateField(
                            "Date of Birth",
                            dob,
                            (val) => setState(() => dob = val),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildDateField(
                            "Date of Anniversary",
                            anniversary,
                            (val) => setState(() => anniversary = val),
                          ),
                        ),
                        // Expanded(child: _buildDateField('Date of Birth')),
                        // const SizedBox(width: 12),
                        // Expanded(child: _buildDateField('Date of Anniversary')),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Address details",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(child: _buildTextField('State')),
                        const SizedBox(width: 12),
                        Expanded(child: _buildTextField('City')),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(child: _buildTextField('Pincode')),
                        const SizedBox(width: 12),
                        Expanded(child: _buildTextField('Address')),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              SizedBox(
                width: 250,
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // TODO: save the contact
                      Navigator.pop(context);
                    }
                  },
                  icon: const Icon(Icons.add, color: Colors.white),
                  label: const Text(
                    'Add Contacts',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppCustomTheme.bluePrimary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
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
