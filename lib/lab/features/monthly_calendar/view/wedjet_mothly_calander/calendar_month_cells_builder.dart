List<DateTime?> buildCalendarMonthCells(
  DateTime month,
) {
  final firstDay = DateTime(
    month.year,
    month.month,
    1,
  );

  final daysCount = DateTime(
    month.year,
    month.month + 1,
    0,
  ).day;


  final emptyCells =
      firstDay.weekday % 7;

  final cells = <DateTime?>[
    ...List<DateTime?>.filled(
      emptyCells,
      null,
    ),

    ...List<DateTime>.generate(
      daysCount,
      (index) {
        return DateTime(
          month.year,
          month.month,
          index + 1,
        );
      },
    ),
  ];

  while (cells.length % 7 != 0) {
    cells.add(null);
  }

  return cells;
}