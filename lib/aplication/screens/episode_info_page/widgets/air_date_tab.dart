import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superclean/aplication/screens/episode_info_page/episode_info_vm.dart';
import 'package:superclean/aplication/ui/themes/app_colors.dart';

class CharactersTab extends StatefulWidget {
  const CharactersTab({Key? key}) : super(key: key);

  @override
  State<CharactersTab> createState() => _CharactersTabState();
}

class _CharactersTabState extends State<CharactersTab> {
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
              padding: const EdgeInsets.only(top: 30.0),
              child: Column(
                children: viewModel.characters.map(
                  (characters) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: Text(
                        characters!,
                        style: const TextStyle(
                          color: AppColors.white,
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            );
          },
        );
      },
    );
  }
}
