/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:superclean/aplication/screens/second_page/second_page_vm.dart';
import 'package:superclean/aplication/widgets/character_card.dart';
import 'package:superclean/aplication/widgets/custom_image/custom_image_loader.dart';
import 'package:superclean/domain/bloc/characters/characters_bloc.dart';
import 'package:superclean/domain/bloc/characters/characters_event.dart';
import 'package:superclean/domain/bloc/characters/characters_state.dart';
import 'package:superclean/domain/services/characters_repository.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  SecondPageViewModel secondPageViewModel = SecondPageViewModel();
  @override
  Widget build(BuildContext context) {
    
        return  ChangeNotifierProvider<SecondPageViewModel>(
        create: (_) => secondPageViewModel..init(),
        

          child: 
          
          RepositoryProvider(
            create: (context) => CharacterRepository(),
            child: BlocProvider(
              create: (context) => CharactersBloc()
                 ..add(
                  CharactersLoadEvent(),
                ), 
              child: BlocBuilder<CharactersBloc, CharactersState>(
                builder: (context, state) {
                  if (state is CharactersEmptyState) {
                    return const Center(
                      child: Text('empty'),
                    );
                  }
                  if (state is CharactersLoadingState) {
                    return const Center(
                      child: CustomImageLoader(
                        height: 100,
                        width: 100,
                      ),
                    );
                  }
                  if (state is CharactersLoadedState) {
                    return  GridView.count(
                                primary: false,
                                childAspectRatio: (.7 / 1),
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                crossAxisCount: 2,
                                padding: const EdgeInsets.all(0.0),
                                children: state.loadedCharacter
                                    .map(
                                      (character) => CharacterCardWidget(
                                        character: character,
                                        onTap: () {},
                                      ),
                                    )
                                    .toList(),
                              );
                          
                  }
        
                  return const Text('Error');
                },
              ),
            ),
          ),
        );
    
  }
}
*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superclean/aplication/screens/first_page/first_page_vm.dart';
import 'package:superclean/aplication/screens/second_page/second_page_vm.dart';
import 'package:superclean/domain/bloc/characters/characters_bloc.dart';
import 'package:superclean/domain/services/characters_repository.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  SecondPageViewModel secondPageViewModel = SecondPageViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<SecondPageViewModel>(
        create: (_) => secondPageViewModel..init(),
        child: Center(
          child: secondPageViewModel.selector<SecondPageViewModel, String>(
                  selector: () => secondPageViewModel.peremen2,
                  builder: (ctx, _) {
              return Column(
                children: [
                  TextButton(
                    child: Text(secondPageViewModel.peremen2),
                    onPressed: () => secondPageViewModel.change2(),
                  ),

                  
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
