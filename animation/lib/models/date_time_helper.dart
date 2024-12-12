String coverDateTimeintoString(DateTime dateTime) {
  // ignore: unused_local_variabl

  String year = dateTime.year.toString();

  // ignore: unused_local_variable
  String month = dateTime.month.toString();

  if (month.length == 1) {
    // ignore: prefer_interpolation_to_compose_strings
    month = '0$month';
  }
  // ignore: unused_local_variable
  String day = dateTime.day.toString();
  if (day.length == 1) {
    day = '0$day';
  }

  // ignore: unused_local_variable
  String yyyymmdd = year + month + day;

  return yyyymmdd;
}
