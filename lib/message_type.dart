enum MessageType {
  VIDEO,TEXT,GIF,IMAGE
}

MessageType getMyMessageTypeText(String messageType){
  switch(messageType){
    case "text":
      return MessageType.TEXT;

    case "video":
      return MessageType.VIDEO;

    case "image":
      return MessageType.IMAGE;

    default: return MessageType.GIF;
  }
}