class Photo{
  final String id;
  final String pic;

  Photo({this.id, this.pic});

  Map<String, dynamic> toMap(){
    return {
      'id' : id,
      'pic' : pic,
    };
  }

  @override
  String toString() {
    return 'Photo{id: $id, pic: $pic}';
  }

}
