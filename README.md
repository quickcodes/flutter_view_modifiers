# Flutter View Modifiers Package

[![Pub][pub_badge]][pub]

### Swift way of Writing Flutter code

`flutter_view_modifiers` is a Flutter package that provides a set of convenient extension methods
to modify the appearance and behavior of widgets in a more readable and fluent way. It allows you
to chain various modifiers on widgets such as padding, decoration, styling, animations, and more.

## Getting started

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  ...
  flutter_view_modifiers:
```

In your library add the following import:

```dart
import 'package:flutter_view_modifiers/flutter_view_modifiers.dart';
```

## Example Usage

Below are chunks of code demonstrating the usage of `flutter_view_modifiers` package:

### Example 1: Text Widget with Multiple Modifiers

```dart
const Text("Hello, Flutter!")
    .textStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      letterSpacing: 2.0,
      decoration: TextDecoration.underline,
    )
    .padding(all: 10)
    .decorate(
      color: Colors.blue,
      borderRadius: 20,
      boxShadow: [
        const BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(2, 2)),
      ],
    )
    .center(),
```

### Example 2: Container with Padding, Decoration, and Animation

```dart
const Text("This is a container")
    .padding(all: 20)
    .decorate(
      color: Colors.green.withOpacity(0.7),
      borderRadius: 12,
      borderColor: Colors.black,
      borderWidth: 2,
      boxShadow: [
        const BoxShadow(color: Colors.grey, blurRadius: 10, offset: Offset(2, 2)),
      ],
    )
    .offset(x: -15, y: 0)
    .margin(all: 20)
    .scale(1.2)
    .animatedOpacity(opacity: widgetOpacity),
```

### Example 3: Button with Tap Gesture and Modifiers

```dart
const Text("Press Me")
    .textStyle(color: Colors.white, fontWeight: FontWeight.bold)
    .padding(vertical: 10, horizontal: 20)
    .decorate(color: Colors.red)
    .onTap(() {
      setState(() {
        widgetOpacity = widgetOpacity == 0.0 ? 1.0 : 0.0;
      });
    })
    .rotate(0.2),
```

## Available Modifiers

The package offers several useful modifiers that can be chained together:

### **1. Visibility and Opacity Modifiers** (Beginner)

These extensions allow you to modify the visibility and opacity of any widget.

- `visibility`: Toggles the visibility of a widget.
- `withOpacity`: Adjusts the opacity of a widget directly.
- `animatedOpacity`: Changes the opacity of a widget with an animation.

**Example Usage:**

```dart
widget.visibility(visible: false);  // Hide the widget
widget.withOpacity(0.5);  // Set opacity to 50%
widget.animatedOpacity(opacity: 0.3, duration: Duration(seconds: 1));  // Fade to 30% opacity with animation
```

### **2. Padding & Margin Modifiers** (Beginner)

Adds padding and margin to widgets for better layout control.

- `padding`: Adds padding around the widget.
- `paddingOnly`: Adds padding to specific sides.
- `margin`: Adds margin around the widget.

**Example Usage:**

```dart
widget.padding(all: 16);  // Apply padding to all sides
widget.paddingOnly(top: 10, left: 20);  // Padding for specific sides
widget.margin(horizontal: 20, vertical: 10);  // Apply margin
```

### **3. Layout Modifiers** (Beginner)

These extensions help in controlling the layout of a widget.

- `aspectRatio`: Applies a specific aspect ratio to a widget.
- `align`: Aligns a widget based on a given alignment.
- `center`: Centers a widget within its parent.

**Example Usage:**

```dart
widget.aspectRatio(16 / 9);  // Apply aspect ratio 16:9
widget.align(alignment: Alignment.topLeft);  // Align to top-left
widget.center();  // Center the widget
```

### **4. Gesture Handlers** (Intermediate)

Add gesture recognition to widgets like tap, long press, and pan.

- `onTap`: Adds a tap gesture handler to the widget.
- `onTapRipple`: Adds a ripple effect (InkWell) on tap.
- `onLongPress`: Handles long press gestures.
- `onPanUpdate`: Handles pan (drag) gestures.

**Example Usage:**

```dart
widget.onTap(() => print('Tapped!'));  // Handle tap gesture
widget.onTapRipple(onTap: () => print('Tapped with Ripple'));  // Ripple on tap
```

### **5. Decoration Modifiers** (Intermediate)

These extensions allow you to customize the appearance of widgets with various decorations.

- `decorate`: Apply a background color, border, shadow, padding, and gradient to a widget.

**Example Usage:**

```dart
widget.decorate(
  color: Colors.red, 
  borderRadius: 10, 
  boxShadow: [BoxShadow(color: Colors.black, blurRadius: 8)],
);  // Add decorations
```

### **6. Text Styling Modifiers** (Intermediate)

Apply custom text styles to any widget with text content.

- `textStyle`: Apply font size, weight, color, decoration, and spacing to text.

**Example Usage:**

```dart
widget.textStyle(
  fontSize: 20, 
  fontWeight: FontWeight.bold, 
  color: Colors.white,
);  // Custom text styling
```

### **7. Positioning Modifiers** (Intermediate)

These extensions allow precise positioning of widgets within a `Stack`.

- `positioned`: Allows positioning a widget inside a `Stack` with optional width and height constraints.

**Example Usage:**

```dart
widget.positioned(
  top: 20, 
  left: 10, 
  width: 100, 
  height: 50,
);  // Position inside Stack
```

### **8. Transformation Modifiers** (Advanced)

These extensions allow transformations such as rotating, scaling, and translating a widget.

- `rotate`: Rotate a widget by a specified angle.
- `scale`: Scale a widget by a factor.
- `offset`: Move (translate) a widget along the x and y axes.
- `clipShape`: Clip the widget into a specific shape (default is an oval).

**Example Usage:**

```dart
widget.rotate(0.5);  // Rotate by 0.5 radians
widget.scale(1.2);  // Scale by 1.2
widget.offset(x: 10, y: 20);  // Move the widget
widget.clipShape();  // Clip the widget into a circle
```

### **9. Animation Modifiers** (Advanced)

These extensions provide simple and flexible animations to widgets.

- `animatedContainer`: Adds an animated container effect with customizable duration, color, and decoration.
- `animatedCrossFade`: Applies an animated crossfade between two widgets.

**Example Usage:**

```dart
widget.animatedContainer(
  duration: Duration(seconds: 1), 
  color: Colors.blue,
);  // Animated Container

widget.animatedCrossFade(
  firstChild: firstWidget, 
  secondChild: secondWidget, 
  duration: Duration(seconds: 2),
);  // Crossfade between two widgets
```

### **10. Overlay and Background Modifiers** (Advanced)

Add overlays or background elements to widgets for more complex layouts.

- `overlay`: Add an overlay widget on top of the current widget.
- `background`: Add a background widget behind the current widget.

**Example Usage:**

```dart
widget.overlay(
  overlayWidget: Icon(Icons.star),
);  // Add an overlay
widget.background(
  backgroundWidget: Container(color: Colors.red),
);  // Add a background
```

## Conclusion

`flutter_view_modifiers` allows for a more intuitive and expressive way to style and manipulate widgets.
With the flexibility of method chaining and a wide range of built-in modifiers, you can efficiently build
beautiful, interactive UIs in Flutter.



<!--Links-->
[pub_badge]: https://img.shields.io/pub/v/local_hero.svg
[pub]: https://pub.dev/packages/flutter_view_modifiers
[changelog]: https://github.com/quickcodes/flutter_view_modifiers/blob/main/CHANGELOG.md
