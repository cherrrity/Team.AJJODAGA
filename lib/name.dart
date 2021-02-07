class Diary{

  final String title;
  final String contents;
  final int feel;
  final DateTime dateTime;

  Diary({this.title, this.contents,this.dateTime,this.feel,});

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
