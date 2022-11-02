/* import 'package:pod_player/pod_player.dart';
import 'package:flutter/material.dart';
import 'package:superclean/aplication/screens/episode_info_page/episode_info_vm.dart';

class TrailerTab extends StatefulWidget {
    PodPlayerController? controller;


  @override
  State<TrailerTab> createState() => _TrailerTabState();
}

class _TrailerTabState extends State<TrailerTab> {
   EpisodeInfoViewModel viewModel = EpisodeInfoViewModel();
 

  @override
 /*  void initState() {
    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.youtube('https://youtu.be/A3ltMaM6noM'),
    )..initialise();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
 */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PodVideoPlayer(controller: viewModel.controller),
    );
  }
} */

import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';
import 'package:provider/provider.dart';
import 'package:superclean/aplication/screens/characters_page/characters_page_vm.dart';
import 'package:superclean/aplication/screens/episode_info_page/episode_info_vm.dart';
import 'package:superclean/aplication/ui/themes/app_colors.dart';

import 'package:superclean/aplication/widgets/custom_image/custom_image_loader.dart';

class TrailerTab extends StatefulWidget {
  const TrailerTab({Key? key}) : super(key: key);

  @override
  State<TrailerTab> createState() => _TrailerTabState();
}

class _TrailerTabState extends State<TrailerTab> {
  EpisodeInfoViewModel viewModel = EpisodeInfoViewModel();



late final PodPlayerController controller;

  @override
  void initState() {
    controller = PodPlayerController(
      podPlayerConfig: const PodPlayerConfig(
        autoPlay: false,
        
      ),
      playVideoFrom: PlayVideoFrom.youtube(viewModel.recording ?? ''),
    )..initialise();
    /* SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]); */
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    //SystemChrome.setPreferredOrientations([
   //  DeviceOrientation.portraitUp,
   // ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SafeArea(
        child: ChangeNotifierProvider<EpisodeInfoViewModel>(
          create: (_) => viewModel,
          child: Center(
            child: viewModel.selector<EpisodeInfoViewModel, bool?>(
              selector: () => viewModel.isAllBBEpisodesLoading,
              builder: (ctx, _) {
                return SizedBox(
                  child: (viewModel.isAllBBEpisodesLoading)
                      ? const CustomImageLoader(
                          height: 64,
                          width: 64,
                        )
                      : PodVideoPlayer(controller: controller),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
