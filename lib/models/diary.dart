class Diary{
  final String title;
  final String contents;
  final int feel;
  final String image;
  final DateTime dateTime;

  Diary({this.title, this.contents,this.dateTime,this.image,this.feel,});

  Map<String, dynamic> toMap(){
    return {
      'title' : title,
      'contents' : contents,
      'dateTime' : dateTime,
      'feel' : feel,
      'image' : image,

    };
  }
  @override
  String toString() {
    return 'Diary{ title: $title, contents:$contents, dateTime:$dateTime, image, : $image, feel: $feel}';
  }
}