class PostModel {
  final int userID;
  final int postID;
  final String title;

  PostModel({
    required this.userID,
    required this.postID,
    required this.title,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userID: json['userId'],
      postID: json['id'],
      title: json['title'],
    );
  }
}
