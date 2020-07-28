// To parse this JSON data, do
//
//     final recommendFeedResponse = recommendFeedResponseFromJson(jsonString);

import 'dart:convert';

RecommendFeedResponse recommendFeedResponseFromJson(String str) => RecommendFeedResponse.fromJson(json.decode(str));

String recommendFeedResponseToJson(RecommendFeedResponse data) => json.encode(data.toJson());

class RecommendFeedResponse {
  RecommendFeedResponse({
    this.count,
    this.items,
    this.toast,
    this.newItemCount,
    this.start,
  });

  int count;
  List<RecommendItem> items;
  String toast;
  int newItemCount;
  int start;

  factory RecommendFeedResponse.fromJson(Map<String, dynamic> json) => RecommendFeedResponse(
    count: json["count"],
    items: List<RecommendItem>.from(json["items"].map((x) => RecommendItem.fromJson(x))),
    toast: json["toast"],
    newItemCount: json["new_item_count"],
    start: json["start"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "toast": toast,
    "new_item_count": newItemCount,
    "start": start,
  };
}

class RecommendItem {
  RecommendItem({
    this.uid,
    this.showActions,
    this.topic,
    this.createdTime,
    this.actionInfo,
    this.collectionsCount,
    this.owner,
    this.resharesCount,
    this.id,
    this.layout,
    this.comments,
    this.content,
    this.isCollected,
    this.typeCn,
    this.type,
    this.reactionType,
    this.subjectCard,
    this.recInfo,
    this.moreItemCount,
    this.sharingUrl,
    this.resharer,
    this.url,
    this.uri,
    this.foldKey,
    this.reactionsCount,
    this.commentsCount,
    this.ownerAlterLabel,
    this.adInfo,
  });

  Uid uid;
  bool showActions;
  ItemTopic topic;
  dynamic createdTime;
  ActionInfo actionInfo;
  int collectionsCount;
  Owner owner;
  int resharesCount;
  String id;
  int layout;
  List<dynamic> comments;
  Content content;
  bool isCollected;
  String typeCn;
  ArticleType type;
  int reactionType;
  dynamic subjectCard;
  RecInfo recInfo;
  int moreItemCount;
  String sharingUrl;
  dynamic resharer;
  String url;
  String uri;
  String foldKey;
  int reactionsCount;
  int commentsCount;
  dynamic ownerAlterLabel;
  AdInfo adInfo;

  factory RecommendItem.fromJson(Map<String, dynamic> json) => RecommendItem(
    uid: uidValues.map[json["uid"]],
    showActions: json["show_actions"],
    topic: json["topic"] == null ? null : ItemTopic.fromJson(json["topic"]),
    createdTime: json["created_time"],
    actionInfo: json["action_info"] == null ? null : ActionInfo.fromJson(json["action_info"]),
    collectionsCount: json["collections_count"],
    owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
    resharesCount: json["reshares_count"],
    id: json["id"],
    layout: json["layout"],
    comments: List<dynamic>.from(json["comments"].map((x) => x)),
    content: Content.fromJson(json["content"]),
    isCollected: json["is_collected"],
    typeCn: json["type_cn"],
    type: json["type"] == null ? null : contentTypeValues.map[json["type"]],
    reactionType: json["reaction_type"],
    subjectCard: json["subject_card"],
    recInfo: json["rec_info"] == null ? null : RecInfo.fromJson(json["rec_info"]),
    moreItemCount: json["more_item_count"],
    sharingUrl: json["sharing_url"],
    resharer: json["resharer"],
    url: json["url"],
    uri: json["uri"],
    foldKey: json["fold_key"],
    reactionsCount: json["reactions_count"],
    commentsCount: json["comments_count"],
    ownerAlterLabel: json["owner_alter_label"],
    adInfo: json["ad_info"] == null ? null : AdInfo.fromJson(json["ad_info"]),
  );

  Map<String, dynamic> toJson() => {
    "uid": uidValues.reverse[uid],
    "show_actions": showActions,
    "topic": topic == null ? null : topic.toJson(),
    "created_time": createdTime,
    "action_info": actionInfo == null ? null : actionInfo.toJson(),
    "collections_count": collectionsCount,
    "owner": owner == null ? null : owner.toJson(),
    "reshares_count": resharesCount,
    "id": id,
    "layout": layout,
    "comments": List<dynamic>.from(comments.map((x) => x)),
    "content": content.toJson(),
    "is_collected": isCollected,
    "type_cn": typeCn,
    "type": type,
    "reaction_type": reactionType,
    "subject_card": subjectCard,
    "rec_info": recInfo == null ? null : recInfo.toJson(),
    "more_item_count": moreItemCount,
    "sharing_url": sharingUrl,
    "resharer": resharer,
    "url": url,
    "uri": uri,
    "fold_key": foldKey,
    "reactions_count": reactionsCount,
    "comments_count": commentsCount,
    "owner_alter_label": ownerAlterLabel,
    "ad_info": adInfo == null ? null : adInfo.toJson(),
  };
}

class ActionInfo {
  ActionInfo({
    this.text,
    this.uri,
    this.icon,
  });

  String text;
  String uri;
  String icon;

  factory ActionInfo.fromJson(Map<String, dynamic> json) => ActionInfo(
    text: json["text"],
    uri: json["uri"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "uri": uri,
    "icon": icon,
  };
}

class AdInfo {
  AdInfo({
    this.unitName,
    this.downloadInfo,
    this.startLoggingUrlHost,
    this.webviewEvoke,
    this.packageName,
    this.backupUnit,
    this.adType,
    this.showAdMark,
    this.images,
    this.layout,
    this.title,
    this.deeplinkInfo,
    this.creativeId,
    this.impressionType,
    this.sellType,
    this.monitorUrls,
    this.adId,
    this.adOwner,
    this.thirdSdkAppId,
    this.thirdSdkPosId,
    this.desc,
    this.clickTrackUrls,
    this.uri,
    this.videoInfo,
  });

  String unitName;
  dynamic downloadInfo;
  String startLoggingUrlHost;
  List<dynamic> webviewEvoke;
  String packageName;
  dynamic backupUnit;
  String adType;
  bool showAdMark;
  List<dynamic> images;
  int layout;
  String title;
  dynamic deeplinkInfo;
  Uid creativeId;
  int impressionType;
  String sellType;
  List<dynamic> monitorUrls;
  Uid adId;
  AdOwner adOwner;
  String thirdSdkAppId;
  String thirdSdkPosId;
  String desc;
  List<dynamic> clickTrackUrls;
  String uri;
  dynamic videoInfo;

  factory AdInfo.fromJson(Map<String, dynamic> json) => AdInfo(
    unitName: json["unit_name"],
    downloadInfo: json["download_info"],
    startLoggingUrlHost: json["start_logging_url_host"],
    webviewEvoke: List<dynamic>.from(json["webview_evoke"].map((x) => x)),
    packageName: json["package_name"],
    backupUnit: json["backup_unit"],
    adType: json["ad_type"],
    showAdMark: json["show_ad_mark"],
    images: List<dynamic>.from(json["images"].map((x) => x)),
    layout: json["layout"],
    title: json["title"],
    deeplinkInfo: json["deeplink_info"],
    creativeId: uidValues.map[json["creative_id"]],
    impressionType: json["impression_type"],
    sellType: json["sell_type"],
    monitorUrls: List<dynamic>.from(json["monitor_urls"].map((x) => x)),
    adId: uidValues.map[json["ad_id"]],
    adOwner: AdOwner.fromJson(json["ad_owner"]),
    thirdSdkAppId: json["third_sdk_app_id"],
    thirdSdkPosId: json["third_sdk_pos_id"],
    desc: json["desc"],
    clickTrackUrls: List<dynamic>.from(json["click_track_urls"].map((x) => x)),
    uri: json["uri"],
    videoInfo: json["video_info"],
  );

  Map<String, dynamic> toJson() => {
    "unit_name": unitName,
    "download_info": downloadInfo,
    "start_logging_url_host": startLoggingUrlHost,
    "webview_evoke": List<dynamic>.from(webviewEvoke.map((x) => x)),
    "package_name": packageName,
    "backup_unit": backupUnit,
    "ad_type": adType,
    "show_ad_mark": showAdMark,
    "images": List<dynamic>.from(images.map((x) => x)),
    "layout": layout,
    "title": title,
    "deeplink_info": deeplinkInfo,
    "creative_id": uidValues.reverse[creativeId],
    "impression_type": impressionType,
    "sell_type": sellType,
    "monitor_urls": List<dynamic>.from(monitorUrls.map((x) => x)),
    "ad_id": uidValues.reverse[adId],
    "ad_owner": adOwner.toJson(),
    "third_sdk_app_id": thirdSdkAppId,
    "third_sdk_pos_id": thirdSdkPosId,
    "desc": desc,
    "click_track_urls": List<dynamic>.from(clickTrackUrls.map((x) => x)),
    "uri": uri,
    "video_info": videoInfo,
  };
}

enum Uid { EMPTY, THE_50_A69_D0_F32377_A19_E1_C9_B867_D868861_A, THE_3110_C175_DE068_DB99_C8008_A6_FD1_D485_F }

final uidValues = EnumValues({
  "": Uid.EMPTY,
  "3110c175de068db99c8008a6fd1d485f": Uid.THE_3110_C175_DE068_DB99_C8008_A6_FD1_D485_F,
  "50a69d0f32377a19e1c9b867d868861a": Uid.THE_50_A69_D0_F32377_A19_E1_C9_B867_D868861_A
});

class AdOwner {
  AdOwner({
    this.avatar,
    this.name,
  });

  String avatar;
  String name;

  factory AdOwner.fromJson(Map<String, dynamic> json) => AdOwner(
    avatar: json["avatar"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "avatar": avatar,
    "name": name,
  };
}

class Content {
  Content({
    this.photosCount,
    this.title,
    this.url,
    this.contentAbstract,
    this.author,
    this.uri,
    this.photos,
    this.videoInfo,
    this.type,
    this.id,
    this.card,
    this.status,
  });

  int photosCount;
  String title;
  String url;
  String contentAbstract;
  Author author;
  String uri;
  List<Photo> photos;
  dynamic videoInfo;
  ArticleType type;
  String id;
  dynamic card;
  Status status;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    photosCount: json["photos_count"] == null ? null : json["photos_count"],
    title: json["title"] == null ? null : json["title"],
    url: json["url"] == null ? null : json["url"],
    contentAbstract: json["abstract"] == null ? null : json["abstract"],
    author: json["author"] == null ? null : Author.fromJson(json["author"]),
    uri: json["uri"] == null ? null : json["uri"],
    photos: json["photos"] == null ? null : List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
    videoInfo: json["video_info"],
    type: json["type"] == null ? null : contentTypeValues.map[json["type"]],
    id: json["id"] == null ? null : json["id"],
    card: json["card"],
    status: json["status"] == null ? null : Status.fromJson(json["status"]),
  );

  Map<String, dynamic> toJson() => {
    "photos_count": photosCount == null ? null : photosCount,
    "title": title == null ? null : title,
    "url": url == null ? null : url,
    "abstract": contentAbstract == null ? null : contentAbstract,
    "author": author == null ? null : author.toJson(),
    "uri": uri == null ? null : uri,
    "photos": photos == null ? null : List<dynamic>.from(photos.map((x) => x.toJson())),
    "video_info": videoInfo,
    "type": type == null ? null : contentTypeValues.reverse[type],
    "id": id == null ? null : id,
    "card": card,
    "status": status == null ? null : status.toJson(),
  };
}

class Author {
  Author({
    this.loc,
    this.kind,
    this.name,
    this.url,
    this.gender,
    this.authorAbstract,
    this.uri,
    this.avatar,
    this.type,
    this.id,
    this.uid,
    this.verifyType,
    this.regTime,
  });

  Loc loc;
  KindEnum kind;
  String name;
  String url;
  String gender;
  String authorAbstract;
  String uri;
  String avatar;
  KindEnum type;
  String id;
  String uid;
  int verifyType;
  DateTime regTime;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    loc: json["loc"] == null ? null : Loc.fromJson(json["loc"]),
    kind: kindEnumValues.map[json["kind"]],
    name: json["name"],
    url: json["url"],
    gender: json["gender"] == null ? null : json["gender"],
    authorAbstract: json["abstract"] == null ? null : json["abstract"],
    uri: json["uri"],
    avatar: json["avatar"],
    type: kindEnumValues.map[json["type"]],
    id: json["id"],
    uid: json["uid"],
    verifyType: json["verify_type"] == null ? null : json["verify_type"],
    regTime: json["reg_time"] == null ? null : DateTime.parse(json["reg_time"]),
  );

  Map<String, dynamic> toJson() => {
    "loc": loc == null ? null : loc.toJson(),
    "kind": kindEnumValues.reverse[kind],
    "name": name,
    "url": url,
    "gender": gender == null ? null : gender,
    "abstract": authorAbstract == null ? null : authorAbstract,
    "uri": uri,
    "avatar": avatar,
    "type": kindEnumValues.reverse[type],
    "id": id,
    "uid": uid,
    "verify_type": verifyType == null ? null : verifyType,
    "reg_time": regTime == null ? null : regTime.toIso8601String(),
  };
}

enum KindEnum { USER, GROUP }

final kindEnumValues = EnumValues({
  "group": KindEnum.GROUP,
  "user": KindEnum.USER
});

class Loc {
  Loc({
    this.id,
    this.name,
    this.uid,
  });

  String id;
  String name;
  String uid;

  factory Loc.fromJson(Map<String, dynamic> json) => Loc(
    id: json["id"],
    name: json["name"],
    uid: json["uid"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "uid": uid,
  };
}

class Photo {
  Photo({
    this.image,
    this.uri,
  });

  PhotoImage image;
  String uri;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    image: PhotoImage.fromJson(json["image"]),
    uri: json["uri"],
  );

  Map<String, dynamic> toJson() => {
    "image": image.toJson(),
    "uri": uri,
  };
}

class PhotoImage {
  PhotoImage({
    this.large,
    this.small,
    this.isAnimated,
    this.normal,
  });

  Large large;
  Large small;
  bool isAnimated;
  Large normal;

  factory PhotoImage.fromJson(Map<String, dynamic> json) => PhotoImage(
    large: Large.fromJson(json["large"]),
    small: Large.fromJson(json["small"]),
    isAnimated: json["is_animated"],
    normal: Large.fromJson(json["normal"]),
  );

  Map<String, dynamic> toJson() => {
    "large": large.toJson(),
    "small": small.toJson(),
    "is_animated": isAnimated,
    "normal": normal.toJson(),
  };
}

class Large {
  Large({
    this.url,
    this.width,
    this.height,
    this.size,
  });

  String url;
  int width;
  int height;
  int size;

  factory Large.fromJson(Map<String, dynamic> json) => Large(
    url: json["url"],
    width: json["width"],
    height: json["height"],
    size: json["size"] == null ? null : json["size"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "width": width,
    "height": height,
    "size": size == null ? null : size,
  };
}

class Status {
  Status({
    this.liked,
    this.text,
    this.screenshotTitle,
    this.noticeInfo,
    this.screenshotUrl,
    this.isSubscription,
    this.images,
    this.resharesCount,
    this.screenshotType,
    this.id,
    this.censorInfo,
    this.author,
    this.subscriptionText,
    this.miniProgramCoverUrl,
    this.entities,
    this.createTime,
    this.canTransferReplyLimit,
    this.resharedStatus,
    this.forbidReshareAndComment,
    this.reactionType,
    this.activity,
    this.resharersCount,
    this.reshareId,
    this.isPrivate,
    this.sharingUrl,
    this.card,
    this.topic,
    this.wechatTimelineShare,
    this.replyLimit,
    this.likeCount,
    this.uri,
    this.miniProgramPage,
    this.parentStatus,
    this.videoInfo,
    this.reactionsCount,
    this.commentsCount,
    this.miniProgramName,
    this.isStatusAd,
    this.canTransferAccessible,
    this.hasRelatedContents,
  });

  bool liked;
  String text;
  String screenshotTitle;
  dynamic noticeInfo;
  String screenshotUrl;
  bool isSubscription;
  List<ImageElement> images;
  int resharesCount;
  String screenshotType;
  String id;
  dynamic censorInfo;
  Author author;
  String subscriptionText;
  String miniProgramCoverUrl;
  List<dynamic> entities;
  DateTime createTime;
  bool canTransferReplyLimit;
  dynamic resharedStatus;
  bool forbidReshareAndComment;
  int reactionType;
  String activity;
  int resharersCount;
  String reshareId;
  bool isPrivate;
  String sharingUrl;
  dynamic card;
  StatusTopic topic;
  String wechatTimelineShare;
  String replyLimit;
  int likeCount;
  String uri;
  String miniProgramPage;
  dynamic parentStatus;
  VideoInfo videoInfo;
  int reactionsCount;
  int commentsCount;
  String miniProgramName;
  bool isStatusAd;
  bool canTransferAccessible;
  bool hasRelatedContents;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    liked: json["liked"],
    text: json["text"],
    screenshotTitle: json["screenshot_title"],
    noticeInfo: json["notice_info"],
    screenshotUrl: json["screenshot_url"],
    isSubscription: json["is_subscription"],
    images: List<ImageElement>.from(json["images"].map((x) => ImageElement.fromJson(x))),
    resharesCount: json["reshares_count"],
    screenshotType: json["screenshot_type"],
    id: json["id"],
    censorInfo: json["censor_info"],
    author: Author.fromJson(json["author"]),
    subscriptionText: json["subscription_text"],
    miniProgramCoverUrl: json["mini_program_cover_url"],
    entities: List<dynamic>.from(json["entities"].map((x) => x)),
    createTime: DateTime.parse(json["create_time"]),
    canTransferReplyLimit: json["can_transfer_reply_limit"],
    resharedStatus: json["reshared_status"],
    forbidReshareAndComment: json["forbid_reshare_and_comment"],
    reactionType: json["reaction_type"],
    activity: json["activity"],
    resharersCount: json["resharers_count"],
    reshareId: json["reshare_id"],
    isPrivate: json["is_private"],
    sharingUrl: json["sharing_url"],
    card: json["card"],
    topic: StatusTopic.fromJson(json["topic"]),
    wechatTimelineShare: json["wechat_timeline_share"],
    replyLimit: json["reply_limit"],
    likeCount: json["like_count"],
    uri: json["uri"],
    miniProgramPage: json["mini_program_page"],
    parentStatus: json["parent_status"],
    videoInfo: json["video_info"] == null ? null : VideoInfo.fromJson(json["video_info"]),
    reactionsCount: json["reactions_count"],
    commentsCount: json["comments_count"],
    miniProgramName: json["mini_program_name"],
    isStatusAd: json["is_status_ad"],
    canTransferAccessible: json["can_transfer_accessible"],
    hasRelatedContents: json["has_related_contents"] == null ? null : json["has_related_contents"],
  );

  Map<String, dynamic> toJson() => {
    "liked": liked,
    "text": text,
    "screenshot_title": screenshotTitle,
    "notice_info": noticeInfo,
    "screenshot_url": screenshotUrl,
    "is_subscription": isSubscription,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "reshares_count": resharesCount,
    "screenshot_type": screenshotType,
    "id": id,
    "censor_info": censorInfo,
    "author": author.toJson(),
    "subscription_text": subscriptionText,
    "mini_program_cover_url": miniProgramCoverUrl,
    "entities": List<dynamic>.from(entities.map((x) => x)),
    "create_time": createTime.toIso8601String(),
    "can_transfer_reply_limit": canTransferReplyLimit,
    "reshared_status": resharedStatus,
    "forbid_reshare_and_comment": forbidReshareAndComment,
    "reaction_type": reactionType,
    "activity": activity,
    "resharers_count": resharersCount,
    "reshare_id": reshareId,
    "is_private": isPrivate,
    "sharing_url": sharingUrl,
    "card": card,
    "topic": topic.toJson(),
    "wechat_timeline_share": wechatTimelineShare,
    "reply_limit": replyLimit,
    "like_count": likeCount,
    "uri": uri,
    "mini_program_page": miniProgramPage,
    "parent_status": parentStatus,
    "video_info": videoInfo == null ? null : videoInfo.toJson(),
    "reactions_count": reactionsCount,
    "comments_count": commentsCount,
    "mini_program_name": miniProgramName,
    "is_status_ad": isStatusAd,
    "can_transfer_accessible": canTransferAccessible,
    "has_related_contents": hasRelatedContents == null ? null : hasRelatedContents,
  };
}

class ImageElement {
  ImageElement({
    this.large,
    this.raw,
    this.isAnimated,
    this.normal,
  });

  Large large;
  dynamic raw;
  bool isAnimated;
  Large normal;

  factory ImageElement.fromJson(Map<String, dynamic> json) => ImageElement(
    large: Large.fromJson(json["large"]),
    raw: json["raw"],
    isAnimated: json["is_animated"],
    normal: Large.fromJson(json["normal"]),
  );

  Map<String, dynamic> toJson() => {
    "large": large.toJson(),
    "raw": raw,
    "is_animated": isAnimated,
    "normal": normal.toJson(),
  };
}

class StatusTopic {
  StatusTopic({
    this.topicLabelBgColor,
    this.topicLabelBgImg,
    this.name,
    this.title,
    this.url,
    this.clickTrackUrls,
    this.tailIcon,
    this.uri,
    this.subheading,
    this.id,
    this.topicIcon,
    this.topicLabelHashtagColor,
    this.contentType,
    this.type,
    this.cardSubtitle,
    this.adMonitorUrls,
    this.topicIconLarge,
    this.topicLabelTextColor,
    this.isAd,
    this.sharingUrl,
  });

  String topicLabelBgColor;
  String topicLabelBgImg;
  String name;
  String title;
  String url;
  List<dynamic> clickTrackUrls;
  TailIcon tailIcon;
  String uri;
  String subheading;
  String id;
  String topicIcon;
  String topicLabelHashtagColor;
  int contentType;
  String type;
  String cardSubtitle;
  List<dynamic> adMonitorUrls;
  String topicIconLarge;
  String topicLabelTextColor;
  bool isAd;
  String sharingUrl;

  factory StatusTopic.fromJson(Map<String, dynamic> json) => StatusTopic(
    topicLabelBgColor: json["topic_label_bg_color"],
    topicLabelBgImg: json["topic_label_bg_img"],
    name: json["name"],
    title: json["title"],
    url: json["url"],
    clickTrackUrls: List<dynamic>.from(json["click_track_urls"].map((x) => x)),
    tailIcon: TailIcon.fromJson(json["tail_icon"]),
    uri: json["uri"],
    subheading: json["subheading"],
    id: json["id"],
    topicIcon: json["topic_icon"],
    topicLabelHashtagColor: json["topic_label_hashtag_color"],
    contentType: json["content_type"],
    type: json["type"],
    cardSubtitle: json["card_subtitle"],
    adMonitorUrls: List<dynamic>.from(json["ad_monitor_urls"].map((x) => x)),
    topicIconLarge: json["topic_icon_large"],
    topicLabelTextColor: json["topic_label_text_color"],
    isAd: json["is_ad"],
    sharingUrl: json["sharing_url"],
  );

  Map<String, dynamic> toJson() => {
    "topic_label_bg_color": topicLabelBgColor,
    "topic_label_bg_img": topicLabelBgImg,
    "name": name,
    "title": title,
    "url": url,
    "click_track_urls": List<dynamic>.from(clickTrackUrls.map((x) => x)),
    "tail_icon": tailIcon.toJson(),
    "uri": uri,
    "subheading": subheading,
    "id": id,
    "topic_icon": topicIcon,
    "topic_label_hashtag_color": topicLabelHashtagColor,
    "content_type": contentType,
    "type": type,
    "card_subtitle": cardSubtitle,
    "ad_monitor_urls": List<dynamic>.from(adMonitorUrls.map((x) => x)),
    "topic_icon_large": topicIconLarge,
    "topic_label_text_color": topicLabelTextColor,
    "is_ad": isAd,
    "sharing_url": sharingUrl,
  };
}

class TailIcon {
  TailIcon();

  factory TailIcon.fromJson(Map<String, dynamic> json) => TailIcon(
  );

  Map<String, dynamic> toJson() => {
  };
}

class VideoInfo {
  VideoInfo({
    this.playStatus,
    this.description,
    this.videoUrl,
    this.url,
    this.videoWatermarkUrl,
    this.uri,
    this.coverUrl,
    this.previewUrl,
    this.playCount,
    this.videoHeight,
    this.label,
    this.alertText,
    this.fileSize,
    this.duration,
    this.videoWidth,
    this.id,
  });

  int playStatus;
  String description;
  String videoUrl;
  String url;
  String videoWatermarkUrl;
  String uri;
  String coverUrl;
  String previewUrl;
  int playCount;
  int videoHeight;
  String label;
  String alertText;
  int fileSize;
  String duration;
  int videoWidth;
  String id;

  factory VideoInfo.fromJson(Map<String, dynamic> json) => VideoInfo(
    playStatus: json["play_status"],
    description: json["description"],
    videoUrl: json["video_url"],
    url: json["url"],
    videoWatermarkUrl: json["video_watermark_url"],
    uri: json["uri"],
    coverUrl: json["cover_url"],
    previewUrl: json["preview_url"],
    playCount: json["play_count"],
    videoHeight: json["video_height"],
    label: json["label"],
    alertText: json["alert_text"],
    fileSize: json["file_size"],
    duration: json["duration"],
    videoWidth: json["video_width"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "play_status": playStatus,
    "description": description,
    "video_url": videoUrl,
    "url": url,
    "video_watermark_url": videoWatermarkUrl,
    "uri": uri,
    "cover_url": coverUrl,
    "preview_url": previewUrl,
    "play_count": playCount,
    "video_height": videoHeight,
    "label": label,
    "alert_text": alertText,
    "file_size": fileSize,
    "duration": duration,
    "video_width": videoWidth,
    "id": id,
  };
}

enum ArticleType { EMPTY, STATUS, NOTE, TOPIC }

final contentTypeValues = EnumValues({
  "": ArticleType.EMPTY,
  "status": ArticleType.STATUS,
  "note": ArticleType.NOTE,
  "topic": ArticleType.TOPIC,
});

class Owner {
  Owner({
    this.eventLabel,
    this.isRectAvatar,
    this.url,
    this.verifyType,
    this.uri,
    this.avatar,
    this.type,
    this.id,
    this.name,
  });

  String eventLabel;
  bool isRectAvatar;
  String url;
  int verifyType;
  String uri;
  String avatar;
  KindEnum type;
  String id;
  String name;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    eventLabel: json["event_label"],
    isRectAvatar: json["is_rect_avatar"],
    url: json["url"],
    verifyType: json["verify_type"],
    uri: json["uri"],
    avatar: json["avatar"],
    type: kindEnumValues.map[json["type"]],
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "event_label": eventLabel,
    "is_rect_avatar": isRectAvatar,
    "url": url,
    "verify_type": verifyType,
    "uri": uri,
    "avatar": avatar,
    "type": kindEnumValues.reverse[type],
    "id": id,
    "name": name,
  };
}

class RecInfo {
  RecInfo({
    this.source,
    this.appEventSupplementaryInfo,
    this.tags,
  });

  String source;
  AppEventSupplementaryInfo appEventSupplementaryInfo;
  List<Tag> tags;

  factory RecInfo.fromJson(Map<String, dynamic> json) => RecInfo(
    source: json["source"],
    appEventSupplementaryInfo: AppEventSupplementaryInfo.fromJson(json["app_event_supplementary_info"]),
    tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "source": source,
    "app_event_supplementary_info": appEventSupplementaryInfo.toJson(),
    "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
  };
}

class AppEventSupplementaryInfo {
  AppEventSupplementaryInfo({
    this.reqId,
    this.algStrategy,
    this.keyword,
  });

  String reqId;
  String algStrategy;
  String keyword;

  factory AppEventSupplementaryInfo.fromJson(Map<String, dynamic> json) => AppEventSupplementaryInfo(
    reqId: json["req_id"],
    algStrategy: json["alg_strategy"],
    keyword: json["keyword"],
  );

  Map<String, dynamic> toJson() => {
    "req_id": reqId,
    "alg_strategy": algStrategy,
    "keyword": keyword,
  };
}

class Tag {
  Tag({
    this.type,
    this.id,
    this.title,
  });

  TagType type;
  String id;
  String title;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
    type: tagTypeValues.map[json["type"]],
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "type": tagTypeValues.reverse[type],
    "id": id,
    "title": title,
  };
}

enum TagType { CHANNEL }

final tagTypeValues = EnumValues({
  "channel": TagType.CHANNEL
});

class ItemTopic {
  ItemTopic({
    this.topicLabelBgColor,
    this.topicLabelBgImg,
    this.name,
    this.topicIconLarge,
    this.url,
    this.uri,
    this.topicIcon,
    this.topicLabelHashtagColor,
    this.topicLabelTextColor,
    this.type,
    this.id,
  });

  String topicLabelBgColor;
  String topicLabelBgImg;
  String name;
  String topicIconLarge;
  String url;
  String uri;
  String topicIcon;
  String topicLabelHashtagColor;
  String topicLabelTextColor;
  String type;
  String id;

  factory ItemTopic.fromJson(Map<String, dynamic> json) => ItemTopic(
    topicLabelBgColor: json["topic_label_bg_color"],
    topicLabelBgImg: json["topic_label_bg_img"],
    name: json["name"],
    topicIconLarge: json["topic_icon_large"],
    url: json["url"],
    uri: json["uri"],
    topicIcon: json["topic_icon"],
    topicLabelHashtagColor: json["topic_label_hashtag_color"],
    topicLabelTextColor: json["topic_label_text_color"],
    type: json["type"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "topic_label_bg_color": topicLabelBgColor,
    "topic_label_bg_img": topicLabelBgImg,
    "name": name,
    "topic_icon_large": topicIconLarge,
    "url": url,
    "uri": uri,
    "topic_icon": topicIcon,
    "topic_label_hashtag_color": topicLabelHashtagColor,
    "topic_label_text_color": topicLabelTextColor,
    "type": type,
    "id": id,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
