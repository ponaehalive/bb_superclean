import 'package:flutter/material.dart';
import 'package:superclean/aplication/screens/episode_info_page/widgets/air_date_tab.dart';
import 'package:superclean/aplication/screens/episode_info_page/widgets/trailer_tab.dart';

import 'main_info_tab.dart';

class TabViews extends StatelessWidget {
  const TabViews({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      physics: BouncingScrollPhysics(),
      children: [
        MainInfoTab(),
        CharactersTab(),
        TrailerTab(),
      ],
    );
  }
}
