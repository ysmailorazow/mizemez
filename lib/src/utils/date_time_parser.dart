class DateTimeParser {
  static String parseDate(DateTime date, String symbol) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year;
    return "$day$symbol$month$symbol$year";
  }

  static String parseTime(DateTime date, String symbol) {
    final hour = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');
    return "$hour$symbol$minute";
  }
}
