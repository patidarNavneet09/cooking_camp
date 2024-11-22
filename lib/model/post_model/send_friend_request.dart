class SendFriendRequest {
  int? senderId;
  int? receiverId;
  String? requestSentBy;
  String? requestSentTo;
  String? type;

  SendFriendRequest(
      {this.senderId, this.receiverId, this.requestSentBy, this.requestSentTo, this.type});

  SendFriendRequest.fromJson(Map<String, dynamic> json) {
    senderId = json['sender_id'];
    receiverId = json['receiver_id'];
    requestSentBy = json['request_sent_by'];
    requestSentTo = json['request_sent_to'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sender_id'] = senderId;
    data['receiver_id'] = receiverId;
    data['request_sent_by'] = requestSentBy;
    data['request_sent_to'] = requestSentTo;
    data['type'] = type;
    return data;
  }
}