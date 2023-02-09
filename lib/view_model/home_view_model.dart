import 'package:flutter/cupertino.dart';
import '../model/product.dart';
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

  setLoding(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setCurrentVideoPlayed(int index) {
    _currentVideoPlayed = index;
    notifyListeners();
  }

  setVideoList(List<VideosModel> list) {
    _videoList = list;
  }

  setVideoError(ServiceError userError) {
    _videoError = userError;
  }

  HomeViewModel() {
    getVideos();
  }

  getVideos() async {
    setLoding(true);
    var response = await HomeServices.getProduct();
    if (response is Success) {
      setVideoList(response.responce as List<VideosModel>);
    }
    if (response is Failure) {
      ServiceError productError =
          ServiceError(code: response.code, message: response.errorResponce);
      setVideoError(productError);
    }
    setLoding(false);
  }
}
