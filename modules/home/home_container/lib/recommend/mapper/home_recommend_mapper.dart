part of '../home_recommend.dart';

class HomeRecommendFeedMapper {
  static RecommendFeedItemModel toRecommendFeedItemModel(RecommendItem item) {
    // 头像url
    var avatar = _mapAvatar(item);
    // 作者名字
    var authorName = _mapAuthorName(item);
    // 配图
    List<String> photos = _mapImages(item);

    return RecommendFeedItemModel.name(
      avatar,
      authorName,
      item.type,
      item.topic,
      item.content,
      photos,
    );
  }

  /// 头像
  static String _mapAvatar(RecommendItem item) {
    var avatar;
    if (item.owner != null) {
      avatar = item.owner.avatar;
    } else if (item.content != null) {
      if (item.content.author != null) {
        avatar = item.content.author.avatar != null ? item.content.author.avatar : item.content.status.author.avatar;
      }
    }
    return avatar;
  }

  /// 作者名字
  static String _mapAuthorName(RecommendItem item) {
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
    return authorName;
  }

  /// 配图
  static List<String> _mapImages(RecommendItem item) {
    List<String> photos;
    try {
      photos = item.content.photos
          .where((element) => element.image.normal.url.isNotEmpty)
          .map((e) => e.image.normal.url)
          .toList();
    } catch (e) {
      try {
        // photos为空，取images数据
        photos = item.content.status.images
            .where((element) {
              try {
                if (element.normal.url.isNotEmpty) {
                  return true;
                }
              } catch (e) {
                return false;
              }
              return false;
            })
            .map((e) => e.normal.url)
            .toList();
      } catch (e) {
        photos = List<String>();
      }
    }
    return photos;
  }
}
