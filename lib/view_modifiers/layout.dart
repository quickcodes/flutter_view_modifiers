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



// Extension on double for SizedBox with width
extension SizedBoxWidth on double {
  Widget width() {
    return SizedBox(width: this);
  }
}

// Extension on double for SizedBox with height
extension SizedBoxHeight on double {
  Widget height() {
    return SizedBox(height: this);
  }
}

// Extension on double for SizedBox with width and height
extension SizedBoxSize on double {
  Widget size() {
    return SizedBox(width: this, height: this);
  }
}