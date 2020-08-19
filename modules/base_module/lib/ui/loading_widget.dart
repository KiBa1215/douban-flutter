import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Loading extends StatelessWidget {
  Color _backgroundColor;
  Color _indicatorColor;

  Loading({Color backgroundColor, Color indicatorColor}) {
    _backgroundColor = backgroundColor;
    _indicatorColor = indicatorColor;
  }

  @override
  Widget build(BuildContext context) {
    if (_backgroundColor == null) {
      _backgroundColor = Colors.transparent;
    }
    if (_indicatorColor == null) {
      final theme = Theme.of(context);
      if (theme != null) {
        _indicatorColor = theme.accentColor;
      } else {
        _indicatorColor = Colors.black;
      }
    }

    return Container(
      margin: EdgeInsets.fromLTRB(0, 16, 0, 32),
      alignment: Alignment.center,
      child: Container(
        width: 24,
        height: 24,
        child: CircularProgressIndicator(
          strokeWidth: 4,
          backgroundColor: _backgroundColor,
        ),
      ),
    );
  }
}
