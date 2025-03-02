// layout.dart

import 'package:flutter/material.dart';

/// Layout Extensions
///
/// Extensions for custom layout widgets like aspect ratio and alignment.
extension WidgetAspectRatio on Widget {
  /// Applies an aspect ratio to the widget.
  ///
  /// [ratio] The aspect ratio (width / height).
  Widget aspectRatio(double ratio) {
    return AspectRatio(aspectRatio: ratio, child: this);
  }

  /// Aligns the widget using a specific alignment.
  ///
  /// [alignment] The alignment to use for the widget.
  Widget align({AlignmentGeometry alignment = Alignment.center}) {
    return Align(
      alignment: alignment,
      child: this,
    );
  }
}

extension WidgetCenter on Widget {
  /// Centers the widget in its parent.
  Widget center() {
    return Center(child: this);
  }
}



/// Extension on List of Widgets to add separators.
extension WidgetListExtension on List<Widget> {
  /// Inserts a separator widget between each item in the list.
  ///
  /// [separator] The widget to be used as a separator.
  List<Widget> separator(Widget separator) {
    if (isEmpty) return [];
    return expand((widget) => [widget, separator]).toList()..removeLast();
  }
}


/// Extension to easily apply Flexible and Expanded widgets.
extension FlexibleExpandedExtension on Widget {
  /// Wraps the widget with Flexible.
  Widget flexible({int flex = 1}) {
    return Flexible(flex: flex, child: this);
  }

  /// Wraps the widget with Expanded.
  Widget expanded({int flex = 1}) {
    return Expanded(flex: flex, child: this);
  }
}

/// Extension to wrap a widget into a SizedBox with width, height, or both.
extension SizedBoxExtension on Widget {
  /// Wraps the widget in a SizedBox with specified [width] and/or [height].
  Widget withSize({double? width, double? height}) {
    return SizedBox(width: width, height: height, child: this);
  }
}