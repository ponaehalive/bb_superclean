import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superclean/aplication/screens/actors_page/actors_page_vm.dart';
import 'package:superclean/aplication/ui/themes/app_colors.dart';
import 'package:superclean/aplication/widgets/character_card.dart';
import 'package:superclean/aplication/widgets/custom_image/custom_image_loader.dart';

class ActorsPage extends StatefulWidget {
  const ActorsPage({Key? key}) : super(key: key);

  @override
  State<ActorsPage> createState() => _ActorsPageState();
}

class _ActorsPageState extends State<ActorsPage> {
  ActorsPageViewModel viewModel = ActorsPageViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SafeArea(
        child: ChangeNotifierProvider<ActorsPageViewModel>(
          create: (_) => viewModel..init(),
          child: Center(
            child: viewModel.selector<ActorsPageViewModel, bool?>(
              selector: () => viewModel.isActorsLoading,
              builder: (ctx, _) {
                return SizedBox(
                  child: (viewModel.isActorsLoading)
                      ? const CustomImageLoader(
                          height: 64,
                          width: 64,
                        )
                      : GridView.count(
                          primary: false,
                          childAspectRatio: (.7 / 1),
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          crossAxisCount: 2,
                          padding: const EdgeInsets.all(0.0),
                          children: viewModel.allActors
                              .map(
                                (character) => ActorCardWidget(
                                  actor: character,
                                  onTap: () {
                                    viewModel.selectCharacter(character);
                                  },
                                ),
                              )
                              .toList(),
                        ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
