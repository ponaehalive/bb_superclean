import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superclean/aplication/screens/episode_info_page/episode_info_vm.dart';
import 'package:superclean/aplication/screens/episode_info_page/widgets/tab_bars.dart';
import 'package:superclean/aplication/screens/episode_info_page/widgets/tab_views.dart';
import 'package:superclean/aplication/ui/icons/app_icons.dart';
import 'package:superclean/aplication/ui/themes/app_colors.dart';
import 'package:superclean/aplication/widgets/icon_widget.dart';

class EpisodeInfoPage extends StatefulWidget {
  const EpisodeInfoPage({Key? key}) : super(key: key);

  @override
  State<EpisodeInfoPage> createState() => _EpisodeInfoPageState();
}

class _EpisodeInfoPageState extends State<EpisodeInfoPage> {
  EpisodeInfoViewModel viewModel = EpisodeInfoViewModel();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.darkBackground,
        appBar: AppBar(
          bottom: const PreferredSize(
            preferredSize: Size(
              20.0,
              50.0,
            ),
            child: TabBars(),
          ),
          elevation: 0,
          leading: IconWidget(
            AppIcons.back,
            onTap: viewModel.backToSelectedSeasonEpisodes,
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
          ),
          backgroundColor: AppColors.darkBackground,
          title: Text(
            viewModel.appBarText,
          ),
        ),
        body: SafeArea(
          child: ChangeNotifierProvider(
            create: (_) => viewModel,
            builder: (ctx, _) {
              return viewModel.selector<EpisodeInfoViewModel, bool>(
                selector: () => viewModel.isAllBBEpisodesLoading,
                builder: (ctx, _) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: TabViews(

                      
                        ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
