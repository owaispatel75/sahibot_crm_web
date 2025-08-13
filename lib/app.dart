import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sahibot_crm_web/screens/FollowUpScreen.dart';
import 'package:sahibot_crm_web/screens/activity_screen.dart';
import 'package:sahibot_crm_web/screens/contact_details.dart';
import 'package:sahibot_crm_web/screens/contacts_screen.dart';
import 'package:sahibot_crm_web/screens/myapps.dart';
import 'package:sahibot_crm_web/screens/parties_details.dart';
import 'package:sahibot_crm_web/screens/parties_screen.dart';
import 'package:sahibot_crm_web/screens/product_details.dart';
import 'package:sahibot_crm_web/screens/products_screen.dart';
import 'package:sahibot_crm_web/screens/teams_AllMember_screen.dart';
import 'package:sahibot_crm_web/screens/teams_screen.dart';
import 'package:sahibot_crm_web/screens/kanban/kanban_models.dart';
import 'package:sahibot_crm_web/screens/kanban/pipeline_details_screen.dart';
import 'package:sahibot_crm_web/screens/kanban/piplines_screen.dart';
import 'package:sahibot_crm_web/screens/teams_userroles.dart';
import 'package:sahibot_crm_web/screens/billing_screen.dart';

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder:
          (context, state) => const NoTransitionPage(child: MyAppsScreen()),
    ),
    GoRoute(
      path: '/contacts',
      pageBuilder:
          (context, state) => const NoTransitionPage(child: ContactScreen()),
    ),
    GoRoute(
      path: '/contacts/:contactName',
      pageBuilder: (context, state) {
        final contactName = state.pathParameters['contactName']!;
        return NoTransitionPage(
          child: ContactDetailsPage(contactName: contactName),
        );
      },
    ),
    GoRoute(
      path: '/parties',
      pageBuilder:
          (context, state) => const NoTransitionPage(child: PartiesScreen()),
    ),
    GoRoute(
      path: '/parties/:partiesName',
      pageBuilder: (context, state) {
        final partiesName = state.pathParameters['partiesName']!;
        return NoTransitionPage(
          child: PartiesDetailsPage(partiesName: partiesName),
        );
      },
    ),
    GoRoute(
      path: '/followup',
      pageBuilder:
          (context, state) => const NoTransitionPage(child: FollowUpScreen()),
    ),
    GoRoute(
      path: '/customize',
      pageBuilder:
          (context, state) => NoTransitionPage(child: CustomizeScreen()),
    ),
    GoRoute(
      path: '/billing',
      pageBuilder: (context, state) => NoTransitionPage(child: billingScreen()),
    ),
    GoRoute(
      path: '/activities',
      pageBuilder:
          (context, state) => const NoTransitionPage(child: ActivitiesScreen()),
    ),
    GoRoute(
      path: '/pipelines',
      pageBuilder: (context, state) => const NoTransitionPage(child: pipelinesScreen()),
      routes: [
        GoRoute(
          path: 'details',
          name: 'pipeline-details',
          pageBuilder: (context, state) {
            final args = state.extra! as PipelineDetailsArgs;
            return NoTransitionPage(
              child: PipelineDetailsScreen(
                pipelineName: args.pipelineName,
                currentStageId: args.currentStageId,
                stages: args.stages,
                deal: args.deal,
              ),
            );
          },
        ),
      ],
    ),
    GoRoute(
      path: '/products',
      pageBuilder:
          (context, state) => const NoTransitionPage(child: ProductsScreen()),
    ),
    GoRoute(
      path: '/products/:productName',
      pageBuilder: (context, state) {
        final productName = state.pathParameters['productName']!;
        return NoTransitionPage(
          child: ProductDetailsPage(productName: productName),
        );
      },
    ),
    GoRoute(
      path: '/team',
      pageBuilder:
          (context, state) => const NoTransitionPage(child: TeamsScreen()),
    ),
    GoRoute(
      path: '/allmembers',
      pageBuilder:
          (context, state) => const NoTransitionPage(child: TeamsAllMemberScreen()),
    ),
    GoRoute(
      path: '/userroles',
      pageBuilder:
          (context, state) => const NoTransitionPage(child: TeamsUserRolesScreen()),
    ),
  ],
);

// final _router = GoRouter(
//   initialLocation: '/',
//   routes: [
//     GoRoute(path: '/', builder: (context, state) => const MyAppsScreen()),
//     GoRoute(
//       path: '/contacts',
//       builder: (context, state) => const ContactScreen(),
//     ),
//     GoRoute(
//       path: '/contacts/:contactName',
//       builder: (context, state) {
//         final contactName = state.pathParameters['contactName']!;
//         return ContactDetailsPage(contactName: contactName);
//       },
//     ),
//     GoRoute(
//       path: '/parties',
//       builder: (context, state) => const PartiesScreen(),
//     ),
//     GoRoute(
//       path: '/parties/:partiesName',
//       builder: (context, state) {
//         final partiesName = state.pathParameters['partiesName']!;
//         return PartiesDetailsPage(partiesName: partiesName);
//       },
//     ),
//     GoRoute(
//       path: '/followup',
//       builder: (context, state) => const FollowUpScreen(),
//     ),
//   ],
// );

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
