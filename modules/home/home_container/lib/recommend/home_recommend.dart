library homere_commend;

import 'dart:async';

import 'package:base_module/base_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part 'recommend_list_item.dart';

part 'presenter/home_presenter.dart';

part 'view/home_recommend_interface.dart';

part 'mapper/home_recommend_mapper.dart';

class HomeRecommendView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeRecommendState();
  }
}

class _HomeRecommendState extends State<HomeRecommendView> implements HomeRecommendContract {
  HomeRecommendPresenter presenter;
  var triggerLoad = true;
  int start = 0;
  int count = 40;

  List<RecommendFeedItem> recommendFeedItems = List<RecommendFeedItem>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        itemBuilder: (context, index) => recommendFeedItems[index],
        separatorBuilder: (context, index) => Container(
          margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
        ),
        itemCount: recommendFeedItems.length,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    presenter = HomeRecommendPresenter(this);
  }

  @override
  void dispose() {
    super.dispose();
    presenter.clear();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    // 获取feed数据
    await presenter.getRecommendFeedItemsData(start, count);
  }

  List<RecommendFeedItem> _buildRecommendFeedItem(List<RecommendFeedItemModel> items) {
    final itemWidgets = List<RecommendFeedItem>();
    for (var item in items) {
      itemWidgets.add(RecommendFeedItem(item));
    }
    return itemWidgets;
  }

  @override
  Future<void> onHomeRecommendDataReceived(List<RecommendFeedItemModel> items) async {
    final widgets = await Future.microtask(() => _buildRecommendFeedItem(items));
    setState(() {
      recommendFeedItems = widgets;
    });
  }

  @override
  void onHomeRecommendError(ApiError error) {
    print(error.msg);
  }
}
