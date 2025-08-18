import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sahibot_crm_web/config/app_theme.dart';
import 'package:sahibot_crm_web/widgets/CompanyDropdown.dart';

class AddContactDrawer extends StatefulWidget {
  @override
  State<AddContactDrawer> createState() => _AddContactDrawerState();
}

class _AddContactDrawerState extends State<AddContactDrawer> {
  final _formKey = GlobalKey<FormState>();

  //String selectedCountry = 'India';
  String selectedCountry = 'UAE';
  
  String selectedCompanyName = 'Select Company Name';
  String selectedLeadSource = 'Select Lead Source';
  String get countryCode => selectedCountry == 'India' ? '+91' : '+971';

  DateTime? dob;
  DateTime? anniversary;

  // final List<String> _companies = [
  //   'Zylker Corp',
  //   'Tech Solutions',
  //   'Global Systems',
  //   'Future Enterprises',
  // ];

  // String? _selectedCompany;
  // bool _isDropdownOpen = false;
  // TextEditingController _searchController = TextEditingController();

  // List<String> get _filteredCompanies {
  //   if (_searchController.text.isEmpty) return _companies;
  //   return _companies
  //       .where(
  //         (company) => company.toLowerCase().contains(
  //           _searchController.text.toLowerCase(),
  //         ),
  //       )
  //       .toList();
  // }

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
                  "Add Contact",
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
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Contact Information",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(child: _buildTextField('First Name')),
                              const SizedBox(width: 12),
                              Expanded(child: _buildTextField('Last Name')),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(child: _buildTextField('Title')),
                              const SizedBox(width: 12),
                              Expanded(
                                child: CompanyDropdown(
                                  // selectedCompany: selectedCompanyName,
                                  // onCompanySelected: (val) {
                                  //   setState(() {
                                  //     selectedCompanyName = val;
                                  //   });
                                  // },
                                ),
                              ),
                              // best working
                              // Expanded(
                              //   child: Column(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: [
                              //       // const Text("Country"),
                              //       // const SizedBox(height: 4),
                              //       DropdownButtonFormField<String>(
                              //         hint: Text("Select your Company Name"),
                              //         decoration: InputDecoration(
                              //           border: OutlineInputBorder(
                              //             borderSide: BorderSide(
                              //               color: Colors.black,
                              //             ),
                              //           ),
                              //         ),
                              //         value: selectedCompanyName,
                              //         items: const [
                              //           DropdownMenuItem(
                              //             value: 'Select Company Name',
                              //             child: Text('Select Company Name'),
                              //           ),
                              //           DropdownMenuItem(
                              //             value: 'WVTS',
                              //             child: Text('WVTS'),
                              //           ),
                              //           DropdownMenuItem(
                              //             value: 'Your Company',
                              //             child: Text('Your Company'),
                              //           ),
                              //           DropdownMenuItem(
                              //             value: 'Mine Company',
                              //             child: Text('Mine Company'),
                              //           ),
                              //         ],
                              //         onChanged:
                              //             (val) => setState(
                              //               () =>
                              //                   selectedCompanyName =
                              //                       val ??
                              //                       'Select Company Name',
                              //             ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              //Expanded(child: _buildTextField('Company Name')),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(child: _buildTextField('Email')),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Row(
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
                                          bottom: BorderSide(
                                            color: Colors.black,
                                          ),
                                          left: BorderSide(color: Colors.black),
                                          right: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text(countryCode),
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
                              ),
                              // Expanded(
                              //   child: _buildTextField('WhatsApp Number'),
                              // ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          // Row(
                          //   children: [
                          //     Expanded(
                          //       child: Column(
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: [
                          //           const Text("Country"),
                          //           const SizedBox(height: 4),
                          //           DropdownButtonFormField<String>(
                          //             decoration: InputDecoration(
                          //               border: OutlineInputBorder(
                          //                 borderSide: BorderSide(
                          //                   color: Colors.black,
                          //                 ),
                          //               ),
                          //             ),
                          //             value: selectedCountry,
                          //             items: const [
                          //               DropdownMenuItem(
                          //                 value: 'India',
                          //                 child: Text('🇮🇳 India'),
                          //               ),
                          //               DropdownMenuItem(
                          //                 value: 'UAE',
                          //                 child: Text('🇦🇪 UAE'),
                          //               ),
                          //             ],
                          //             onChanged:
                          //                 (val) => setState(
                          //                   () =>
                          //                       selectedCountry =
                          //                           val ?? 'India',
                          //                 ),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //     const SizedBox(width: 12),
                          //     Expanded(
                          //       child: Column(
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: [
                          //           const Text("WhatsApp Number"),
                          //           const SizedBox(height: 4),
                          //           Row(
                          //             children: [
                          //               Container(
                          //                 padding: const EdgeInsets.symmetric(
                          //                   horizontal: 12,
                          //                   vertical: 9,
                          //                 ),
                          //                 decoration: BoxDecoration(
                          //                   color: Colors.white,
                          //                   border: Border(
                          //                     top: BorderSide(
                          //                       color: Colors.black,
                          //                     ),
                          //                     bottom: BorderSide(
                          //                       color: Colors.black,
                          //                     ),
                          //                     left: BorderSide(
                          //                       color: Colors.black,
                          //                     ),
                          //                     right: BorderSide(
                          //                       color: Colors.black,
                          //                     ),
                          //                   ),
                          //                   borderRadius: BorderRadius.circular(
                          //                     6,
                          //                   ),
                          //                 ),
                          //                 child: Text(countryCode),
                          //               ),
                          //               const SizedBox(width: 8),
                          //               Expanded(
                          //                 child: _buildTextField(
                          //                   'Number',
                          //                   dense: true,
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ],
                          // ),
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
                          Row(
                            children: [
                              Expanded(child: _buildTextField('Lead Source')),
                              // // best working
                              // Expanded(
                              //   child: Column(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: [
                              //       // const Text("Country"),
                              //       // const SizedBox(height: 4),
                              //       DropdownButtonFormField<String>(
                              //         hint: Text("Select Lead Source"),
                              //         decoration: InputDecoration(
                              //           border: OutlineInputBorder(
                              //             borderSide: BorderSide(
                              //               color: Colors.black,
                              //             ),
                              //           ),
                              //         ),
                              //         value: selectedLeadSource,
                              //         items: const [
                              //           DropdownMenuItem(
                              //             value: 'Select Lead Source',
                              //             child: Text('Select Lead Source'),
                              //           ),
                              //           DropdownMenuItem(
                              //             value: 'Zoho',
                              //             child: Text('Zoho'),
                              //           ),
                              //           DropdownMenuItem(
                              //             value: 'YouTube',
                              //             child: Text('YouTube'),
                              //           ),
                              //           DropdownMenuItem(
                              //             value: 'Google',
                              //             child: Text('Google'),
                              //           ),
                              //         ],
                              //         onChanged:
                              //             (val) => setState(
                              //               () =>
                              //                   selectedLeadSource =
                              //                       val ?? 'Select Lead Source',
                              //             ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              const SizedBox(width: 12),
                              Expanded(child: _buildTextField('Description')),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Address Information",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(child: _buildTextField('Address')),
                              const SizedBox(width: 12),
                              Expanded(child: _buildTextField('City')),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(child: _buildTextField('State')),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //const Text("Country"),
                                    //const SizedBox(height: 4),
                                    DropdownButtonFormField<String>(
                                      hint: Text("Country"),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
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
                                            () =>
                                                selectedCountry =
                                                    val ?? 'India',
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              // Expanded(child: _buildTextField('Pincode')),
                            ],
                          ),
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
                      'Add Contact',
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
