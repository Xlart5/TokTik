import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_post_repository.dart';
import 'package:toktik/infraestructure/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  //TODO repository /datasource
  final VideoPostRepository videosRepository;
  bool initialLoading = true;

  List<VideoPost> videos = [];

  DiscoverProvider({required this.videosRepository});

  Future<void> loadNextPage() async {
    // espera 2 segundos
    //await Future.delayed(const Duration(seconds: 2));
    //carga los videos.
    //final List<VideoPost> newVideos = videoPosts
    //    .map((video) => LocalVideoModel.fromJson(video).toVideosPostEntity())
    //    .toList();
    final newVideos = await videosRepository.getTrendingVideosByPage(1);
    videos.addAll(newVideos);
    initialLoading = false;

    notifyListeners();
  }
}
