import 'package:flutter/material.dart';

class FollowUpTabs extends StatefulWidget {
  const FollowUpTabs({super.key});

  @override
  _FollowUpTabsState createState() => _FollowUpTabsState();
}

class _FollowUpTabsState extends State<FollowUpTabs>
    with TickerProviderStateMixin {
  late TabController _tabController;

  final List<_TabData> tabs = [
    _TabData(label: 'Overdue', count: 1, color: Colors.red),
    _TabData(label: 'Open', count: 0, color: Colors.orange),
    _TabData(label: 'Closed', count: 0, color: Colors.green),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      setState(() {}); // rebuild to update indicator color
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Color _getIndicatorColor(int index) {
    switch (index) {
      case 0:
        return Colors.red.shade300; // Overdue
      case 1:
        return Colors.yellow.shade300; // Open
      case 2:
        return Colors.green.shade300; // Closed
      default:
        return Colors.transparent;
    }
  }

  Widget _buildTab(_TabData tabData, bool isSelected) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Colored circle with count
        Text(
          tabData.label,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? Colors.black : Colors.grey[700],
          ),
        ),
        const SizedBox(width: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: tabData.color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            '${tabData.count}',
            style: TextStyle(
              color: tabData.color,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: TabBar(
        controller: _tabController,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        labelStyle: const TextStyle(fontWeight: FontWeight.w600),
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: _getIndicatorColor(_tabController.index),
        ),
        //indicatorColor: tabs[_tabController.index].color,
        tabs: List.generate(
          tabs.length,
          (index) => Tab(
            child: AnimatedBuilder(
              animation: _tabController.animation!,
              builder: (context, child) {
                final isSelected = _tabController.index == index;
                return _buildTab(tabs[index], isSelected);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _TabData {
  final String label;
  final int count;
  final Color color;
  _TabData({required this.label, required this.count, required this.color});
}
