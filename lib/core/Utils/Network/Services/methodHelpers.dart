String convertMetersToKilometers(double meters, String km, String meter) {
  int kilometers = (meters / 1000).floor();
  int remainingMeters = (meters % 1000).round();

  if (kilometers > 0) {
    return '$kilometers $km  $remainingMeters $meter';
  } else {
    return '$remainingMeters $meter';
  }
}

String convertToTimeString(String timeString, String hour, String mins) {
  RegExp regExp = RegExp(r'(?:(\d+)\s*hours?\s*)?(?:(\d+)\s*mins?)?');
  var match = regExp.firstMatch(timeString);

  int hours = match?.group(1) != null ? int.parse(match!.group(1)!) : 0;
  int minutes = match?.group(2) != null ? int.parse(match!.group(2)!) : 0;

  if (hours > 0) {
    return '$hours $hour $minutes $mins';
  } else {
    return '$minutes $mins';
  }
}
