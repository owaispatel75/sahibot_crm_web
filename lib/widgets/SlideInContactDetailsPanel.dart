import 'package:flutter/material.dart';

class SlideInContactDetailsPanel extends StatelessWidget {
  final String contactName;

  const SlideInContactDetailsPanel({required this.contactName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      margin: EdgeInsets.only(top: 60),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Contact: $contactName",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text("More contact details go here..."),
          // You can include other fields here like email, phone, etc.
        ],
      ),
    );
  }
}
