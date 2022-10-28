import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:superclean/aplication/navigation/router.gr.dart';
import 'package:superclean/aplication/screens/character_details_page/character_details_page.dart';
import 'package:superclean/aplication/screens/characters_page/characters_page.dart';
import 'package:superclean/aplication/screens/episode_info_page/episode_info_page.dart';
import 'package:superclean/aplication/screens/home_page/home_page.dart';
import 'package:superclean/aplication/screens/auto_tabs_scaffold_page.dart';
import 'package:superclean/aplication/screens/season_episodes_page/season_episodes_page.dart';
import 'package:superclean/aplication/screens/seasons_list_page/seasons_list_page.dart';
import 'package:superclean/aplication/screens/third_page/third_page.dart';

AppRouter get router => AppRouter();

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: '/',
      page: AutoTabsScaffoldPage,
      children: [
        AutoRoute(
          path: 'home_page',
          name: 'HomePageRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: HomePage,
            ),
          ],
        ),
        AutoRoute(
          path: 'second',
          name: 'SecondRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: CharactersPage,
            ),
            AutoRoute(
              path: 'character_details',
              page: CharacterDetailsPage,
            ),
          ],
        ),
        AutoRoute(
          path: 'third',
          name: 'ThirdRouter',
          page: ThirdPage,
        ),
      ],
    ),
       AutoRoute(
              path: 'seasons_list',
              name: 'SeasonsListRoute',
              page: SeasonsListPage,
            ),

             AutoRoute(
              path: 'season_episodes_list',
              name: 'SeasonEpisodesPageRouter',
              page: SeasonEpisodesPage,
            ),

             AutoRoute(
              path: 'episode_info',
              name: 'EpisodeInfoRouter',
              page: EpisodeInfoPage,
            ),
  ],


  

          
)
class $AppRouter {}
