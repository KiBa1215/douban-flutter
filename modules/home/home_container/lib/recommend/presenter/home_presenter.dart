part of '../home_recommend.dart';

class HomeRecommendPresenter {
  int _start = 0;
  static const int COUNT = 20;

  HomeRecommendContract contract;

  HomeRecommendPresenter(this.contract);

  final homeRecommendService = HomeRecommendService();

  Future<void> _getRecommendFeedItemsData({
    int start = 0,
  }) async {
    final response = await homeRecommendService.getRecommendFeedItemsData(start, COUNT);
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
      if (start == 0) {
        contract?.onHomeRecommendDataReceived(models, response.data.toast);
      } else {
        contract?.onLoadMoreHomeRecommendData(models, response.data.toast);
      }
      // 更新start的index
      _start += COUNT;
    } else {
      contract?.onHomeRecommendError(response.error);
    }
  }

  Future<void> refresh() {
    return _getRecommendFeedItemsData(start: 0);
  }
  
  Future<void> loadMoreRecommendFeedItems() {
    return _getRecommendFeedItemsData(start: _start);
  }

  void clear() {
    contract = null;
  }
}
