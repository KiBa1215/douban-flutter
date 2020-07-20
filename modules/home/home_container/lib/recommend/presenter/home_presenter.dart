part of '../home_recommend.dart';

class HomeRecommendPresenter {
  HomeRecommendContract contract;

  HomeRecommendPresenter(this.contract);

  final homeRecommendService = HomeRecommendService();

  Future<void> getRecommendFeedItemsData(int start, int count) async {
    final response = await homeRecommendService.getRecommendFeedItemsData(start, count);
    var feedData = response.data;
    List<RecommendFeedItemModel> models = await Future(() {
      // 过滤无效数据
      feedData.items = feedData.items.where((element) => element.showActions).toList();
      // 数据转换
      List<RecommendFeedItemModel> items =
          feedData.items.map((item) => HomeRecommendFeedMapper.toRecommendFeedItemModel(item)).toList();
      return items;
    });
    if (response.isSuccessful) {
      contract.onHomeRecommendDataReceived(models);
    } else {
      contract.onHomeRecommendError(response.error);
    }
  }

  void clear() {
    contract = null;
  }
}
