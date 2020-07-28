part of 'home_recommend.dart';

class RecommendFeedItemModel {
  ArticleType articleType;
  String avatarUrl;
  String authorName;
  ItemTopic topic;
  Content content;
  List<String> photos;

  RecommendFeedItemModel.name(
    this.avatarUrl,
    this.authorName,
    this.articleType,
    this.topic,
    this.content,
    this.photos,
  );
}

class RecommendFeedItem extends StatefulWidget {
  RecommendFeedItem(this.item);

  final RecommendFeedItemModel item;

  @override
  State<StatefulWidget> createState() {
    return _RecommendFeedItemState(item);
  }
}

class _RecommendFeedItemState extends State<RecommendFeedItem> {
  final RecommendFeedItemModel item;

  _RecommendFeedItemState(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _headerItem(item),
          _topicItem(item),
          _bodyItem(item),
          _imagesItem(item),
        ],
      ),
    );
  }

  /// header 部分
  Widget _headerItem(RecommendFeedItemModel item) {
    final widgets = List<Widget>();

    if (item.avatarUrl != null) {
      var radius = 0;
      switch (item.articleType) {
        case ArticleType.EMPTY:
        case ArticleType.TOPIC:
          radius = 4;
          break;
        case ArticleType.NOTE:
        case ArticleType.STATUS:
          radius = 16;
          break;
      }
      // 作者头像
      widgets.add(
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(radius.toDouble())),
          child: Image.network(
            item.avatarUrl,
            width: 24,
            height: 24,
          ),
        ),
      );
    }
    // 作者名字
    widgets.add(
      Expanded(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Text(
            item.authorName,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
    );

    // '更多'按钮
    widgets.add(
      Align(
        alignment: Alignment.centerRight,
        child: Icon(
          Icons.more_horiz,
          color: Theme.of(context).backgroundColor,
        ),
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: widgets,
    );
  }

  /// topic 部分
  Widget _topicItem(RecommendFeedItemModel item) {
    if (item.topic == null) {
      return Container();
    }
    return Container(
      padding: EdgeInsets.all(4),
      margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Color(int.parse(item.topic.topicLabelBgColor.replaceAll('#', ''), radix: 16)).withOpacity(1.0)),
      child: Text(
        item.topic.name,
        style: Theme.of(context).textTheme.bodyText1.copyWith(
            color: Color(int.parse(item.topic.topicLabelTextColor.replaceAll('#', ''), radix: 16)).withOpacity(1.0)),
      ),
    );
  }

  /// body 部分
  Widget _bodyItem(RecommendFeedItemModel item) {
    final content = item.content;
    if (content == null) {
      return Container();
    }
    // 标题
    TextSpan titleSpan;
    if (content.title != null) {
      titleSpan = TextSpan(
          text: content.title,
          style: Theme.of(context).textTheme.bodyText2.copyWith(fontWeight: FontWeight.bold),
          children: <InlineSpan>[TextSpan(text: "  ")]);
    }
    // 正文
    TextSpan abstractSpan;
    if (content.contentAbstract != null) {
      abstractSpan = TextSpan(
        text: content.contentAbstract,
        style: Theme.of(context).textTheme.bodyText2,
      );
    }
    final spans = [titleSpan, abstractSpan].where((element) => element != null).toList();
    final richText = RichText(
      maxLines: 5,
      overflow: TextOverflow.clip,
      text: TextSpan(
        children: spans,
      ),
    );
    return Container(
      margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
      child: richText,
    );
  }

  /// 图片
  Widget _imagesItem(RecommendFeedItemModel item) {
    final images = List<Widget>();
    for (var url in item.photos) {
      final widget = Container(
        margin: EdgeInsets.fromLTRB(0, 0, 4, 4),
        color: Theme.of(context).backgroundColor,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          child: Image.network(
            url,
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
      );
      images.add(widget);
    }
    return Wrap(
      children: images,
      crossAxisAlignment: WrapCrossAlignment.start,
    );
  }
}
