import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superclean/aplication/screens/second_page/second_page_vm.dart';
import 'package:superclean/aplication/ui/themes/app_colors.dart';
import 'package:superclean/aplication/widgets/character_card.dart';


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
          child: secondPageViewModel.selector<SecondPageViewModel, bool>(
                  selector: () => secondPageViewModel.isCharactersLoading,
                  builder: (ctx, _) {
               return SizedBox(
                      child: 
                      
                      (secondPageViewModel.isCharactersLoading)
                          ? const SizedBox(
                              height: 64.0,
                              width: double.infinity,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.green,
                                ),
                              ),
                            )
                          :
                      GridView.count(
                              primary: false,
                              childAspectRatio: (.7 / 1),
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              crossAxisCount: 2,
                              padding: const EdgeInsets.all(0.0),
                              children: secondPageViewModel.allCharacters!
                                  .map(
                                    (character) => CharacterCardWidget(
                                      character: character,
                                      onTap:(){}
                                    ),
                                  )
                                  .toList(),
                            ),
                    );
                            
            },
          ),
        ),
      ),
    );
  }
}
