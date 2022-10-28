import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superclean/aplication/screens/seasons_list_page/seasons_list_vm.dart';
import 'package:superclean/aplication/screens/seasons_list_page/widgets/season_card_widget.dart';
import 'package:superclean/aplication/ui/icons/app_icons.dart';
import 'package:superclean/aplication/ui/themes/app_colors.dart';
import 'package:superclean/aplication/widgets/icon_widget.dart';

class SeasonsListPage extends StatefulWidget {
  const SeasonsListPage({Key? key}) : super(key: key);

  @override
  State<SeasonsListPage> createState() => _SeasonsListPageState();
}

class _SeasonsListPageState extends State<SeasonsListPage> {
  SeasonsListViewModel viewModel = SeasonsListViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel..init(),
      builder: (ctx, _) {
        return Scaffold(
          backgroundColor: AppColors.darkBackground,
          appBar: AppBar(
            leading: IconWidget(
                          AppIcons.back,
                          onTap: viewModel.goHome,
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        ),
            backgroundColor: AppColors.darkBackground,
            elevation: 0,
            title: const Text(
              'Breaking Bad Seasons',
            ),
          ),
          body: viewModel.selector<SeasonsListViewModel, bool>(
            selector: () => viewModel.isAllBBEpisodesLoading,
            builder: (ctx, _) {
              return SafeArea(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 10,
                    ),
                    child: SizedBox(
                      height: double.infinity,
                      child: GridView.count(
                        primary: false,
                        childAspectRatio: (.7 / 1),
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        crossAxisCount: 2,
                        children: <Widget>[
                          SeasonCardWidget(
                            image: 'assets/images/bb1season.jpg',
                            onTap: () => viewModel.selectSeason('1'),
                          ),
                          SeasonCardWidget(
                            image: 'assets/images/bb2season.jpg',
                           onTap: () => viewModel.selectSeason('2'),
                          ),
                          SeasonCardWidget(
                            image: 'assets/images/bb3season.jpg',
                            onTap: () => viewModel.selectSeason('3'),
                          ),
                          SeasonCardWidget(
                            image: 'assets/images/bb4season.jpg',
                            onTap: () => viewModel.selectSeason('4'),
                          ),
                          SeasonCardWidget(
                            image: 'assets/images/bb5season.jpg',
                           onTap: () => viewModel.selectSeason('5'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
