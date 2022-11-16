import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superclean/aplication/screens/character_details_page/character_details_vm.dart';
import 'package:superclean/aplication/ui/themes/app_colors.dart';
import 'package:superclean/aplication/ui/icons/app_icons.dart';
import 'package:superclean/aplication/widgets/custom_image/custom_image.dart';
import 'package:superclean/aplication/widgets/icon_widget.dart';
import 'package:superclean/domain/services/end_points.dart';

class CharacterDetailsPage extends StatefulWidget {
  const CharacterDetailsPage({Key? key}) : super(key: key);

  @override
  State<CharacterDetailsPage> createState() => _CharacterDetailsPageState();
}

class _CharacterDetailsPageState extends State<CharacterDetailsPage> {
  CharacterDeatilsViewModel viewModel = CharacterDeatilsViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SafeArea(
        child: ChangeNotifierProvider<CharacterDeatilsViewModel>(
          create: (_) => viewModel..init(),
          child: Center(
            child: viewModel.selector<CharacterDeatilsViewModel, bool?>(
              selector: () => viewModel.isCharactersLoading,
              builder: (ctx, _) {
                return Scaffold(
                  backgroundColor: AppColors.darkBackground,
                  body: CustomScrollView(
                    slivers: <Widget>[
                      SliverAppBar(
                        leading: IconWidget(
                          AppIcons.back,
                          onTap: viewModel.goToAllCharacters,
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        ),
                        expandedHeight: 460.0,
                        flexibleSpace: FlexibleSpaceBar(
                          background: CustomImage(
                            (viewModel.selectedCharacter?.profilePath != null)
                                ? TMDBEndPoints.image +
                                    viewModel.selectedCharacter!.profilePath!
                                : '',
                            height: 95.0,
                            width: 125.0,
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return Container(
                              color: AppColors.darkBackground,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 20),
                                          _rowWidget(
                                            label: 'Nick:  ',
                                            labelValue: viewModel
                                                .selectedCharacter
                                                ?.roles?[0]
                                                .character,
                                            
                                          ),
                                          const SizedBox(height: 15),
                                          _rowWidget(
                                            label: 'Actor:  ',
                                            labelValue: viewModel
                                                .selectedCharacter?.actorName,
                                          ),
                                          const SizedBox(height: 15),
                                          /*    _rowWidget(
                                            label: 'Name:  ',
                                            labelValue: viewModel
                                                .selectedCharacter?.name,
                                          ),
                                          const SizedBox(height: 15),
                                          _rowWidget(
                                            label: 'Birthday:  ',
                                            labelValue: viewModel.birthDayFormatted,
                                          ),
                                          const SizedBox(height: 15),
                                          _rowWidget(
                                            label: 'Portrayed:  ',
                                            labelValue: viewModel
                                                .selectedCharacter?.actorName,
                                          ),
                                          const SizedBox(height: 15),
                                          _rowWidget(
                                            label: 'Status:  ',
                                            labelValue: viewModel
                                                .selectedCharacter?.status,
                                          ), */
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          childCount: 1,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _rowWidget({
    required String label,
    required String? labelValue,
  }) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.white,
          ),
        ),
        Text(
          labelValue ?? '',
          style: const TextStyle(
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
