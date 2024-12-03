import 'package:intl/intl.dart';

String getCurrentDate() {
  final now = DateTime.now();
  return DateFormat('EEEE MMM d, y', 'es_ES')
      .format(now)
      .split(' ')
      .map((word) => word[0].toUpperCase() + word.substring(1))
      .join(' ');
}

String formatDate(DateTime date) {
  final now = DateTime.now();
  final maniana = now.add(const Duration(days: 1));

  if (DateFormat('yMd').format(date) == DateFormat('yMd').format(now)) {
    return "Hoy, ${DateFormat('d MMM, y', 'es_ES').format(date)}";
  } else if (DateFormat('yMd').format(date) ==
      DateFormat('yMd').format(maniana)) {
    return "Mañana, ${DateFormat('d MMM, y', 'es_ES').format(date)}";
  } else {
    return DateFormat('EEEE MMM d, y', 'es_ES')
        .format(date)
        .split(' ')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }
}
