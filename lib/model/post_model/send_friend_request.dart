class SendFriendRequest {
  int? senderId;
  int? receiverId;
  String? requestSentBy;
  String? requestSentTo;

  SendFriendRequest(
      {this.senderId, this.receiverId, this.requestSentBy, this.requestSentTo});

  SendFriendRequest.fromJson(Map<String, dynamic> json) {
    senderId = json['sender_id'];
    receiverId = json['receiver_id'];
    requestSentBy = json['request_sent_by'];
    requestSentTo = json['request_sent_to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sender_id'] = senderId;
    data['receiver_id'] = receiverId;
    data['request_sent_by'] = requestSentBy;
    data['request_sent_to'] = requestSentTo;
    return data;
  }
}