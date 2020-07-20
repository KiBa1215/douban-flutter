
part of '../home_recommend.dart';

abstract class HomeRecommendContract {

  void onHomeRecommendDataReceived(List<RecommendFeedItemModel> items);

  void onHomeRecommendError(ApiError error);

}