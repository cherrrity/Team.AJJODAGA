class Diary{
  String title = '';
  String contents = '';
  int feel = 0;
  String image = '';
  DateTime dateTime = DateTime.now();

  Diary({title, contents, feel, image, dateTime}){
    this.title = title != null? title: this.title;
    this.contents = contents != null? contents: this.contents;
    this.feel = feel != null? feel: this.feel;
    this.image = image != null? image: this.image;
    this.dateTime = dateTime != null? dateTime: this.dateTime;
  }

  Map<String, dynamic> toMap(){
    return {
      'title' : title,
      'contents' : contents,
      'dateTime' : dateTime,
      'feel' : feel,
      'image' : image
    };
  }

  @override
  String toString() {
    return 'Diary{ title: $title, contents:$contents, dateTime:$dateTime, image, : $image, feel: $feel}';
  }
}