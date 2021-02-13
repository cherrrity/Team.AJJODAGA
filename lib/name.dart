class Diary{
  final int no;
  final String title;
  final String contents;
  final int feel;
  final String dateTime;
  final String id;
  final String pic;

  Diary({this.no, this.title, this.contents,this.dateTime,this.feel,this.id, this.pic,});

  Map<String, dynamic> toMap(){
    return {
      'title' : title,
      'contents' : contents,
      'dateTime' : dateTime,
      'feel' : feel,
      'id' : id,
      'pic' : pic,
    };
  }
  @override
  String toString() {
    return 'Diary{ title: $title, contents:$contents, dateTime:$dateTime, feel: $feel  ,id: $id, pic: $pic}';
  }


}
