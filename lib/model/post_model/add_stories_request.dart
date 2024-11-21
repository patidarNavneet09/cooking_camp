class AddStoriesRequest {
  String? title;
  String? description;

  AddStoriesRequest({this.title, this.description});

  AddStoriesRequest.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}