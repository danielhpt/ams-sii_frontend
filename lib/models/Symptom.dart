class Symptom {
  String comments;
  String imagePath;

  Symptom({this.comments, this.imagePath});

  factory Symptom.fromJson(Map<String, dynamic> json) {
    return Symptom(comments: json['comments'], imagePath: json['image_path']);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'comments': comments, 'image_path': imagePath};
  }
}
