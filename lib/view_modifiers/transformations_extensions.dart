// transformations.dart

import 'package:flutter/material.dart';

/// Transformations Extensions
///
/// Extensions for transforming the widget (rotation, scaling).
extension WidgetRotation on Widget {
  /// Rotates the widget by a specified angle.
  ///
  /// [angle] The angle in radians to rotate the widget.
  Transform rotate(double angle) {
    return Transform.rotate(angle: angle, child: this);
  }
}

/// Offset Extension
///
/// This extension allows changing the offset (translation) of any widget
/// by specifying separate X and Y coordinates.
extension WidgetOffset on Widget {
  /// Translates (moves) the widget by the given [x] and [y] coordinates.
  ///
  /// [x] The translation along the X-axis.
  /// [y] The translation along the Y-axis.
  Transform offset({double x = 0.0, double y = 0.0}) {
    return Transform.translate(
      offset: Offset(x, y), // Apply translation along both axes
      child: this,
    );
  }
}


extension WidgetScale on Widget {
  /// Scales the widget by a specified factor.
  ///
  /// [scale] The scaling factor.
  Transform scale(double scale) {
    return Transform.scale(scale: scale, child: this);
  }
}

extension WidgetClipShape on Widget {
  /// Clips the widget into a shape (default is oval).
  ///
  /// [clipBehavior] The behavior to handle clipping.
  ClipOval clipShape({Clip clipBehavior = Clip.antiAlias}) {
    return ClipOval(
      clipBehavior: clipBehavior,
      child: this,
    );
  }
}



// Animated Opacity Extension
extension WidgetAnimatedOpacity on Widget {
  /// Changes the opacity of Widget with Animation (default opacity:1.0, duration:Duration(milliseconds: 300)).
  ///
  /// [opacity] The Opacity to handle opacity.
  /// [duration] The duration of animation
  AnimatedOpacity animatedOpacity({double opacity = 1.0, Duration duration = const Duration(milliseconds: 300)}) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: duration,
      child: this,
    );
  }


  Opacity opacity([double opacity = 1.0]) {
    /// Changes the opacity of Widget (default opacity:1.0).
    ///
    /// [opacity] The Opacity to handle opacity.
    return Opacity(opacity: opacity, child: this);
  }
}

// overlay and background
/// Overlay Extension
///
/// This extension adds an overlay widget on top of the current widget.
extension WidgetOverlay on Widget {
  /// Adds an overlay widget on top of the current widget.
  ///
  /// [overlayWidget] The widget that will appear on top of the current widget.
  /// [alignment] Optional parameter to specify the alignment of the overlay widget within the stack.
  /// [fit] Optional parameter to specify how the overlay widget should fit inside the stack.
  /// [clipBehavior] Optional parameter to specify how the stack clips its children.
  Stack overlay({
    required Widget overlayWidget,
    AlignmentGeometry alignment = Alignment.center,
    StackFit fit = StackFit.loose,
    Clip clipBehavior = Clip.none,
  }) {
    return Stack(
      alignment: alignment,
      fit: fit,
      clipBehavior: clipBehavior,
      children: [
        this,
        overlayWidget,
      ],
    );
  }
}

/// Background Extension
///
/// This extension adds a background widget behind the current widget.
extension WidgetBackground on Widget {
  /// Adds a background to the widget.
  ///
  /// [backgroundWidget] The widget that will be placed in the background.
  /// [alignment] Optional parameter to specify the alignment of the background widget within the stack.
  /// [fit] Optional parameter to specify how the background widget should fit inside the stack.
  /// [clipBehavior] Optional parameter to specify how the stack clips its children.
  Stack background({
    required Widget backgroundWidget,
    AlignmentGeometry alignment = Alignment.center,
    StackFit fit = StackFit.loose,
    Clip clipBehavior = Clip.none,
  }) {
    return Stack(
      alignment: alignment,
      fit: fit,
      clipBehavior: clipBehavior,
      children: [
        backgroundWidget,
        this,
      ],
    );
  }
}