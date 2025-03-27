// general_decorations.dart

import 'package:flutter/material.dart';

/// General Decoration Extension
///
/// A widget extension that adds decoration capabilities to any widget.
extension WidgetDecoration on Widget {
  /// Applies decoration such as color, border, shadow, padding, etc., to the widget.
  ///
  /// [color] The background color for the widget.
  /// [borderWidth] The width of the border.
  /// [borderColor] The color of the border.
  /// [borderRadius] The radius of the border's corners.
  /// [boxShadow] The list of box shadows to be applied.
  /// [padding] Padding to be applied to the widget.
  /// [clipBehavior] How the widget's content should be clipped (default is `Clip.antiAlias`).
  /// [gradient] Gradient to be applied to the background.
  DecoratedBox decorate({
    Color? color,
    double? borderWidth,
    Color? borderColor,
    double? borderRadius,
    List<BoxShadow>? boxShadow,
    EdgeInsetsGeometry? padding,
    Clip clipBehavior = Clip.antiAlias,
    Gradient? gradient,
  }) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: gradient,
        color: color,
        border: borderWidth != null && borderColor != null
            ? Border.all(color: borderColor, width: borderWidth)
            : null,
        borderRadius:
            borderRadius != null ? BorderRadius.circular(borderRadius) : null,
        boxShadow: boxShadow,
      ),
      child: ClipRRect(
        borderRadius: borderRadius != null
            ? BorderRadius.circular(borderRadius)
            : BorderRadius.zero,
        clipBehavior: clipBehavior,
        child: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: this,
        ),
      ),
    );
  }
}

/// Text Extensions
///
/// Adds text styling functionality to any widget.
extension WidgetTextStyle on Widget {
  /// Applies a text style to the widget.
  ///
  /// [style] The style to apply to the text.
  /// [fontSize], [fontWeight], [color], [decoration], [letterSpacing], [wordSpacing] - Various text properties.
  Widget textStyle({
    TextStyle? style,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    TextDecoration? decoration,
    double? letterSpacing,
    double? wordSpacing,
  }) {
    return DefaultTextStyle.merge(
      style: style ??
          TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            decoration: decoration,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
          ),
      child: this,
    );
  }
}
