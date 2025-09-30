import 'package:flutter/material.dart';
import 'package:sahibot_crm_web/All%20Sidebars/billing_sidebar.dart';
import 'package:sahibot_crm_web/All%20Sidebars/settings_sidebar.dart';
import '../../widgets/topbar.dart';
import '../All Sidebars/sidebar.dart';
import 'dart:math' as math;

class billingScreen extends StatefulWidget {
  const billingScreen({super.key});

  @override
  State<billingScreen> createState() => _billingScreenState();
}

class _billingScreenState extends State<billingScreen>
    with SingleTickerProviderStateMixin {
  //String selectedContactName = '';

  String _selectedPlan = 'starter'; // starter | growth | enterprise

  void _showRMDialog(String title) {
    final w = MediaQuery.of(context).size.width;
    final maxW = math.min(520.0, w - 64); // cap width; keep some margin

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            insetPadding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 24,
            ),
            titlePadding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
            contentPadding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
            title: Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            content: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxW),
              child: const Text(
                'To proceed, please contact your relationship manager',
                style: TextStyle(fontSize: 16, color: Color(0xFF1E1F24)),
              ),
            ),
            actionsPadding: const EdgeInsets.only(right: 16, bottom: 12),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2E7CF6),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Close'),
              ),
            ],
          ),
    );
    // showDialog(
    //   context: context,
    //   builder:
    //       (_) => Dialog(
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(16),
    //         ),
    //         child: Padding(
    //           padding: const EdgeInsets.fromLTRB(24, 20, 24, 16),
    //           child: Column(
    //             mainAxisSize: MainAxisSize.min,
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 title,
    //                 style: const TextStyle(
    //                   fontSize: 20,
    //                   fontWeight: FontWeight.w700,
    //                 ),
    //               ),
    //               const SizedBox(height: 12),
    //               const Text(
    //                 'To proceed, please contact your relationship manager',
    //                 style: TextStyle(fontSize: 16, color: Color(0xFF1E1F24)),
    //               ),
    //               const SizedBox(height: 20),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.end,
    //                 children: [
    //                   ElevatedButton(
    //                     onPressed: () => Navigator.pop(context),
    //                     style: ElevatedButton.styleFrom(
    //                       backgroundColor: const Color(0xFF2E7CF6),
    //                       foregroundColor: Colors.white,
    //                       padding: const EdgeInsets.symmetric(
    //                         horizontal: 20,
    //                         vertical: 12,
    //                       ),
    //                       shape: RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(10),
    //                       ),
    //                     ),
    //                     child: const Text('Close'),
    //                   ),
    //                 ],
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              const Sidebar(),
              const BillingSidebar(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 64),
                  child: _BillingBody(
                    selectedPlan: _selectedPlan,
                    onPlanChanged: (id) => setState(() => _selectedPlan = id),
                    onRecharge: () => _showRMDialog('Recharge'),
                    onSubscribe: () => _showRMDialog('Subscribe'),
                  ),
                ),
              ),
              // Expanded(child: Center(child: Text("Billing Panel"))),
            ],
          ),
          const Positioned(top: 0, left: 0, right: 0, child: TopBar()),
        ],
      ),
    );
  }
}

class _BillingBody extends StatelessWidget {
  final String selectedPlan;
  final ValueChanged<String> onPlanChanged;
  final VoidCallback onRecharge;
  final VoidCallback onSubscribe;
  const _BillingBody({
    required this.selectedPlan,
    required this.onPlanChanged,
    required this.onRecharge,
    required this.onSubscribe,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Billing',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 16),

          // Top cards
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              const _CurrentPlanCard(planName: 'Starter', expiry: '11/08/2025'),
              _WalletCard(balance: 0, onRecharge: onRecharge),
            ],
          ),
          const SizedBox(height: 16),

          // Info banner
          const _InfoBanner(
            title: 'All plans include',
            subtitle:
                "Full access to platform features. Scale based on your team's needs.",
          ),
          const SizedBox(height: 16),

          const Text(
            'Flexible Team Plans',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 4),
          const Text(
            'Choose based on your team size',
            style: TextStyle(color: Colors.black54),
          ),
          const SizedBox(height: 12),

          // Main two columns
          LayoutBuilder(
            builder: (_, cons) {
              final isStack = w < 1200;
              final left = const _FeatureListCard();
              final right = _PlansCard(
                selectedPlan: selectedPlan,
                onPlanChanged: onPlanChanged,
                onSubscribe: onSubscribe,
              );
              if (isStack) {
                return Column(
                  children: [left, const SizedBox(height: 16), right],
                );
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 5, child: left),
                  const SizedBox(width: 16),
                  Expanded(flex: 4, child: right),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _CurrentPlanCard extends StatelessWidget {
  final String planName;
  final String expiry;
  const _CurrentPlanCard({required this.planName, required this.expiry});

  @override
  Widget build(BuildContext context) {
    return _CardShell(
      width: 380,
      height: 90,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current Plan: $planName',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Expiry Date: $expiry',
                  style: const TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFE9F8EE),
              borderRadius: BorderRadius.circular(999),
            ),
            child: const Text(
              'Active',
              style: TextStyle(
                color: Color(0xFF13A552),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WalletCard extends StatelessWidget {
  final int balance;
  final VoidCallback onRecharge;
  const _WalletCard({required this.balance, required this.onRecharge});

  @override
  Widget build(BuildContext context) {
    return _CardShell(
      width: 380,
      height: 90,
      child: Row(
        children: [
          const Text(
            'Wallet Balance',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          Text(
            '$balance',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: onRecharge,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2E7CF6),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Recharge'),
          ),
        ],
      ),
    );
  }
}

class _InfoBanner extends StatelessWidget {
  final String title;
  final String subtitle;
  const _InfoBanner({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF6FB),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const Icon(Icons.info_outline, color: Color(0xFF2E7CF6)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(color: Colors.black54)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureListCard extends StatelessWidget {
  const _FeatureListCard();

  @override
  Widget build(BuildContext context) {
    final items = [
      'Seamless File Sharing 📁',
      'Automated Recurring Tasks 🧾',
      'Smart Task Reminders ⏰',
      'WhatsApp-Powered Updates ✅',
      'Unlimited Task Delegation 🗂️',
      'Comprehensive Team Insights 📊',
      'Boost Productivity – Save 4+ Hours Daily! 🚀',
    ];
    return _CardShell(
      child: Column(
        children: [
          for (final text in items) ...[
            Row(
              children: [
                const Icon(
                  // Icons.check_circle_rounded,
                  Icons.check_circle_outline,
                  color: Color(0xFF1FD28B),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    text,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            if (text != items.last)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Divider(color: Colors.grey.shade200, height: 1),
              ),
          ],
        ],
      ),
    );
  }
}

class _PlansCard extends StatelessWidget {
  final String selectedPlan;
  final ValueChanged<String> onPlanChanged;
  final VoidCallback onSubscribe;
  const _PlansCard({
    required this.selectedPlan,
    required this.onPlanChanged,
    required this.onSubscribe,
  });

  @override
  Widget build(BuildContext context) {
    return _CardShell(
      child: Column(
        children: [
          _PlanTile(
            id: 'starter',
            name: 'Starter',
            desc1: 'Up to 10 team members',
            desc2: '25/- per user per month',
            price: '3000',
            period: 'yearly',
            selected: selectedPlan == 'starter',
            onChanged: onPlanChanged,
          ),
          const SizedBox(height: 12),
          _PlanTile(
            id: 'growth',
            name: 'Growth',
            desc1: 'Up to 40 team members',
            desc2: '12.5/- per user per month',
            price: '6000',
            period: 'yearly',
            badge: 'Popular',
            selected: selectedPlan == 'growth',
            onChanged: onPlanChanged,
          ),
          const SizedBox(height: 12),
          _PlanTile(
            id: 'enterprise',
            name: 'Enterprise',
            desc1: 'Up to 100 team members',
            desc2: '7.5/- per user per month',
            price: '9000',
            period: 'yearly',
            selected: selectedPlan == 'enterprise',
            onChanged: onPlanChanged,
            emphasized: true,
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: onSubscribe,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E7CF6),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Subscribe'),
            ),
          ),
        ],
      ),
    );
  }
}

class _PlanTile extends StatelessWidget {
  final String id;
  final String name;
  final String desc1;
  final String desc2;
  final String price;
  final String period;
  final String? badge;
  final bool selected;
  final bool emphasized;
  final ValueChanged<String> onChanged;

  const _PlanTile({
    required this.id,
    required this.name,
    required this.desc1,
    required this.desc2,
    required this.price,
    required this.period,
    required this.selected,
    required this.onChanged,
    this.badge,
    this.emphasized = false,
  });

  @override
  Widget build(BuildContext context) {
    final border = Border.all(
      color: selected ? const Color(0xFF2E7CF6) : Colors.grey.shade300,
      width: selected ? 2 : 1,
    );

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => onChanged(id),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: border,
          borderRadius: BorderRadius.circular(12),
          boxShadow:
              emphasized
                  ? [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ]
                  : [],
        ),
        child: Row(
          children: [
            Radio<String>(
              value: id,
              groupValue: selected ? id : null,
              onChanged: (_) => onChanged(id),
              activeColor: const Color(0xFF2E7CF6),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        name,
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                      if (badge != null) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE8F0FF),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(
                            badge!,
                            style: const TextStyle(
                              color: Color(0xFF2E7CF6),
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(desc1, style: const TextStyle(color: Colors.black54)),
                  Text(desc2, style: const TextStyle(color: Colors.black54)),
                  Text(
                    "Plus 10% AMC",
                    style: const TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                  ),
                ),
                Text(
                  period,
                  style: const TextStyle(color: Colors.black54, fontSize: 12),
                ),
                const Text(
                  'plus taxes',
                  style: TextStyle(color: Colors.black45, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CardShell extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  const _CardShell({required this.child, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Color(0x0F000000), blurRadius: 12)],
      ),
      child: child,
    );
  }
}
