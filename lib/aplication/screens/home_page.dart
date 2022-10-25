import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:superclean/aplication/navigation/router.gr.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        FirstRouter(),
        SecondRouter(),
        ThirdRouter(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              label: 'Users',
              icon: Icon(
                Icons.accessibility_new_sharp,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Users',
              icon: Icon(
                Icons.radio,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Users',
              icon: Icon(
                Icons.accessibility_new_sharp,
              ),
            ),
          ],
        );
      },
    );
  }
}
