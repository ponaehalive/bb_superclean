import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superclean/aplication/screens/character_details_page/character_details_vm.dart';
import 'package:superclean/aplication/ui/icons/app_icons.dart';
import 'package:superclean/aplication/ui/themes/app_colors.dart';
import 'package:superclean/aplication/widgets/custom_image/custom_image.dart';
import 'package:superclean/aplication/widgets/icon_widget.dart';
import 'package:superclean/domain/bloc/characters/characters_bloc.dart';

class CharacterDetailsPage extends StatefulWidget {
  const CharacterDetailsPage()
      : super(key: const Key('CharacterDetailsPageKey'));
  @override
  State<CharacterDetailsPage> createState() => _CharacterDetailsPageState();
}

class _CharacterDetailsPageState extends State<CharacterDetailsPage> {
  CharacterDeatilsViewModel characterDetailsViewModel =
      CharacterDeatilsViewModel(CharactersBloc());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Center(
        child: TextButton(
          child:
              Text(CharactersBloc().state.selectedCharacter.actorName ?? '555'),
          onPressed: () {
            print(characterDetailsViewModel.selectedCharacter.actorName);
            print(CharactersBloc().state.loadedCharacter);
          },
        ),
      ),
    );

    /*   ChangeNotifierProvider<CharacterDeatilsViewModel>(
      create: (_) => characterDetailsViewModel,
      builder: (ctx, _) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.darkBackground,
            // appBar: AppBar(
            //   backgroundColor: Colors.black87,
            //   leading: IconWidget(
            //     theme.icons.backArrow,
            //     margin: EdgeInsets.symmetric(horizontal: 8.0),
            //     onTap: viewModel.goToAllCharacters,
            //   ),
            // ),
            body: 
            CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  leading: IconWidget(
                    AppIcons.back,
                    onTap: characterDetailsViewModel.goToAllCharacters,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  expandedHeight: 460.0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: CustomImage(
                      characterDetailsViewModel.selectedCharacter?.image,
                      height: 95.0,
                      width: 125.0,
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 20),
                                    Row(
                                      children: [
                                        const Text(
                                          'Nick:  ',
                                         
                                        ),
                                        Text(
                                          characterDetailsViewModel.selectedCharacter?.nakeName ??
                                              '',
                                          
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      children: [
                                        const Text(
                                          'Name:  ',
                                         
                                        ),
                                        Text(
                                          characterDetailsViewModel.selectedCharacter?.name ?? '',
                                         
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      children: [
                                        const Text(
                                          'Birthday:  ',
                                         
                                        ),
                                      /*   Text(
                                          characterDetailsViewModel.birthDay ?? '',
                                         
                                        ), */
                                      ],
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      children: [
                                        const Text(
                                          'Portrayed:  ',
                                         
                                        ),
                                        Text(
                                          characterDetailsViewModel
                                                  .selectedCharacter?.actorName??
                                              '',
                                          
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      children: [
                                        const Text(
                                          'Status:  ',
                                         
                                        ),
                                        Text(
                                          characterDetailsViewModel.selectedCharacter?.status ??
                                              '',
                                          
                                        ),
                                      ],
                                    ),
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
          ),
        );

        // Text(viewModel.selectedCharacter?.name ?? ''),
      },
  
    
    
        

        // Text(viewModel.selectedCharacter?.name ?? ''),
      
     
    );  */
  }
}
