class Diary {
  final int month;
  final int date;

  Diary.fromMap(Map<String, dynamic> map)
      : month = map['month'],
        date = map['date'];
}
