import 'package:flutter/material.dart';
import 'package:superclean/aplication/screens/episode_info_page/widgets/air_date_tab.dart';
//import 'package:pod_player/pod_player.dart';

import 'main_info_tab.dart';

class TabViews extends StatelessWidget {
  const TabViews({super.key});

  // const TabViews({
  //   required this.videoController,
  //   Key? key,
  // }) : super(key: key);

  // final PodPlayerController videoController;

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      physics: BouncingScrollPhysics(),
      children: [
        // Center(
        //     // child: PodVideoPlayer(
        //     //   controller: videoController,
        //     // ),
        //     ),
        MainInfoTab(),
        AirDateTab(),
        Center(
          child: Text('Content of Tab Three'),
        ),
      ],
    );
  }
}
