import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class HeaderFooterListView<T> extends StatefulWidget {
  List<Widget> headerList;
  List<Widget> footerList;

  List<T> data;

  IndexedWidgetBuilder itemBuilder;
  IndexedWidgetBuilder separatorBuilder;

  ScrollPhysics physics;
  bool shrinkWrap = false;
  EdgeInsetsGeometry padding;
  ScrollController controller;
  Axis scrollDirection = Axis.vertical;

  HeaderFooterListView({
    Key key,
    @required List<T> data,
    @required IndexedWidgetBuilder itemBuilder,
    IndexedWidgetBuilder separatorBuilder,
    List<Widget> headerList,
    List<Widget> footerList,
    ScrollPhysics physics,
    bool shrinkWrap = false,
    EdgeInsetsGeometry padding,
    ScrollController controller,
    Axis scrollDirection = Axis.vertical,
  }) {
    if (data == null) {
      throw Exception('data cannot be null!');
    }
    this.data = data;
    this.itemBuilder = itemBuilder;
    this.separatorBuilder = separatorBuilder;
    this.headerList = headerList;
    this.footerList = footerList;
    this.physics = physics;
    this.shrinkWrap = shrinkWrap;
    this.padding = padding;
    this.controller = controller;
    this.scrollDirection = scrollDirection;
  }

  @override
  State<HeaderFooterListView> createState() {
    return HeaderFooterListViewState<T>();
  }
}

class HeaderFooterListViewState<T> extends State<HeaderFooterListView> {
  bool hasHeader = false;
  bool hasFooter = false;

  List<T> dataWrapper = List<T>();

  bool _isLast(int index) {
    if (hasFooter) {
      return dataWrapper.length - 2 == index;
    }
    return dataWrapper.length - 1 == index;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(HeaderFooterListView oldWidget) {
    super.didUpdateWidget(oldWidget);
    hasHeader = widget.headerList?.isNotEmpty ?? false;
    hasFooter = widget.footerList?.isNotEmpty ?? false;
    dataWrapper.clear();
    dataWrapper.addAll(widget.data as List<T>);

    if (hasHeader) {
      // 添加header占位
      dataWrapper.insert(0, null);
    }
    if (hasFooter) {
      // 添加footer占位
      dataWrapper.add(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        if (dataWrapper[index] == null) {
          return SizedBox();
        }
        if (index > 0 && hasHeader) {
          // 减去header的占位
          index --;
        }
        return widget.itemBuilder.call(context, index);
      },
      // 分割线builder
      separatorBuilder: (context, index) {
        if (index == 0 && hasHeader) {
          // 判断横向还是纵向滑动
          if (widget.scrollDirection == Axis.horizontal) {
            return Row(
              children: widget.headerList,
            );
          } else {
            return Column(
              children: widget.headerList,
            );
          }
        }
        if (_isLast(index) && hasFooter) {
          // 判断横向还是纵向滑动
          if (widget.scrollDirection == Axis.horizontal) {
            return Row(
              children: widget.footerList,
            );
          } else {
            return Column(
              children: widget.footerList,
            );
          }
        }
        return widget.separatorBuilder.call(context, index);
      },
      itemCount: dataWrapper.length,
      physics: widget.physics,
      shrinkWrap: widget.shrinkWrap,
      padding: widget.padding,
      controller: widget.controller,
      scrollDirection: widget.scrollDirection,
    );
  }
}
