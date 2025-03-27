import 'dart:convert';

extension StringExtensions on String {
  /// Check if string is null, empty or only whitespace
  bool get isNullOrEmpty => trim().isEmpty;

  /// Check if string is not empty (for convenience)
  bool get isNotEmptyOrNull => !isNullOrEmpty;

  /// Capitalize first letter
  String get capitalize =>
      isNullOrEmpty ? this : this[0].toUpperCase() + substring(1);

  /// Capitalize all words
  String get titleCase => split(' ').map((word) => word.capitalize).join(' ');

  /// Convert snake_case or kebab-case to camelCase
  String get toCamelCase =>
      split(RegExp(r'[_-]')).map((e) => e.capitalize).join('');

  /// Reverse the string
  String get reversed => split('').reversed.join();

  /// Convert to int (returns null if not a valid number)
  int? toIntOrNull() => int.tryParse(this);

  /// Convert to double (returns null if not a valid number)
  double? toDoubleOrNull() => double.tryParse(this);

  /// Safe int parsing with fallback
  int toInt({int fallback = 0}) => int.tryParse(this) ?? fallback;

  /// Safe double parsing with fallback
  double toDouble({double fallback = 0.0}) => double.tryParse(this) ?? fallback;

  /// Check if string is numeric
  bool get isNumeric => double.tryParse(this) != null;

  /// Check if string is a valid email
  bool get isValidEmail =>
      RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(this);

  /// Check if string is a valid URL
  bool get isValidUrl => Uri.tryParse(this)?.hasAbsolutePath ?? false;

  /// Encode string to base64
  String get toBase64 => base64Encode(utf8.encode(this));

  /// Decode base64 string (if valid)
  String? get fromBase64 {
    try {
      return utf8.decode(base64Decode(this));
    } catch (_) {
      return null; // Not valid base64
    }
  }

  /// Remove all spaces
  String get removeSpaces => replaceAll(' ', '');

  /// Count how many times a substring occurs
  int countOccurrences(String substring) => split(substring).length - 1;

  /// Extract only digits (handy for phone numbers)
  String get digitsOnly => replaceAll(RegExp(r'\D'), '');

  /// Limit string length (adds "..." if too long)
  String ellipsize(int maxLength) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}...';
  }

  /// Safe substring (won't throw if string is too short)
  String safeSubstring(int start, [int? end]) {
    if (start >= length) return '';
    return substring(start, end?.clamp(0, length) ?? length);
  }

  /// Add a prefix if missing
  String withPrefix(String prefix) =>
      startsWith(prefix) ? this : '$prefix$this';

  /// Add a suffix if missing
  String withSuffix(String suffix) => endsWith(suffix) ? this : '$this$suffix';

  /// Surround string with quotes (or custom characters)
  String surround({String left = '"', String right = '"'}) =>
      '$left$this$right';

  /// Safe compare ignoring case
  bool equalsIgnoreCase(String other) => toLowerCase() == other.toLowerCase();
}
