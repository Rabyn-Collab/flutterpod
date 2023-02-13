import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pod_player/pod_player.dart';

import '../models/movie.dart';
import '../providers/video_provider.dart';




class DetailPage extends ConsumerWidget {
final Movie movie;
DetailPage(this.movie);
  @override
  Widget build(BuildContext context, ref) {
    final videoData = ref.watch(videoProvider(movie.id));
    return Scaffold(
        body: Column(
          children: [
           Container(
             height: 300,
             child: videoData.when(
                 data: (data){
                 return data.isEmpty ? Text('no -video'): VideoPlay(data[0]);
                 },
                 error: (err, stack) => Center(child: Text('$err')),
                 loading: () => Container()
             ),
           ),
          ],
        )
    );
  }
}


class VideoPlay extends StatefulWidget {
final String keys;
VideoPlay(this.keys);

  @override
  State<VideoPlay> createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay> {
  late final PodPlayerController controller;

  @override
  void initState() {
    controller = PodPlayerController(
        playVideoFrom: PlayVideoFrom.youtube('https://youtu.be/${widget.keys}'),
        podPlayerConfig: const PodPlayerConfig(
            autoPlay: true,
            isLooping: false,

        )
    )..initialise();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PodVideoPlayer(controller: controller);
  }
}

