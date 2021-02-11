class Diary{
  final int no;
  final String title;
  final String contents;
  final int feel;
  final String dateTime;

  Diary({this.no, this.title, this.contents,this.dateTime,this.feel,});

  Map<String, dynamic> toMap(){
    return {
      'title' : title,
      'contents' : contents,
      'dateTime' : dateTime,
      'feel' : feel,

    };
  }
  @override
  String toString() {
    return 'Diary{ title: $title, contents:$contents, dateTime:$dateTime, feel: $feel}';
  }

}
