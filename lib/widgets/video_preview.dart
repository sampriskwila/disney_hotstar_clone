import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../models/models.dart';

class VideoPreview extends StatefulWidget {
  final List<MovieVideo> videos;

  const VideoPreview({
    super.key,
    required this.videos,
  });

  @override
  State<VideoPreview> createState() => _VideoPreviewState();
}

class _VideoPreviewState extends State<VideoPreview> {
  late YoutubePlayerController _youtubePlayerController;

  @override
  void initState() {
    final MovieVideo video =
        widget.videos.lastWhere((element) => element.type == 'Trailer');
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: video.key ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _youtubePlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _youtubePlayerController,
      showVideoProgressIndicator: true,
    );
  }
}
