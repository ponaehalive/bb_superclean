import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superclean/aplication/screens/episode_info_page/episode_info_vm.dart';
import 'package:superclean/aplication/ui/themes/app_colors.dart';

class MainInfoTab extends StatefulWidget {
  const MainInfoTab({Key? key}) : super(key: key);

  @override
  State<MainInfoTab> createState() => _MainInfoTabState();
}

class _MainInfoTabState extends State<MainInfoTab> {
  EpisodeInfoViewModel viewModel = EpisodeInfoViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      builder: (ctx, _) {
        return viewModel.selector<EpisodeInfoViewModel, bool>(
          selector: () => viewModel.isAllBBEpisodesLoading,
          builder: (ctx, _) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Text(
                        'Season:  ',
                        style: TextStyle(
                          color: AppColors.white,
                        ),
                      ),
                      Text(
                        viewModel.selectedEpisode?.season ?? '',
                        style: const TextStyle(
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      const Text(
                        'Episode:  ',
                        style: TextStyle(
                          color: AppColors.white,
                        ),
                      ),
                      Text(
                        viewModel.selectedEpisode?.episodeNumber ?? '',
                        style: const TextStyle(
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      const Text(
                        'Air Date:  ',
                        style: TextStyle(
                          color: AppColors.white,
                        ),
                      ),
                      Text(
                        viewModel.airDayFormatted ?? '',
                        style: const TextStyle(
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Text(
                    viewModel.selectedEpisode?.title ?? '',
                    style: const TextStyle(
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
