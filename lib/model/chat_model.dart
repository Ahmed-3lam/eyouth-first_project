class ChatModel {
   int? id;
   String? name;
   String? avatar;
   String? message;
   String? time;
   bool? isRead;
   String? messageType;

  ChatModel({
    this.id,
    this.name,
    this.avatar,
    this.message,
    this.isRead,
    this.messageType,
    this.time,
  });

  ChatModel.fromJson(Map json){
    id = json["id"];
    name = json["name"];
    avatar =json["avatar"];
    message = json["message"];
    time = json["time"];
    isRead = json["isRead"];
    messageType = json["messageType"];
  }
}

// "id": 1,
// "name": "John Doe",
// "avatar": avatarImage1,
// "message": "Hello, how are you?",
// "time": "10:30 AM",
// "isRead": false,
// "messageType": "text",
