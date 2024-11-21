import 'package:cooking_champs/model/dynamic_models/user_identity_model.dart';

class FriendsModel {
  String? id;
  String? senderId;
  String? receiverId;
  String? requestSentBy;
  String? requestSentTo;
  String? status;
  String? createdAt;
  String? updatedAt;
  UserIdentityModel? senderDetail;

  FriendsModel(
      {this.id,
        this.senderId,
        this.receiverId,
        this.requestSentBy,
        this.requestSentTo,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.senderDetail});

  FriendsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    senderId = json['sender_id'];
    receiverId = json['receiver_id'];
    requestSentBy = json['request_sent_by'];
    requestSentTo = json['request_sent_to'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    senderDetail = json['sender_detail'] != null
        ? new UserIdentityModel.fromJson(json['sender_detail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sender_id'] = senderId;
    data['receiver_id'] = receiverId;
    data['request_sent_by'] = requestSentBy;
    data['request_sent_to'] = requestSentTo;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (senderDetail != null) {
      data['sender_detail'] = senderDetail!.toJson();
    }
    return data;
  }
}



