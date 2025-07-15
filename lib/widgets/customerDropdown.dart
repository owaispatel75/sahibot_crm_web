import 'package:flutter/material.dart';
import 'package:sahibot_crm_web/config/app_theme.dart';

class Customerdropdown extends StatefulWidget {
  @override
  _CustomerdropdownState createState() => _CustomerdropdownState();
}

class _CustomerdropdownState extends State<Customerdropdown> {
  final List<String> companies = [
    'Bilal',
    'Owais',
    'Junaid',
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