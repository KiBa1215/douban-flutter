part of '../gateway.dart';

class HomeRecommendService {
  static const HOME_RECOMMEND_SERVICE = "/api/v2/elendil/recommend_feed";

  /// 获取首页feed推荐
  Future<ApiResult<RecommendFeedResponse>> getRecommendFeedItemsData(int start, int count) async {
    return await httpClient.get<RecommendFeedResponse>(
      HOME_RECOMMEND_SERVICE,
          (json) => recommendFeedResponseFromJson(json), // json adapt
      queryParameters: {'start': start, 'count': count},
    );
  }
}
