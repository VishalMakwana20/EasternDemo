import 'package:eastern_demo/model/category_model.dart';
import 'package:rxdart/rxdart.dart';

import '../api_helper/api_manager.dart';

class CategryBloc {
  final APIManager _apiManager = APIManager();
  final getApiStreamController = PublishSubject<List<Categories>>();

  Stream<List<Categories>> get stream => getApiStreamController.stream;

  Future<void> fetchCategory() async {
    var response = await _apiManager
        .getApiCall('https://fabcurate.easternts.in/category.json');
    getApiStreamController.sink
        .add(AllCategories.fromJson(response).categories!);
  }

  dispose() {
    getApiStreamController.close();
  }
}
