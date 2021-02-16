import 'package:intl/intl.dart';

class Diary{
  int no;
  String title = '';
  String contents = '';
  int feel = 1;
  String image = '';
  DateTime dateTime = DateTime.now();

  Diary({no, title, contents, feel, image, dateTime}){
    this.no = no?? this.no;
    this.title = title?? this.title;
    this.contents = contents?? this.contents;
    this.feel = feel?? this.feel;
    this.image = image?? this.image;
    this.dateTime = dateTime?? this.dateTime;
  }

  Map<String, dynamic> toMap(){
    return {
      'no' : no,
      'title' : title,
      'contents' : contents,
      'dateTime' : DateFormat('yyyy-MM-dd').format(dateTime),
      'feel' : feel,
      'image' : image
    };
  }

  @override
  String toString() {
    return 'Diary{ no: $no, title: $title, contents:$contents, dateTime:$dateTime, image, : $image, feel: $feel}';
  }
}