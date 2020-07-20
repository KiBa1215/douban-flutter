library home_module;

import 'package:flutter/material.dart';
import 'package:home_module/recommend/home_recommend.dart';

export 'package:home_module/home_container.dart';

class HomeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _buildChildren(),
      ),
    );
  }

  List<Widget> _buildChildren() {
    final children = List<Widget>();
    children.add(Expanded(child: HomeRecommendView()));
    return children;
  }
}
