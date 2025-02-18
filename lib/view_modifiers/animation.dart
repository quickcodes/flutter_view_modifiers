// animation.dart

import 'package:flutter/material.dart';

/// Animation Extensions
///
/// Extensions to easily add animations to widgets.

extension WidgetAnimatedContainer on Widget {
  /// Adds an animated container effect to a widget.
  ///
  /// [duration] Duration of the animation.
  /// [color] Color to animate to.
  /// [decoration] Decoration to animate.
  Widget animatedContainer({
    required Duration duration,
    Color? color,
    BoxDecoration? decoration,
  }) {
    return AnimatedContainer(
      duration: duration,
      color: color,
      decoration: decoration,
      child: this,
    );
  }
}

extension WidgetAnimatedCrossFade on Widget {
  /// Adds an animated crossfade effect between two widgets.
  ///
  /// [firstChild] The first widget to fade in.
  /// [secondChild] The second widget to fade in.
  /// [duration] The duration of the crossfade animation.
  Widget animatedCrossFade({
    required Widget firstChild,
    required Widget secondChild,
    required Duration duration,
  }) {
    return AnimatedCrossFade(
      firstChild: firstChild,
      secondChild: secondChild,
      duration: duration,
      firstCurve: Curves.easeIn,
      secondCurve: Curves.easeIn,
      crossFadeState: firstChild == this ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}
