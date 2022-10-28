import 'package:flutter/material.dart';

class TabBars extends StatelessWidget {
  const TabBars({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelPadding: const EdgeInsets.symmetric(horizontal: 25),
      labelColor: Colors.white,
      unselectedLabelColor: Colors.grey,
      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
      // unselectedLabelStyle: const TextStyle(fontStyle: FontStyle.italic),
      overlayColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          return Colors.lightGreen;
        }
        if (states.contains(MaterialState.focused)) {
          return Colors.orange;
        } else if (states.contains(MaterialState.hovered)) {
          return Colors.pinkAccent;
        }

        return Colors.transparent;
      }),
      // indicatorWeight: 10,
      indicatorColor: Colors.red,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorPadding: const EdgeInsets.all(5),
      indicator: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(10),
        color: Colors.green,
      ),
      // isScrollable: true,
      physics: const BouncingScrollPhysics(),
      onTap: (int index) {},
      enableFeedback: true,
      tabs: _tabs,
    );
  }

  static const List<Tab> _tabs = [
    Tab(child: Text('Main info')),
    Tab(child: Text('Characters')),
    Tab(child: Text('Trailer')),
  ];
}
