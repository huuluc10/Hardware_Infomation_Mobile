import 'package:flutter/material.dart';

class TabBarCPU extends StatelessWidget {
  const TabBarCPU({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: const [
        Tab(
          child: Text(
            'SOC',
            style: TextStyle(fontSize: 14),
          ),
        ),
        Tab(
          child: Text(
            'DEVICE',
            style: TextStyle(fontSize: 14),
          ),
        ),
        Tab(
          child: Text(
            'SYSTEM',
            style: TextStyle(fontSize: 14),
          ),
        ),
        Tab(
          child: Text(
            'BATTERY',
            style: TextStyle(fontSize: 14),
          ),
        ),
        Tab(
          child: Text(
            'THERMAL',
            style: TextStyle(fontSize: 14),
          ),
        ),
        Tab(
          child: Text(
            'SENSORS',
            style: TextStyle(fontSize: 14),
          ),
        ),
        Tab(
          child: Text(
            'ABOUT',
            style: TextStyle(fontSize: 14),
          ),
        ),
      ],
      isScrollable: true,
      unselectedLabelColor: Colors.black,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: const Color.fromARGB(255, 21, 94, 153),
      ),
      // indicatorSize: TabBarIndicatorSize.tab,
      indicatorWeight: 0,
    );
  }
}
