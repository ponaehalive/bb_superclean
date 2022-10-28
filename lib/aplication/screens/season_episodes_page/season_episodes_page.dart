import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:superclean/aplication/screens/season_episodes_page/season_episodes_vm.dart';
import 'package:superclean/aplication/screens/season_episodes_page/widgets/episode_card_widget.dart';
import 'package:superclean/aplication/ui/icons/app_icons.dart';
import 'package:superclean/aplication/ui/themes/app_colors.dart';
import 'package:superclean/aplication/widgets/icon_widget.dart';

class SeasonEpisodesPage extends StatefulWidget {
  const SeasonEpisodesPage({Key? key}) : super(key: key);

  @override
  State<SeasonEpisodesPage> createState() => _SeasonEpisodesPageState();
}

class _SeasonEpisodesPageState extends State<SeasonEpisodesPage> {
  SeasonEpisodesViewModel viewModel = SeasonEpisodesViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.darkBackground,
        body: SafeArea(
          child: ChangeNotifierProvider(
            create: (_) => viewModel,
            builder: (ctx, _) {
              return Scaffold(
                backgroundColor: AppColors.darkBackground,
                appBar: AppBar(
                  leading: IconWidget(
                    AppIcons.back,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    onTap: () {},
                  ),
                  backgroundColor: Colors.black87,
                  title: Text(
                    'Season ${viewModel.selectedSeason} Episodes',
                  ),
                ),
                body: viewModel.selector<SeasonEpisodesViewModel, bool>(
                  selector: () => viewModel.isAllBBEpisodesLoading,
                  builder: (ctx, _) {
                    return SafeArea(
                      child: SingleChildScrollView(
                        child: Column(
                          children: viewModel.selectedSeasonList!.map(
                            (episode) {
                              return EpisodeCardWidget(
                                onTap: () {},
                                episode: episode,
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ));
  }
}
