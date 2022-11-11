import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superclean/aplication/screens/home_page/home_page_vm.dart';
import 'package:superclean/aplication/screens/home_page/widgets/movie_card.dart';
import 'package:superclean/aplication/ui/themes/app_colors.dart';
import 'package:superclean/domain/services/secure_auth_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageViewModel viewModel = HomePageViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageViewModel>(
      create: (_) => viewModel..init(),
      child: viewModel.selector<HomePageViewModel, String>(
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
                        const SizedBox(
                          height: 5,
                        ),
                        MovieCard(
                          image: 'assets/images/brbadlogo.jpg',
                          onTap: viewModel.goToBBSeasonsList,
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
                          onTap: () => SecureAuthData().saveSessionId(null),
                        ),
                        const SizedBox(
                          height: 5,
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
