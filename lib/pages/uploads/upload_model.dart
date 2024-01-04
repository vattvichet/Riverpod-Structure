class UploadModel {
  final int userId;
  final String title;
  final String body;

  UploadModel({
    required this.userId,
    required this.title,
    required this.body,
  });

  factory UploadModel.fromJson(Map<String, dynamic> json) {
    return UploadModel(
      userId: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': userId,
      'title': title,
      'body': body,
    };
  }
}
