import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superclean/aplication/navigation/router.gr.dart';
import 'package:superclean/aplication/ui/icons/app_icons.dart';
import 'package:superclean/aplication/ui/themes/app_colors.dart';

class AutoTabsScaffoldPage extends StatelessWidget {
  const AutoTabsScaffoldPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomePageRouter(),
        SecondRouter(),
        ThirdRouter(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          backgroundColor: AppColors.darkBackground,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          unselectedItemColor: AppColors.grey,
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: SvgPicture.asset(
                AppIcons.pizza,
                color: AppColors.grey,
                height: 25,
                width: 25,
              ),
              activeIcon: SvgPicture.asset(
                AppIcons.pizza,
                height: 25,
                width: 25,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Actors',
              icon: SvgPicture.asset(
                AppIcons.faces,
                color: AppColors.grey,
                height: 25,
                width: 25,
              ),
              activeIcon: SvgPicture.asset(
                AppIcons.faces,
                height: 25,
                width: 25,
              ),
            ),
            const BottomNavigationBarItem(
              label: 'Users',
              icon: Icon(
                Icons.accessibility_new_sharp,
                color: AppColors.grey,
              ),
              activeIcon: Icon(
                Icons.accessibility_new_sharp,
                color: AppColors.green,
              ),
            ),
          ],
        );
      },
    );
  }
}
