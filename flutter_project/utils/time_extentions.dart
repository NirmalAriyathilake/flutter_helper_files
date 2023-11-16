import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String toDate() {
    return DateFormat('dd/MM/yyyy').format(this);
  }

  String toTime() {
    return DateFormat("hh:mm a").format(this);
  }

  String toDateTime() {
    return DateFormat("hh:mm a dd/MM/yyyy").format(this);
  }

  DateTime copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  }) {
    return DateTime(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }

  DateTime changeDate(DateTime newDate) {
    return copyWith(
      year: newDate.year,
      month: newDate.month,
      day: newDate.day,
    );
  }

  DateTime changeTime(DateTime newDate) {
    return copyWith(
      hour: newDate.hour,
      minute: newDate.minute,
      second: newDate.second,
      millisecond: newDate.millisecond,
      microsecond: newDate.microsecond,
    );
  }

  String toTimestamp() {
    final now = DateTime.now();

    if (year != now.year) {
      return DateFormat.yMMMMd().format(this);
    }

    if (day != now.day) {
      return DateFormat.MMMd().format(this);
    }

    return DateFormat.jm().format(this);
  }
}

extension DurationX on Duration {
  String format() {
    String twoDigits(int n) => n.toString().padLeft(2, "0");

    final hourDigits = twoDigits(inHours);
    final minutesDigits = twoDigits(inMinutes.remainder(60));
    final secondsDigits = twoDigits(inSeconds.remainder(60));
    return "$hourDigits : $minutesDigits : $secondsDigits";
  }
}
