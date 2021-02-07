class Diary {
  final int year;
  final int month;
  final int date;
  final int satisfaction;

  Diary.fromMap(Map<String, dynamic> map)
      : year = map['year'],
        month = map['month'],
        date = map['date'],
        satisfaction = map['satisfaction'];
}
