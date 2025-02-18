// gesture_handlers.dart

import 'package:flutter/material.dart';

/// Gesture Handlers (Tap, Long Press, etc.)
///
/// Extensions for adding gesture handlers to widgets.
extension WidgetGestureHandler on Widget {
  /// Adds a tap handler to the widget.
  ///
  /// [onTap] The callback function to execute when the widget is tapped.
  Widget onTap(VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: this,
    );
  }

  /// Adds a ripple effect on tap (InkWell).
  ///
  /// [onTap] The callback function to execute when the widget is tapped.
  /// [borderRadius] The border radius for the ripple effect.
  Widget onTapRipple({VoidCallback? onTap, BorderRadius? borderRadius}) {
    return InkWell(
      onTap: onTap,
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: this,
    );
  }

  /// Adds a long press gesture handler to the widget.
  ///
  /// [onLongPress] The callback function to execute on long press.
  Widget onLongPress(VoidCallback onLongPress) {
    return GestureDetector(
      onLongPress: onLongPress,
      child: this,
    );
  }

  /// Adds a pan update gesture handler to the widget.
  ///
  /// [onPanUpdate] The callback function to execute on pan updates.
  Widget onPanUpdate({required Function(DragUpdateDetails) onPanUpdate}) {
    return GestureDetector(
      onPanUpdate: onPanUpdate,
      child: this,
    );
  }
}
