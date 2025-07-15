// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:sahibot_crm_web/config/app_theme.dart';
// import 'package:sahibot_crm_web/widgets/CompanyDropdown.dart';

// class addPartiesDrawer extends StatefulWidget {
//   @override
//   State<addPartiesDrawer> createState() => _addPartiesDrawerState();
// }

// class _addPartiesDrawerState extends State<addPartiesDrawer> {
//   final _formKey = GlobalKey<FormState>();

//   String selectedCountry = 'India';
//   String selectedCompanyName = 'Select Company Name';
//   String selectedLeadSource = 'Select Lead Source';
//   String get countryCode => selectedCountry == 'India' ? '+91' : '+971';

//   DateTime? dob;
//   DateTime? anniversary;
//   String _partyType = 'Company';
//   String _partyCategory = 'Customer';

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.white,
//       elevation: 8,
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             // Add this inside your Column children in Form widget, above Contact Information text
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                       "Add Party Details",
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Spacer(),
//                     IconButton(
//                       icon: Icon(Icons.close),
//                       onPressed: () => Navigator.pop(context),
//                     ),
//                   ],
//                 ),
//                 Divider(),
//                 const Text(
//                   'Client Type',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 Row(
//                   children: [
//                     Radio<String>(
//                       activeColor: AppCustomTheme.bluePrimary,
//                       value: 'Company',
//                       groupValue: _partyType,
//                       onChanged: (value) => setState(() => _partyType = value!),
//                     ),
//                     const Text('Company'),
//                     Radio<String>(
//                       activeColor: AppCustomTheme.bluePrimary,
//                       value: 'Individual',
//                       groupValue: _partyType,
//                       onChanged: (value) => setState(() => _partyType = value!),
//                     ),
//                     const Text('Individual'),
//                   ],
//                 ),
//                 const SizedBox(height: 10),
//                 const Text(
//                   'Category Type',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 Row(
//                   children: [
//                     Radio<String>(
//                       activeColor: AppCustomTheme.bluePrimary,
//                       value: 'Customer',
//                       groupValue: _partyCategory,
//                       onChanged:
//                           (value) => setState(() => _partyCategory = value!),
//                     ),
//                     const Text('Customer'),
//                     Radio<String>(
//                       activeColor: AppCustomTheme.bluePrimary,
//                       value: 'Vendor',
//                       groupValue: _partyCategory,
//                       onChanged:
//                           (value) => setState(() => _partyCategory = value!),
//                     ),
//                     const Text('Vendor'),
//                     Radio<String>(
//                       activeColor: AppCustomTheme.bluePrimary,
//                       value: 'Others',
//                       groupValue: _partyCategory,
//                       onChanged:
//                           (value) => setState(() => _partyCategory = value!),
//                     ),
//                     const Text('Others'),
//                   ],
//                 ),
//                 const SizedBox(height: 10),
//               ],
//             ),
//             // Row(
//             //   children: [
//             //     Text(
//             //       "Add Party Details",
//             //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             //     ),
//             //     Spacer(),
//             //     IconButton(
//             //       icon: Icon(Icons.close),
//             //       onPressed: () => Navigator.pop(context),
//             //     ),
//             //   ],
//             // ),
//             Divider(),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Form(
//                       key: _formKey,
//                       child: Column(
//                         children: [
//                           const Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               "Contact Information",
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           const SizedBox(height: 12),
//                           Row(
//                             children: [
//                               Expanded(child: _buildTextField('First Name')),
//                               const SizedBox(width: 12),
//                               Expanded(child: _buildTextField('Last Name')),
//                             ],
//                           ),
//                           const SizedBox(height: 12),
//                           Row(
//                             children: [
//                               Expanded(child: _buildTextField('Title')),
//                               const SizedBox(width: 12),
//                               Expanded(child: CompanyDropdown()),
//                             ],
//                           ),
//                           const SizedBox(height: 12),
//                           Row(
//                             children: [
//                               Expanded(child: _buildTextField('Email')),
//                               const SizedBox(width: 12),
//                               Expanded(
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       padding: const EdgeInsets.symmetric(
//                                         horizontal: 12,
//                                         vertical: 9,
//                                       ),
//                                       decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         border: Border(
//                                           top: BorderSide(color: Colors.black),
//                                           bottom: BorderSide(
//                                             color: Colors.black,
//                                           ),
//                                           left: BorderSide(color: Colors.black),
//                                           right: BorderSide(
//                                             color: Colors.black,
//                                           ),
//                                         ),
//                                         borderRadius: BorderRadius.circular(6),
//                                       ),
//                                       child: Text(countryCode),
//                                     ),
//                                     const SizedBox(width: 8),
//                                     Expanded(
//                                       child: _buildTextField(
//                                         'Whatsapp Number',
//                                         dense: true,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),

//                           const SizedBox(height: 12),
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: _buildDateField(
//                                   "Date of Birth",
//                                   dob,
//                                   (val) => setState(() => dob = val),
//                                 ),
//                               ),
//                               const SizedBox(width: 12),
//                               Expanded(
//                                 child: _buildDateField(
//                                   "Date of Anniversary",
//                                   anniversary,
//                                   (val) => setState(() => anniversary = val),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 20),
//                           Row(
//                             children: [
//                               Expanded(child: _buildTextField('Lead Source')),
//                               const SizedBox(width: 12),
//                               Expanded(child: _buildTextField('Description')),
//                             ],
//                           ),
//                           const SizedBox(height: 20),
//                           const Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               "Address Information",
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           const SizedBox(height: 12),
//                           Row(
//                             children: [
//                               Expanded(child: _buildTextField('Address')),
//                               const SizedBox(width: 12),
//                               Expanded(child: _buildTextField('City')),
//                             ],
//                           ),
//                           const SizedBox(height: 12),
//                           Row(
//                             children: [
//                               Expanded(child: _buildTextField('State')),
//                               const SizedBox(width: 12),
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     DropdownButtonFormField<String>(
//                                       hint: Text("Country"),
//                                       decoration: InputDecoration(
//                                         border: OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                             color: Colors.black,
//                                           ),
//                                         ),
//                                       ),
//                                       value: selectedCountry,
//                                       items: const [
//                                         DropdownMenuItem(
//                                           value: 'India',
//                                           child: Text('🇮🇳 India'),
//                                         ),
//                                         DropdownMenuItem(
//                                           value: 'UAE',
//                                           child: Text('🇦🇪 UAE'),
//                                         ),
//                                       ],
//                                       onChanged:
//                                           (val) => setState(
//                                             () =>
//                                                 selectedCountry =
//                                                     val ?? 'India',
//                                           ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
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
//                       'Add Party',
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
import 'package:sahibot_crm_web/widgets/CompanyDropdown.dart';

class addPartiesDrawer extends StatefulWidget {
  @override
  State<addPartiesDrawer> createState() => _addPartiesDrawerState();
}

class _addPartiesDrawerState extends State<addPartiesDrawer> {
  final _formKey = GlobalKey<FormState>();

  String _partyType = 'Company'; // controls which form to show
  String _partyCategory = 'Customer';

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
            // Header
            Row(
              children: [
                Text(
                  "Add Party Details",
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

            // Radio Buttons
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Client Type',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Radio<String>(
                      activeColor: AppCustomTheme.bluePrimary,
                      value: 'Company',
                      groupValue: _partyType,
                      onChanged: (value) => setState(() => _partyType = value!),
                    ),
                    const Text('Company'),
                    Radio<String>(
                      activeColor: AppCustomTheme.bluePrimary,
                      value: 'Individual',
                      groupValue: _partyType,
                      onChanged: (value) => setState(() => _partyType = value!),
                    ),
                    const Text('Individual'),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'Category Type',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Radio<String>(
                      activeColor: AppCustomTheme.bluePrimary,
                      value: 'Customer',
                      groupValue: _partyCategory,
                      onChanged:
                          (value) => setState(() => _partyCategory = value!),
                    ),
                    const Text('Customer'),
                    Radio<String>(
                      activeColor: AppCustomTheme.bluePrimary,
                      value: 'Vendor',
                      groupValue: _partyCategory,
                      onChanged:
                          (value) => setState(() => _partyCategory = value!),
                    ),
                    const Text('Vendor'),
                    Radio<String>(
                      activeColor: AppCustomTheme.bluePrimary,
                      value: 'Others',
                      groupValue: _partyCategory,
                      onChanged:
                          (value) => setState(() => _partyCategory = value!),
                    ),
                    const Text('Others'),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
            Divider(),
            // Expanded form area
            Expanded(
              child: SingleChildScrollView(
                child:
                    _partyType == 'Individual'
                        ? _buildIndividualForm()
                        : _buildCompanyForm(),
              ),
            ),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
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
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pop(context);
                      }
                    },
                    label: const Text(
                      'Add Party',
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
          ],
        ),
      ),
    );
  }

  Widget _buildIndividualForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
              Expanded(child: _buildTextField('Tax No')),
              // Expanded(child: CompanyDropdown()),
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
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(countryCode),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildTextField('Whatsapp Number', dense: true),
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
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: _buildTextField('Lead Source')),
              const SizedBox(width: 12),
              Expanded(child: _buildTextField('Description')),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: _buildTextField('Party Code')),
              //const SizedBox(width: 12),
              //Expanded(child: _buildTextField('Description')),
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
                    DropdownButtonFormField<String>(
                      hint: Text("Country"),
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
                        DropdownMenuItem(value: 'UAE', child: Text('🇦🇪 UAE')),
                      ],
                      onChanged:
                          (val) =>
                              setState(() => selectedCountry = val ?? 'India'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCompanyForm() {
    // Example simple company form with rows for multiple company contacts (static example)
    // return Form(
    //   key: _formKey,
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       const Align(
    //         alignment: Alignment.centerLeft,
    //         child: Text(
    //           "Company Information",
    //           style: TextStyle(fontWeight: FontWeight.bold),
    //         ),
    //       ),
    //       const SizedBox(height: 12),

    //       // You can replace the below with dynamic rows to add multiple contacts for company
    //       _buildTextField('Company Name'),
    //       const SizedBox(height: 12),
    //       _buildTextField('Company Address'),
    //       const SizedBox(height: 12),
    //       _buildTextField('Company Email'),
    //       const SizedBox(height: 12),
    //       _buildTextField('Company Phone'),
    //       const SizedBox(height: 12),

    //       ElevatedButton(
    //         onPressed: () {
    //           // You can add logic here to add more rows dynamically if needed later
    //           ScaffoldMessenger.of(context).showSnackBar(
    //             const SnackBar(content: Text("Add more company contacts")),
    //           );
    //         },
    //         child: const Text("Add More Contacts"),
    //       ),
    //     ],
    //   ),
    // );
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
              Expanded(child: _buildTextField('Company Name')),
              const SizedBox(width: 12),
              Expanded(child: _buildTextField('Tax No')),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _buildTextField('Contact Number')),
              const SizedBox(width: 12),
              Expanded(child: _buildTextField('Email')),
              // Expanded(child: CompanyDropdown()),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _buildTextField('Website')),
              const SizedBox(width: 12),
              Expanded(child: _buildTextField('Lead Source')),
              // // Expanded(
              // //   child: Row(
              // //     children: [
              // //       Container(
              // //         padding: const EdgeInsets.symmetric(
              // //           horizontal: 12,
              // //           vertical: 9,
              // //         ),
              // //         decoration: BoxDecoration(
              // //           color: Colors.white,
              // //           border: Border.all(color: Colors.black),
              // //           borderRadius: BorderRadius.circular(6),
              // //         ),
              // //         child: Text(countryCode),
              // //       ),
              // //       const SizedBox(width: 8),
              // //       Expanded(
              // //         child: _buildTextField('Whatsapp Number', dense: true),
              // //       ),
              // //     ],
              // //   ),
              // ),
            ],
          ),
          const SizedBox(height: 12),
          // // Row(
          // //   children: [
          // //     Expanded(
          // //       child: _buildDateField(
          // //         "Date of Birth",
          // //         dob,
          // //         (val) => setState(() => dob = val),
          // //       ),
          // //     ),
          // //     const SizedBox(width: 12),
          // //     Expanded(
          // //       child: _buildDateField(
          // //         "Date of Anniversary",
          // //         anniversary,
          // //         (val) => setState(() => anniversary = val),
          // //       ),
          // //     ),
          // //   ],
          // // ),
          // const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: _buildTextField('Party Code')),
              const SizedBox(width: 12),
              Expanded(child: _buildTextField('Description')),
            ],
          ),
          // const SizedBox(height: 20),
          // Row(
          //   children: [
          //     Expanded(child: _buildTextField('Party Code')),
          //     //const SizedBox(width: 12),
          //     //Expanded(child: _buildTextField('Description')),
          //   ],
          // ),
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
                    DropdownButtonFormField<String>(
                      hint: Text("Country"),
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
                        DropdownMenuItem(value: 'UAE', child: Text('🇦🇪 UAE')),
                      ],
                      onChanged:
                          (val) =>
                              setState(() => selectedCountry = val ?? 'India'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
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
