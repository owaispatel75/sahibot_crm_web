import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sahibot_crm_web/screens/contact_details.dart';
import 'package:sahibot_crm_web/screens/contacts_screen.dart';
import 'package:sahibot_crm_web/screens/myapps.dart';
import 'package:sahibot_crm_web/screens/parties_details.dart';
import 'package:sahibot_crm_web/screens/parties_screen.dart';

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const MyAppsScreen()),
    GoRoute(
      path: '/contacts',
      builder: (context, state) => const ContactScreen(),
    ),
    GoRoute(
      path: '/contacts/:contactName',
      builder: (context, state) {
        final contactName = state.pathParameters['contactName']!;
        return ContactDetailsPage(contactName: contactName);
      },
    ),
    GoRoute(
      path: '/parties',
      builder: (context, state) => const PartiesScreen(),
    ),
    GoRoute(
      path: '/parties/:partiesName',
      builder: (context, state) {
        final partiesName = state.pathParameters['partiesName']!;
        return PartiesDetailsPage(partiesName: partiesName);
      },
    ),
  ],
);

class SahibotCRM extends StatelessWidget {
  const SahibotCRM({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Sahibot CRM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto'),
      routerConfig: _router,
    );
  }
}
