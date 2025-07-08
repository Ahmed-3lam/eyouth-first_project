class PostModel {
  int? userId;
  int? id;

  String? title;
  String? body;

  PostModel({this.userId, this.id, this.title, this.body});

  PostModel.fromJson(Map json) {
    userId = json["userId"];
    id = json["id"];
    title = json["title"];
    body = json["body"];
  }
}
