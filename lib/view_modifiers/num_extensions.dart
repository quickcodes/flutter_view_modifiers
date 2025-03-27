

// Extension on double for SizedBox with width
import 'package:flutter/material.dart';
import 'dart:async';

extension DurationExtensions on num {
  // Easy way to make Durations
  Duration get milliseconds => Duration(milliseconds: (this * 1).round());
  Duration get seconds => Duration(seconds: (this * 1).round());
  Duration get minutes => Duration(minutes: (this * 1).round());
  Duration get hours => Duration(hours: (this * 1).round());
  Duration get days => Duration(days: (this * 1).round());

  // Delay using Future
  Future<void> delay([VoidCallback? callback]) async {
    await Future.delayed(Duration(milliseconds: (this * 1000).toInt()));
    callback?.call();
  }
}

extension DurationHelpers on Duration {
  
  /// Converts this Duration to milliseconds (already exists in core, but for chaining clarity)
  int get inMilliseconds => this.inMilliseconds;

  /// Converts this Duration to seconds (already exists in core, but for chaining clarity)
  int get inSeconds => this.inSeconds;

  /// Converts this Duration to minutes
  int get inMinutes => this.inMinutes;

  /// Converts this Duration to hours
  int get inHours => this.inHours;

  /// Converts this Duration to days
  int get inDays => this.inDays;

  /// Divide this duration into smaller chunks of given [chunkSize]
  /// Example: 5.seconds.chunked(1.seconds) => [1s, 1s, 1s, 1s, 1s]
  List<Duration> chunked(Duration chunkSize) {
    int count = (this.inMilliseconds / chunkSize.inMilliseconds).floor();
    return List.generate(count, (_) => chunkSize);
  }

  /// Returns a human-readable string, e.g., "2h 30m 15s"
  String get readable {
    if (inMilliseconds == 0) return '0s';
    final parts = <String>[];
    if (inDays > 0) parts.add('${inDays}d');
    if (inHours.remainder(24) > 0) parts.add('${inHours.remainder(24)}h');
    if (inMinutes.remainder(60) > 0) parts.add('${inMinutes.remainder(60)}m');
    if (inSeconds.remainder(60) > 0) parts.add('${inSeconds.remainder(60)}s');
    if (inMilliseconds.remainder(1000) > 0) parts.add('${inMilliseconds.remainder(1000)}ms');
    return parts.join(' ');
  }

  /// Add two durations together (handy for chaining)
  Duration operator +(Duration other) => this + other;

  /// Subtract two durations (also handy for chaining)
  Duration operator -(Duration other) => this - other;

  /// Compare two durations
  bool isShorterThan(Duration other) => this < other;
  bool isLongerThan(Duration other) => this > other;
  bool isEqualTo(Duration other) => this == other;

  /// Delay for this duration (inline usage like: `2.seconds.sleep()`)
  Future<void> sleep() => Future.delayed(this);

  /// Throttle mechanism — runs the callback only if enough time has passed since the last call
  static Timer? _throttleTimer;
  void throttle(VoidCallback action) {
    _throttleTimer?.cancel();
    _throttleTimer = Timer(this, action);
  }

  /// Debounce mechanism — resets the timer if called again before the duration ends
  static Timer? _debounceTimer;
  void debounce(VoidCallback action) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(this, action);
  }

  /// Check if this duration is zero
  bool get isZero => this == Duration.zero;

  /// Check if this duration is negative
  bool get isNegative => inMilliseconds < 0;
}



extension IntComparisonExtensions on num {
  bool isLowerThan(num other) => this < other;
  bool isGreaterThan(num other) => this > other;
  bool isEqual(num other) => this == other;
}

extension SizedBoxExtensions on num {
  // Box shortcuts
  SizedBox widthBox() => SizedBox(width: toDouble());
  SizedBox heightBox() => SizedBox(height: toDouble());
  SizedBox sizeBox() => SizedBox(width: toDouble(), height: toDouble());
}

