import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superclean/aplication/navigation/router.gr.dart';
import 'package:superclean/aplication/ui/icons/app_icons.dart';
import 'package:superclean/aplication/ui/themes/app_colors.dart';

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
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: SvgPicture.asset(
                AppIcons.pizza,
                color: AppColors.darkSecondary,
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
              label: 'Characters',
              icon: SvgPicture.asset(
                AppIcons.faces,
                color: AppColors.darkSecondary,
                height: 20,
                width: 25,
              ),
              activeIcon: SvgPicture.asset(
                AppIcons.faces,
               
                height: 20,
                width: 25,
              ),
            ),
            const BottomNavigationBarItem(
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
