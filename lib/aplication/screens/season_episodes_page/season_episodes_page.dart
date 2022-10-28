import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superclean/aplication/screens/season_episodes_page/season_episodes_vm.dart';
import 'package:superclean/aplication/screens/season_episodes_page/widgets/episode_card_widget.dart';
import 'package:superclean/aplication/ui/icons/app_icons.dart';
import 'package:superclean/aplication/ui/themes/app_colors.dart';
import 'package:superclean/aplication/widgets/custom_image/custom_image_loader.dart';
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
      appBar: AppBar(
        elevation: 0,
        leading: IconWidget(
          AppIcons.back,
          onTap: viewModel.backToSeasonsList,
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
            return viewModel.selector<SeasonEpisodesViewModel, bool>(
              selector: () => viewModel.isAllBBEpisodesLoading,
              builder: (ctx, _) {
                return SafeArea(
                  child: viewModel.isAllBBEpisodesLoading
                      ? const Center(
                          child: CustomImageLoader(
                            height: 64,
                            width: 64,
                          ),
                        )
                      : SingleChildScrollView(
                          child: Column(
                            children: viewModel.selectedSeasonList!.map(
                              (episode) {
                                return EpisodeCardWidget(
                                  onTap: () => viewModel.selectEpisode(episode),
                                  episode: episode,
                                );
                              },
                            ).toList(),
                          ),
                        ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
