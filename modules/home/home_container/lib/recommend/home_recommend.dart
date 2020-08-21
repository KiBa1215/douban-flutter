library homere_commend;

import 'dart:async';

import 'package:base_module/base_module.dart';
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

class _HomeRecommendState extends State<HomeRecommendView>
    with WidgetsBindingObserver
    implements HomeRecommendContract {
  HomeRecommendPresenter presenter;

  var refreshing = false;
  var loadingMore = false;

  RefreshIndicator _refreshIndicator;
  GlobalKey<RefreshIndicatorState> refreshIndicatorStateKey = GlobalKey<RefreshIndicatorState>();

  List<RecommendFeedItemModel> _recommendFeedItemModels = List<RecommendFeedItemModel>();

  HeaderFooterListView body() {
    final _controller = ScrollController();
    final listView = HeaderFooterListView(
      data: _recommendFeedItemModels,
      itemBuilder: (context, index) {
        final model = _recommendFeedItemModels[index] ?? null;
        if (model != null) {
          return RecommendFeedItemWidget(model);
        }
        return SizedBox();
      },
      separatorBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
        );
      },
      controller: _controller,
      footerList: loadingMore ? [Loading()] : null,
    );

    // 滑动到整个页面的0.9处，加载更多
    _controller.addListener(() {
      if (loadingMore) {
        return;
      }
      final offset = _controller.offset;
      if (offset > _controller.position.maxScrollExtent * 0.9) {
        loadMore();
      }
    });
    return listView;
  }

  @override
  Widget build(BuildContext context) {
    // 下拉刷新
    _refreshIndicator = RefreshIndicator(
        key: refreshIndicatorStateKey,
        color: Theme.of(context).accentColor,
        displacement: 40,
        onRefresh: () {
          return refreshData();
        },
        // 展示列表
        child: body());

    return _refreshIndicator;
  }

  @override
  void didUpdateWidget(HomeRecommendView oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
    // build 完成后
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // 显示loading，加载数据
      refreshIndicatorStateKey.currentState?.show();
    });
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    presenter.clear();
  }

  Future<void> refreshData() async {
    if (refreshing) {
      return Future.value();
    }
    if (presenter == null) {
      presenter = HomeRecommendPresenter(this);
    }
    setState(() {
      refreshing = true;
    });
    // 获取feed数据
    return presenter.refresh();
  }

  Future<void> loadMore() async {
    if (loadingMore) {
      return Future.value();
    }
    if (presenter == null) {
      presenter = HomeRecommendPresenter(this);
    }
    setState(() {
      loadingMore = true;
    });
    // 获取feed数据
    return presenter.loadMoreRecommendFeedItems();
  }

  @override
  Future<void> onHomeRecommendDataReceived(List<RecommendFeedItemModel> items, String msg) async {
    // Toast
    Fluttertoast.showToast(
        msg: msg,
        backgroundColor: Theme.of(context).accentColor,
        textColor: Colors.white,
        gravity: ToastGravity.TOP);
    setState(() {
      refreshing = false;
      loadingMore = false;
      _recommendFeedItemModels = items;
    });
  }

  @override
  void onHomeRecommendError(ApiError error) {
    print(error.msg);
    Fluttertoast.showToast(
        msg: error.msg, backgroundColor: Colors.redAccent, toastLength: Toast.LENGTH_LONG);
    setState(() {
      refreshing = false;
      loadingMore = false;
    });
  }

  @override
  void onLoadMoreHomeRecommendData(List<RecommendFeedItemModel> items, String msg) {
    setState(() {
      refreshing = false;
      loadingMore = false;
      _recommendFeedItemModels.addAll(items);
    });
  }
}
