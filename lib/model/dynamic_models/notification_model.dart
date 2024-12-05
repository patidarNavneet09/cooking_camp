class NotificationModel {
  final String? body;
  final String? senderId;
  final String? sound;
  final String? timestamp;
  final String? userId;
  final String? imageUrl;
  final String? title;
  final String? requestSentTo;
  final String? type;
  final String? priority;
  final String? requestSentBy;
  final String? clickAction;
  final String? isBackground;
  final String? contentAvailable;
  final String? role;
  final String? status;
  final String? receiverId;
  final String? id;
  final String? kidId;
  final String? message;
  final String? createdAt;
  final  String? updatedAt;
  final  UserDetails? userDetails;

  final String? storyShareToRole;
  final String? storyId;
  final String? storyShareBy;
  final String? storyShareTo;


  NotificationModel({
    this.body,
    this.senderId,
    this.sound,
    this.timestamp,
    this.userId,
    this.imageUrl,
    this.title,
    this.requestSentTo,
    this.type,
    this.priority,
    this.requestSentBy,
    this.clickAction,
    this.isBackground,
    this.contentAvailable,
    this.role,
    this.status,
    this.receiverId,
    this.id,
    this.kidId,
    this.message,
    this.createdAt,
    this.updatedAt,
    this.userDetails,


     this.storyShareToRole,
     this.storyId,
     this.storyShareBy,
     this.storyShareTo,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      body: json['body'],
      senderId: json['sender_id'].toString(),
      sound: json['sound'],
      timestamp: json['timestamp'],
      userId: json['user_id'].toString(),
      imageUrl: json['image'],
      title: json['title'],
      requestSentTo: json['request_sent_to'],
      type: json['type'],
      priority: json['priority'],
      requestSentBy: json['request_sent_by'],
      clickAction: json['click_action'],
      isBackground: json['isBackground'].toString(),
      contentAvailable: json['content_available'].toString(),
      role: json['role'],
      status: json['status'].toString(),
      receiverId: json['receiver_id'].toString(),
      id: json['id'] ?? '',
      kidId: json['kid_id'] ?? '',
      message: json['message'] ?? '',
        createdAt : json['created_at'],
        updatedAt : json['updated_at'],
        userDetails: json['user_details'] != null
    ? UserDetails.fromJson(json['user_details'])
        : null,

      storyShareToRole: json['storyShareToRole'].toString(),
      storyId: json['story_id'].toString(),
      storyShareBy: json['story_share_by'].toString(),
      storyShareTo: json['story_share_to'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'body': body,
      'sender_id': senderId,
      'sound': sound,
      'timestamp': timestamp,
      'user_id': userId,
      'image': imageUrl,
      'title': title,
      'request_sent_to': requestSentTo,
      'type': type,
      'priority': priority,
      'request_sent_by': requestSentBy,
      'click_action': clickAction,
      'isBackground': isBackground,
      'content_available': contentAvailable,
      'role': role,
      'status': status,
      'receiver_id': receiverId,
      'id': id,
      'kid_id': kidId,
      'message': message,
      'user_details': userDetails!.toJson(),

      'storyShareToRole': storyShareToRole,
      'story_id': storyId,
      'imageUrl': imageUrl,
      'story_share_by': storyShareBy,
      'story_share_to': storyShareTo,
    };
  }
}

class UserDetails {
  final String id;
  final String firstName;
  final String lastName;
  final String role;
  final String email;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserDetails({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.email,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      id: json['id'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      role: json['role'] ?? '',
      email: json['email'] ?? '',
      image: json['image'] ?? '',
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'role': role,
      'email': email,
      'image': image,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
