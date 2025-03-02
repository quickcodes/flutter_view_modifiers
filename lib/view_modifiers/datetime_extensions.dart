import 'package:intl/intl.dart'; // For date formatting (optional)

extension DateTimeExtensions on DateTime {
  /// Today with no time (only date part)
  static DateTime get today => DateTime.now().startOfDay;

  /// Now as DateTime (alias for DateTime.now())
  static DateTime get now => DateTime.now();

  /// Yesterday's date
  static DateTime get yesterday => DateTime.now().subtract(const Duration(days: 1));

  /// Tomorrow's date
  static DateTime get tomorrow => DateTime.now().add(const Duration(days: 1));

  /// Start of current day (00:00:00)
  DateTime get startOfDay => DateTime(year, month, day);

  /// End of current day (23:59:59.999)
  DateTime get endOfDay => DateTime(year, month, day, 23, 59, 59, 999);

  /// Start of month (first day)
  DateTime get startOfMonth => DateTime(year, month, 1);

  /// End of month (last day)
  DateTime get endOfMonth => DateTime(year, month + 1, 0).endOfDay;

  /// Add days easily
  DateTime addDays(int days) => add(Duration(days: days));

  /// Subtract days easily
  DateTime subtractDays(int days) => subtract(Duration(days: days));

  /// Add hours
  DateTime addHours(int hours) => add(Duration(hours: hours));

  /// Subtract hours
  DateTime subtractHours(int hours) => subtract(Duration(hours: hours));

  /// Difference from another date in days
  int differenceInDays(DateTime other) => difference(other).inDays.abs();

  /// Difference from another date in hours
  int differenceInHours(DateTime other) => difference(other).inHours.abs();

  /// Is this date today?
  bool get isToday => isSameDate(DateTime.now());

  /// Is this date yesterday?
  bool get isYesterday => isSameDate(DateTime.now().subtract(const Duration(days: 1)));

  /// Is this date tomorrow?
  bool get isTomorrow => isSameDate(DateTime.now().add(const Duration(days: 1)));

  /// Is the date the same as another date (ignores time)
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  /// Is this a weekend? (Saturday or Sunday)
  bool get isWeekend => weekday == DateTime.saturday || weekday == DateTime.sunday;

  /// Is this a weekday (Mon-Fri)?
  bool get isWeekday => !isWeekend;

  /// Format using intl (e.g., 'yyyy-MM-dd' or 'dd/MM/yyyy')
  String format(String pattern) => DateFormat(pattern).format(this);

  /// Returns 'Just now', 'X minutes ago', 'Yesterday', etc.
  String get relativeTime {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inSeconds < 60) return 'Just now';
    if (difference.inMinutes < 60) return '${difference.inMinutes} minutes ago';
    if (isToday) return 'Today';
    if (isYesterday) return 'Yesterday';
    return format('dd MMM, yyyy');
  }

  /// Convert to ISO string with milliseconds (more precision)
  String get toIso8601WithMilliseconds => toIso8601String();

  /// Start of week (assuming week starts on Monday)
  DateTime get startOfWeek => subtract(Duration(days: weekday - 1));

  /// End of week (assuming week ends on Sunday)
  DateTime get endOfWeek => add(Duration(days: 7 - weekday)).endOfDay;
}
