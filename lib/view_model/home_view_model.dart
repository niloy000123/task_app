import 'package:flutter/cupertino.dart';
import '../model/model_video.dart';
import '../model/users_error.dart';
import '../repo/api_status.dart';
import '../repo/home_serviec.dart';

class HomeViewModel extends ChangeNotifier {
  int _currentVideoPlayed = -1;

  int get currentVideoPlayed => _currentVideoPlayed;
  List<VideosModel> _videoList = [];
  ServiceError? _videoError;
  bool _loading = false;
  bool get loading => _loading;
  ServiceError? get videoError => _videoError;
  List<VideosModel>? get productList => _videoList;

  _setLoding(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setCurrentVideoPlayed(int index) {
    _currentVideoPlayed = index;
    notifyListeners();
  }

  _setVideoList(List<VideosModel> list) {
    _videoList = list;
  }

  _setVideoError(ServiceError userError) {
    _videoError = userError;
  }

  HomeViewModel() {
    _getVideos();
  }

  _getVideos() async {
    _setLoding(true);
    var response = await HomeServices.getVideoList();
    if (response is Success) {
      _setVideoList(response.responce as List<VideosModel>);
    }
    if (response is Failure) {
      ServiceError productError =
          ServiceError(code: response.code, message: response.errorResponce);
      _setVideoError(productError);
    }
    _setLoding(false);
  }
}
