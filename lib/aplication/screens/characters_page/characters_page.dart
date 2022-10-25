import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:superclean/aplication/navigation/router.gr.dart';
import 'package:superclean/aplication/screens/characters_page/characters_page_vm.dart';
import 'package:superclean/aplication/ui/themes/app_colors.dart';
import 'package:superclean/aplication/widgets/character_card.dart';
import 'package:superclean/aplication/widgets/custom_image/custom_image_loader.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({Key? key}) : super(key: key);

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  CharactersPageViewModel charactersPageViewModel = CharactersPageViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SafeArea(
        child: ChangeNotifierProvider<CharactersPageViewModel>(
          create: (_) => charactersPageViewModel..init(),
          child: Center(
            child: charactersPageViewModel
                .selector<CharactersPageViewModel, bool?>(
              selector: () => charactersPageViewModel.isCharactersLoading,
              builder: (ctx, _) {
                return SizedBox(
                  child: (charactersPageViewModel.isCharactersLoading)
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
                          children: charactersPageViewModel.allCharacters
                              .map(
                                (character) => CharacterCardWidget(
                                  character: character,
                                  onTap: () {
                                   
                                    charactersPageViewModel
                                        .selectCharacter(character, context);
                                    
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
