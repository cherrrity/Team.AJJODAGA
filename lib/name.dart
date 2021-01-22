class Diary{

  final String title;
  final String contents;
  final String year;
  final String month;
  final String day;
  final int feel;

  Diary({this.title, this.contents, this.year, this.month,this.day,this.feel,});

  Map<String, dynamic> toMap(){
    return {
      'title' : title,
      'contents' : contents,
      'year' : year,
      'month' : month,
      'day' : day,
      'feel' : feel,

    };
  }
  @override
  String toString() {
    return 'Diary{ title: $title, contents:$contents, year: $year,month: $month,day: $day,feel: $feel}';
  }

}
