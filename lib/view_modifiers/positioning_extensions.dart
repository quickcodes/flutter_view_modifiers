// positioning.dart

import 'package:flutter/material.dart';

/// Positioned Extension
///
/// This extension allows you to position a widget inside a `Stack`.
extension WidgetPositioned on Widget {
  /// Positions a widget inside a `Stack` with optional width and height constraints.
  ///
  /// [top], [bottom], [left], [right] - The positioning properties for the widget.
  /// [width], [height] - Optional width and height constraints for the widget.
  Positioned positioned({
    double? top,
    double? bottom,
    double? left,
    double? right,
    double? width,
    double? height,
  }) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      width: width,
      height: height,
      child: this,
    );
  }
}
