import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sahibot_crm_web/config/app_theme.dart';

class LeadsSectionSidebar extends StatelessWidget {
  const LeadsSectionSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentPath = GoRouterState.of(context).uri.toString();

    return Container(
      width: 180,
      color: AppCustomTheme.lightBlueBg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 64),
          _menuItem(
            context,
            label: 'Dashboard',
            icon: Icons.dashboard,
            // route: '/pipelines/dashboard',
            route: '/dashboard',
            // isSelected: currentPath == '/dashboard',
            isSelected: currentPath == '/dashboard' || currentPath == '/automateLeads',
            // isSelected: currentPath == '/pipelines/dashboard',
          ),
          _menuItem(
            context,
            label: 'Pipelines',
            icon: Icons.filter_alt,
            route: '/pipelines',
            isSelected: currentPath == '/pipelines',
          ),
          _menuItem(
            context,
            label: 'Contacts',
            icon: Icons.contacts,
            route: '/contacts',
            // Highlight if path is '/contacts' or starts with '/contacts/'
            isSelected:
                currentPath == '/contacts' ||
                currentPath.startsWith('/contacts/'),
            // isSelected: currentPath == '/contacts',
          ),
          _menuItem(
            context,
            label: 'Parties',
            icon: Icons.apartment,
            route: '/parties',
            isSelected:
                currentPath == '/parties' ||
                currentPath.startsWith('/parties/'),
            // isSelected: currentPath == '/parties',
          ),
          _menuItem(
            context,
            label: 'Follow-up',
            icon: Icons.phone_callback,
            route: '/followup',
            isSelected: currentPath == '/followup',
          ),
          _menuItem(
            context,
            label: 'Products',
            icon: Icons.shopping_cart,
            route: '/products',
            isSelected: currentPath == '/products' || currentPath.startsWith('/products/'),
          ),
          _menuItem(
            context,
            label: 'Activities',
            icon: Icons.directions_run,
            route: '/activities',
            isSelected: currentPath == '/activities',
          ),
        ],
      ),
    );
  }

  Widget _menuItem(
    BuildContext context, {
    required String label,
    required IconData icon,
    required String route,
    required bool isSelected,
  }) {
    return InkWell(
      onTap: () => context.go(route),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        color: isSelected ? AppCustomTheme.lightBlueBg : Colors.transparent,
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? AppCustomTheme.bluePrimary : Colors.black54,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  color:
                      isSelected ? AppCustomTheme.bluePrimary : Colors.black87,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
