import 'package:eastern_demo/model/bottom_model.dart';
import 'package:eastern_demo/model/middle_model.dart';
import 'package:rxdart/rxdart.dart';

import '../api_helper/api_manager.dart';
import '../model/top_model.dart';

class HomeBloc {
  final APIManager _apiManager = APIManager();
  final getTopApiStreamController = PublishSubject<List<MainStickyMenu>>();
  Stream<List<MainStickyMenu>> get topStream =>
      getTopApiStreamController.stream;

  final getMiddleApiStreamController = PublishSubject<MiddlePage>();
  Stream<MiddlePage> get middleStream => getMiddleApiStreamController.stream;

  final getBottomApiStreamController = PublishSubject<BottomPage>();
  Stream<BottomPage> get bottomStream => getBottomApiStreamController.stream;

  final topIndexStreamController = PublishSubject<int>();
  Stream<int> get topIndexStream => topIndexStreamController.stream;

  Future<void> fetchTopData() async {
    var response =
        await _apiManager.getApiCall('https://fabcurate.easternts.in/top.json');
    getTopApiStreamController.sink
        .add(TopMenu.fromJson(response).mainStickyMenu!);
  }

  Future<void> fetchMiddleData() async {
    var response = await _apiManager
        .getApiCall('https://fabcurate.easternts.in/middle.json');
    getMiddleApiStreamController.sink.add(MiddlePage.fromJson(response));
  }

  Future<void> fetchBottomData() async {
    var response = await _apiManager
        .getApiCall('https://fabcurate.easternts.in/bottom.json');
    getBottomApiStreamController.sink.add(BottomPage.fromJson(response));
  }

  void updateIndex(int index) {
    topIndexStreamController.sink.add(index);
  }

  dispose() {
    getTopApiStreamController.close();
    getMiddleApiStreamController.close();
    getBottomApiStreamController.close();
    topIndexStreamController.close();
  }
}
