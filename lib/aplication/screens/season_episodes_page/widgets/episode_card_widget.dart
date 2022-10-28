
import 'package:flutter/material.dart';
import 'package:superclean/domain/models/episode_model.dart';

class EpisodeCardWidget extends StatelessWidget {
  final void Function()? onTap;
  final EpisodeModel episode;

  const EpisodeCardWidget({super.key, 
    required this.episode,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xFF282828),
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
             BoxShadow(
                blurRadius: 2.0,
                offset: Offset(
                  1.0,
                  1.0,
                ), // shadow direction: bottom right
              ),
            ],
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Center(
                  child: Text(
                    episode.title ?? '',
                    
                  ),
                ),
              ),
              Positioned(
                left: 5,
                top: 5,
                child: Text(
                  episode.episodeNumber ?? '',
                 
                ),
              ),
              Positioned(
                bottom: 1,
                right: 5,
                child: Text(
                  episode.airDate ?? '',
                  
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
