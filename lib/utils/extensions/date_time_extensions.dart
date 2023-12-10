// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart' as formatter;

const String defaultDateFormat = "dd.MM.yyyy";
const String shortTimeFormat = "h:mm a";
const String shortDateTimeFormat = "dd.MM.yyyy HH:mm";

extension DateTimeExtensions on DateTime {
  bool isInSameDay(DateTime other) {
    return day == other.day && month == other.month && year == other.year;
  }

// visualBasic ToShortTimeString
  String toShortTimeString() {
    return formatter.DateFormat(shortTimeFormat).format(this);
  }

  String toShortDateString() {
    return formatter.DateFormat(defaultDateFormat).format(this);
  }

  String toShortDateTimeString() {
    return formatter.DateFormat(shortDateTimeFormat).format(this);
  }

  String formatToShortDateString() {
    return this == null ? " - " : formatter.DateFormat("dd MMMM EE", "tr-TR").format(this);
  }

  String toGreeting() {
    return hour < 10
        ? "Günaydın"
        : hour < 17
            ? "İyi Günler"
            : "İyi Akşamlar";
  }

  DateTime getOnlyDate() {
    if (this == null) {
      return this;
    }
    return DateTime(year, month, day);
  }

  DateTime getFirstDayOfMonth() {
    if (this == null) {
      return this;
    }
    return DateTime(year, month, 1);
  }

  DateTime addMonth(int month) {
    if (this == null) {
      return this;
    }
    return DateTime(year, this.month + month, day);
  }
}
