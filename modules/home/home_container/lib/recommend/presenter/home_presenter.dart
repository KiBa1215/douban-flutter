part of '../home_recommend.dart';

class HomeRecommendPresenter {
  int start = 0;
  static const int count = 40;

  HomeRecommendContract contract;

  HomeRecommendPresenter(this.contract);

  final homeRecommendService = HomeRecommendService();

  Future<void> getRecommendFeedItemsData({
    int start = 0,
    int count = count,
  }) async {
    final response = await homeRecommendService.getRecommendFeedItemsData(start, count);
    if (response.isSuccessful) {
      var feedData = response.data;
      List<RecommendFeedItemModel> models = await Future(() {
        // 过滤无效数据
        feedData.items = feedData.items.where((element) => element.showActions).toList();
        // 数据转换
        List<RecommendFeedItemModel> items = feedData.items
            .map((item) => HomeRecommendFeedMapper.toRecommendFeedItemModel(item))
            .toList();
        return items;
      });
      contract?.onHomeRecommendDataReceived(models, response.data.toast);
    } else {
      contract?.onHomeRecommendError(response.error);
    }
  }

  void clear() {
    contract = null;
  }
}
