import 'package:flutter/material.dart';
import 'package:sahibot_crm_web/All%20Sidebars/sidebar.dart';
import 'package:sahibot_crm_web/widgets/topbar.dart';

class Sampleerrorpage extends StatelessWidget {
  final String title;
  const Sampleerrorpage({super.key, required this.title});

  static const _bgPage = Color(0xFFF8FAFD);
  static const _textMain = Color(0xFF0F172A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgPage,
      body: Stack(
        children: [
          Row(
            children: [
              const Sidebar(),
              // const TeamSidebar(),
              // const BillingSidebar(),
              // LeadsSectionSidebar(),
              Expanded(child: Center(child: Text("There is no $title page"))),
            ],
          ),
          const Positioned(top: 0, left: 0, right: 0, child: TopBar()),
        ],
      ),
    );
    // return Scaffold(body: Center(child: Text("There is no $title page")));
  }
}
