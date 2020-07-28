part of '../home_recommend.dart';

class HomeRecommendFeedMapper {
  static RecommendFeedItemModel toRecommendFeedItemModel(RecommendItem item) {
    // 头像url
    var avatar;
    if (item.owner != null) {
      avatar = item.owner.avatar;
    } else if (item.content != null) {
      if (item.content.author != null) {
        avatar = item.content.author.avatar != null ? item.content.author.avatar : item.content.status.author.avatar;
      }
    }
    // 作者名字
    var authorName = '';
    try {
      authorName = item.owner.name;
    } on Exception catch (e) {
      try {
        authorName = item.content.status.author.name;
      } on Exception catch (e) {
        authorName = '';
      }
    }

    // 配图
    var photos;
    try {
      photos = item.content.photos
          .where((element) => element.image.normal.url.isNotEmpty)
          .map((e) => e.image.normal.url)
          .toList();
    } catch (e) {
      photos = List<String>();
    }

    return RecommendFeedItemModel.name(
      avatar,
      authorName,
      item.type,
      item.topic,
      item.content,
      photos,
    );
  }
}
