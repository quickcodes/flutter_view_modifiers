// visibility_opacity.dart

import 'package:flutter/material.dart';

/// Visibility and Opacity Extensions
///
/// Extensions to manage visibility and opacity of a widget.
extension WidgetVisibility on Widget {
  /// Toggles the visibility of the widget.
  ///
  /// [visible] If true, the widget is visible; if false, it is hidden.
  Widget visibility({bool visible = true}) {
    return Visibility(
      visible: visible,
      child: this,
    );
  }
}

extension OpacityRange on Widget {
  /// Changes the opacity of the widget.
  ///
  /// [opacity] The opacity level (0.0 to 1.0).
  Widget withOpacity([double opacity = 1.0]) {
    return Opacity(opacity: opacity, child: this);
  }
}
