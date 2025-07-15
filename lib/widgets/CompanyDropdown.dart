// import 'package:flutter/material.dart';

// class CompanyDropdown extends StatefulWidget {
//   final String? selectedCompany;
//   final void Function(String) onCompanySelected;

//   const CompanyDropdown({
//     super.key,
//     this.selectedCompany,
//     required this.onCompanySelected,
//   });

//   @override
//   State<CompanyDropdown> createState() => _CompanyDropdownState();
// }

// class _CompanyDropdownState extends State<CompanyDropdown> {
//   final List<String> allCompanies = [
//     'WVTS',
//     'Your Company',
//     'Mine Company',
//     'Zylker Corp',
//   ];
//   List<String> filteredCompanies = [];
//   bool dropdownOpen = false;
//   String? selectedCompany;
//   final TextEditingController searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     selectedCompany = widget.selectedCompany;
//     filteredCompanies = List.from(allCompanies);
//   }

//   void toggleDropdown() {
//     setState(() {
//       dropdownOpen = !dropdownOpen;
//     });
//   }

//   void selectCompany(String company) {
//     setState(() {
//       selectedCompany = company;
//       widget.onCompanySelected(company);
//       dropdownOpen = false;
//       searchController.clear();
//       filteredCompanies = List.from(allCompanies);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         GestureDetector(
//           onTap: toggleDropdown,
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.green, width: 2),
//               borderRadius: BorderRadius.circular(6),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(selectedCompany ?? 'Select Company Name'),
//                 Icon(
//                   dropdownOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         if (dropdownOpen)
//           Container(
//             margin: const EdgeInsets.only(top: 4),
//             padding: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.green),
//               borderRadius: BorderRadius.circular(6),
//             ),
//             child: Column(
//               children: [
//                 TextField(
//                   controller: searchController,
//                   onChanged: (value) {
//                     setState(() {
//                       filteredCompanies =
//                           allCompanies
//                               .where(
//                                 (company) => company.toLowerCase().contains(
//                                   value.toLowerCase(),
//                                 ),
//                               )
//                               .toList();
//                     });
//                   },
//                   decoration: InputDecoration(
//                     hintText: 'Search',
//                     prefixIcon: Icon(Icons.search),
//                     contentPadding: const EdgeInsets.symmetric(horizontal: 12),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(6),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 ...filteredCompanies.map((company) {
//                   return ListTile(
//                     title: Text(company),
//                     onTap: () => selectCompany(company),
//                   );
//                 }).toList(),
//                 const Divider(),
//                 ListTile(
//                   leading: Icon(Icons.add, color: Colors.blue),
//                   title: Text(
//                     '+ New Company',
//                     style: TextStyle(color: Colors.blue),
//                   ),
//                   onTap: () {
//                     // handle new company creation logic
//                   },
//                 ),
//               ],
//             ),
//           ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:sahibot_crm_web/config/app_theme.dart';

class CompanyDropdown extends StatefulWidget {
  @override
  _CompanyDropdownState createState() => _CompanyDropdownState();
}

class _CompanyDropdownState extends State<CompanyDropdown> {
  final List<String> companies = [
    'WVTS',
    'Your Company',
    'Mine Company',
    'Zylker Corp',
  ];

  List<String> filteredCompanies = [];
  String? selectedCompany;
  bool isDropdownOpen = false;
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredCompanies = List.from(companies);
  }

  void openDropdown() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context)!.insert(_overlayEntry!);
    setState(() => isDropdownOpen = true);
  }

  void closeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    searchController.clear();
    setState(() {
      filteredCompanies = List.from(companies);
      isDropdownOpen = false;
    });
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder:
          (context) => Positioned(
            width: size.width,
            left: offset.dx,
            top: offset.dy + size.height + 5,
            child: CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              offset: Offset(0, size.height + 5),
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  constraints: BoxConstraints(maxHeight: 250),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: 'Search',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            isDense: true,
                          ),
                          onChanged: (value) {
                            setState(() {
                              filteredCompanies =
                                  companies
                                      .where(
                                        (c) => c.toLowerCase().contains(
                                          value.toLowerCase(),
                                        ),
                                      )
                                      .toList();
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          children: [
                            ...filteredCompanies.map(
                              (company) => ListTile(
                                title: Text(company),
                                onTap: () {
                                  setState(() {
                                    selectedCompany = company;
                                  });
                                  closeDropdown();
                                },
                              ),
                            ),
                            const Divider(height: 1),
                            ListTile(
                              leading: Icon(
                                Icons.add,
                                color: AppCustomTheme.bluePrimary,
                              ),
                              title: Text(
                                'New Company',
                                style: TextStyle(
                                  color: AppCustomTheme.bluePrimary,
                                ),
                              ),
                              onTap: () {
                                // TODO: Add your logic for new company
                                closeDropdown();
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: () {
          if (isDropdownOpen) {
            closeDropdown();
          } else {
            openDropdown();
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Text(
                  selectedCompany ?? 'Select Company Name',
                  style: TextStyle(
                    color:
                        selectedCompany == null ? Colors.black : Colors.black,
                  ),
                ),
              ),
              Icon(
                isDropdownOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                color: Colors.black54,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
