
part of '../home_recommend.dart';

abstract class HomeRecommendContract {

  void onHomeRecommendDataReceived(List<RecommendFeedItemModel> items, String msg);

  void onHomeRecommendError(ApiError error);

}