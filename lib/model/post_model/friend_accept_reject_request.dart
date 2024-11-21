class FriendAcceptRejectRequest {
  int? friendRequestId;
  String? accept;

  FriendAcceptRejectRequest({this.friendRequestId, this.accept});

  FriendAcceptRejectRequest.fromJson(Map<String, dynamic> json) {
    friendRequestId = json['friend_request_id'];
    accept = json['accept'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['friend_request_id'] = friendRequestId;
    data['accept'] = accept;
    return data;
  }
}