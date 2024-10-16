
class MonthDate {
  final int date;
  final String actualDate;
  final bool isCurrent;
  final bool isHasEvent;

  MonthDate({
    required this.date,
    required this.actualDate,
    required this.isCurrent,
    required this.isHasEvent,
  });

  @override
  String toString() {
    return 'MonthDate{date: $date, actualDate: $actualDate, isCurrent: $isCurrent, isHasEvent: $isHasEvent}';
  }
}