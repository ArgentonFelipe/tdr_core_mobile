class DurationFormatter {
  static String prettyDuration(Duration duration) {
    final components = <String>[];

    final days = duration.inDays;
    if (days != 0) {
      components.add('$days dia ');
    }
    final hours = duration.inHours % 24;
    if (hours != 0) {
      components.add('$hours horas ');
    }
    final minutes = duration.inMinutes % 60;
    if (minutes != 0) {
      components.add('$minutes minutos ');
    }

    final seconds = duration.inSeconds % 60;
    final centiseconds = (duration.inMilliseconds % 1000) ~/ 10;
    if (components.isEmpty || seconds != 0 || centiseconds != 0) {
      components.add('$seconds');

      components.add(' segundos');
    }
    return components.join();
  }
}
