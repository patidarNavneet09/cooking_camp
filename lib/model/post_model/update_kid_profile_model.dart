class UpdateKidProfile {
  int? kidId;
  String? name;
  int? day;
  String? month;
  String? year;
  String? grade;
  String? username;
  String? password;

  UpdateKidProfile(
      {this.kidId,
        this.name,
        this.day,
        this.month,
        this.year,
        this.grade,
        this.username,
        this.password});

  UpdateKidProfile.fromJson(Map<String, dynamic> json) {
    kidId = json['kid_id'];
    name = json['name'];
    day = json['day'];
    month = json['month'];
    year = json['year'];
    grade = json['grade'];
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kid_id'] = kidId;
    data['name'] = name;
    data['day'] = day;
    data['month'] = month;
    data['year'] = year;
    data['grade'] = grade;
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}


