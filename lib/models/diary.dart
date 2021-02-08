class Diary{
  String title;
  String contents;
  int feel;
  String image;
  DateTime dateTime;

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
