import 'package:flutter/cupertino.dart';
import '../model/product.dart';
import '../model/users_error.dart';
import '../repo/api_status.dart';
import '../repo/home_serviec.dart';

class HomeViewModel extends ChangeNotifier {
  int _currentVideoPlayed = -1;

  int get currentVideoPlayed => _currentVideoPlayed;
  List<ProductModel> _productList = [];
  ServiceError? _productError;
  bool _loading = false;
  bool get loading => _loading;
  ServiceError? get productError => _productError;
  List<ProductModel>? get productList => _productList;

  setLoding(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setCurrentVideoPlayed(int index) {
    _currentVideoPlayed = index;
    notifyListeners();
  }

  setFeaturedProduct(List<ProductModel> list) {
    _productList = list;
  }

  setProductError(ServiceError userError) {
    _productError = userError;
  }

  HomeViewModel() {
    getProducts();
  }

  getProducts() async {
    setLoding(true);
    var response = await HomeServices.getProduct();
    if (response is Success) {
      setFeaturedProduct(response.responce as List<ProductModel>);
    }
    if (response is Failure) {
      ServiceError productError =
          ServiceError(code: response.code, message: response.errorResponce);
      setProductError(productError);
    }
    setLoding(false);
  }
}
