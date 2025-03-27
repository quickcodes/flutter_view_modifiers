// gesture_handlers.dart

import 'package:flutter/material.dart';
import 'package:flutter_view_modifiers/view_modifiers/helpers/bounce.dart';

/// Gesture Handlers (Tap, Long Press, etc.)
///
/// Extensions for adding gesture handlers to widgets.
extension WidgetGestureHandler on Widget {
  /// Adds a tap handler to the widget.
  ///
  /// [onTap] The callback function to execute when the widget is tapped.
  GestureDetector onTap(VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: this,
    );
  }

  /// Adds a ripple effect on tap (InkWell).
  ///
  /// [onTap] The callback function to execute when the widget is tapped.
  /// [borderRadius] The border radius for the ripple effect.
  InkWell onTapRipple({VoidCallback? onTap, BorderRadius? borderRadius}) {
    return InkWell(
      onTap: onTap,
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: this,
    );
  }

  /// Adds a long press gesture handler to the widget.
  ///
  /// [onLongPress] The callback function to execute on long press.
  GestureDetector onLongPress(VoidCallback onLongPress) {
    return GestureDetector(
      onLongPress: onLongPress,
      child: this,
    );
  }

  /// Adds a pan update gesture handler to the widget.
  ///
  /// [onPanUpdate] The callback function to execute on pan updates.
  GestureDetector onPanUpdate({required Function(DragUpdateDetails) onPanUpdate}) {
    return GestureDetector(
      onPanUpdate: onPanUpdate,
      child: this,
    );
  }


  /// Adds a bounceable effect when tapped.
  ///
  /// [onTap] The callback function to execute when the widget is tapped.
  /// [onTapUp] The callback function to execute when tap is released.
  /// [onTapDown] The callback function to execute when tap is initiated.
  /// [onTapCancel] The callback function to execute when tap is cancelled.
  /// [onLongPress] The callback function to execute on long press.
  /// [duration] The duration of the scaling animation when tapped.
  /// [reverseDuration] The reverse duration of the scaling animation when released.
  /// [curve] The animation curve.
  /// [reverseCurve] The reverse animation curve.
  /// [scaleFactor] The scale factor of the child widget.
  Widget onTapBounce({
    required VoidCallback onTap,
    void Function(TapUpDetails)? onTapUp,
    void Function(TapDownDetails)? onTapDown,
    VoidCallback? onTapCancel,
    VoidCallback? onLongPress,
    Duration duration = const Duration(milliseconds: 200),
    Duration reverseDuration = const Duration(milliseconds: 200),
    Curve curve = Curves.decelerate,
    Curve reverseCurve = Curves.decelerate,
    double scaleFactor = 0.8,
  }) {
    return Bounceable(
      onTap: onTap,
      onTapUp: onTapUp,
      onTapDown: onTapDown,
      onTapCancel: onTapCancel,
      onLongPress: onLongPress,
      duration: duration,
      reverseDuration: reverseDuration,
      curve: curve,
      reverseCurve: reverseCurve,
      scaleFactor: scaleFactor,
      child: this,
    );
  }
}
