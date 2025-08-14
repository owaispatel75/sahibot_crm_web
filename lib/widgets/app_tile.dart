// import 'package:flutter/material.dart';

// class AppTile extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final IconData icon;
//   final Color color;

//   const AppTile({
//     super.key,
//     required this.title,
//     required this.subtitle,
//     required this.icon,
//     this.color = Colors.teal,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 230,
//       // padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: const [
//           BoxShadow(blurRadius: 8, color: Colors.black12, offset: Offset(0, 2)),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Icon(icon, size: 32, color: color),
//                 const SizedBox(height: 12),
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(subtitle, style: const TextStyle(fontSize: 13)),
//                 const SizedBox(height: 12),
//               ],
//             ),
//           ),
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//               onPressed: () {
//                 // Add routing here later
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFF00C853),
//                 foregroundColor: Colors.white,
//               ),
//               child: Text("Go To $title"),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:sahibot_crm_web/config/app_theme.dart';

class AppTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onPressed;

  const AppTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon in green box
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppCustomTheme.bluePrimary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: Colors.white, size: 28),
                ),
                const SizedBox(width: 12),
                // Title and subtitle
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                if(title == "AutomateWA" || title == "Automate Links" ||
                    title == "Integrations" || title == "Automate Quotation")
                Icon(Icons.lock, color: Colors.grey, size: 28),
              ],
            ),
          ),
          // Bottom button
          GestureDetector(
            onTap: onPressed,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: const BoxDecoration(
                color: AppCustomTheme.bluePrimary,
                // color: Color(0xFF00C853),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                'Go To $title',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
