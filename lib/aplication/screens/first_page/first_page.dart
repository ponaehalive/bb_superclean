import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superclean/aplication/screens/first_page/first_page_vm.dart';
import 'package:superclean/aplication/screens/first_page/widgets/movie_card.dart';
import 'package:superclean/aplication/ui/themes/app_colors.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  FirstPageViewModel viewModel = FirstPageViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FirstPageViewModel>(
      create: (_) => viewModel..init(),
      child: viewModel.selector<FirstPageViewModel, String>(
        selector: () => viewModel.peremen,
        builder: (ctx, _) {
          return Scaffold(
            backgroundColor: AppColors.darkBackground,
            body: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: SizedBox(
                    height: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MovieCard(
                            image: 'assets/images/brbadlogo.jpg', onTap: () {}

                            //viewModel.goToBBSeasonsList,
                            ),
                        const SizedBox(
                          height: 15,
                        ),
                        MovieCard(
                          image: 'assets/images/saullogo.jpg',
                          onTap: () {},
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        MovieCard(
                          image: 'assets/images/elcaminologo.jpg',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
