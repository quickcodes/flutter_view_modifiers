// padding_margin.dart

import 'package:flutter/material.dart';

/// Padding Extensions
///
/// Extensions to add padding and margin to a widget.
extension WidgetPadding on Widget {
  /// Applies padding to all sides or specific directions.
  ///
  /// [all] Padding for all sides.
  /// [vertical] Vertical padding (top and bottom).
  /// [horizontal] Horizontal padding (left and right).
  Padding padding(
      {double all = 0.0, double vertical = 0.0, double horizontal = 0.0}) {
    if (all != 0.0) {
      return Padding(padding: EdgeInsets.all(all), child: this);
    } else if (vertical != 0.0 || horizontal != 0.0) {
      return Padding(
        padding:
            EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
        child: this,
      );
    }
    return Padding(padding: EdgeInsets.zero, child: this);
  }

  /// Applies padding to specific sides (top, right, bottom, left).
  ///
  /// [top] Padding for the top side.
  /// [right] Padding for the right side.
  /// [bottom] Padding for the bottom side.
  /// [left] Padding for the left side.
  Padding paddingOnly(
      {double top = 0, double right = 0, double bottom = 0, double left = 0}) {
    return Padding(
      padding:
          EdgeInsets.only(top: top, right: right, bottom: bottom, left: left),
      child: this,
    );
  }
}

/// Margin Extensions
///
/// Extensions to add margin to a widget.
extension WidgetMargin on Widget {
  /// Applies margin to all sides or specific directions.
  ///
  /// [all] Margin for all sides.
  /// [vertical] Vertical margin (top and bottom).
  /// [horizontal] Horizontal margin (left and right).
  Container margin(
      {double all = 0.0, double vertical = 0.0, double horizontal = 0.0}) {
    if (all != 0.0) {
      return Container(
        margin: EdgeInsets.all(all),
        child: this,
      );
    } else if (vertical != 0.0 || horizontal != 0.0) {
      return Container(
        margin:
            EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
        child: this,
      );
    }
    return Container(
      margin: EdgeInsets.zero,
      child: this,
    );
  }
}
