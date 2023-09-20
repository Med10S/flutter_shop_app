import 'dart:convert';

class CourseResponceEntity {
  int? id;
  CourseResponceEntity({this.id});
  Map<String, dynamic> toJson() => {"id": id};
}

class SeachRequestEntity {
  String? search;
  SeachRequestEntity({this.search});
  Map<String, dynamic> toJson() => {"search": search};
}

class CourseListResponceEntity {
  int? code;
  String? msg;
  List<CourseItem>? data;

  CourseListResponceEntity({this.code, this.data, this.msg});

  // Factory method to create a CourseListResponceEntity object from a JSON map
  factory CourseListResponceEntity.fromJson(Map<String, dynamic> json) {
    return CourseListResponceEntity(
      code: json["code"],
      msg: json["msg"],
      data: json["data"] == null
          ? []
          : List<CourseItem>.from(
              json["data"].map((x) => CourseItem.fromJson(x))),
    );
  }
}

class CourseDetailResponceEntity {
  int? code;
  String? msg;
  CourseItem? data;

  CourseDetailResponceEntity({this.code, this.data, this.msg});

  // Factory method to create a CourseDetailResponceEntity object from a JSON map
  factory CourseDetailResponceEntity.fromJson(Map<String, dynamic> json) {
    return CourseDetailResponceEntity(
      code: json["code"],
      msg: json["msg"],
      data: CourseItem.fromJson(json["data"]),
    );
  }
}

class AuthoreRequestEntity {
  String? token;
  AuthoreRequestEntity({this.token});
  Map<String, dynamic> toJson() => {
        "token": token,
      };
}

class AuthoreResponseEntity {
  int? code;
  String? msg;
  AuthorItem? data;
  AuthoreResponseEntity({this.code, this.data, this.msg});
  factory AuthoreResponseEntity.fromJson(Map<String, dynamic> json) {
    return AuthoreResponseEntity(
      code: json["code"],
      msg: json["msg"],
      data: AuthorItem.fromJson(json["data"]),
    );
  }
}

class CourseItem {
  String? user_token;
  String? name;
  String? description;
  String? thumbnail;
  String? video;
  int? price;
  String? amount_total;
  int? lesson_num;
  int? video_len;
  int? down_num;
  int? follow;
  int? score;
  int? id;
  CourseItem(
      {this.amount_total,
      this.description,
      this.down_num,
      this.follow,
      this.id,
      this.lesson_num,
      this.name,
      this.price,
      this.score,
      this.thumbnail,
      this.user_token,
      this.video,
      this.video_len});
  factory CourseItem.fromJson(Map<String, dynamic> json) {
    return CourseItem(
      user_token: json["user_token"],
      name: json["name"],
      description: json["description"],
      thumbnail: json["thumbnail"],
      video: json["video"],
      price: json["price"],
      amount_total: json["amount_total"],
      lesson_num: json["lesson_num"],
      video_len: json["video_len"],
      down_num: json["down_num"],
      follow: json["follow"],
      score: json["score"],
      id: json["id"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "user_token": user_token,
      "name": name,
      "description": description,
      "thumbnail": thumbnail,
      "video": video,
      "price": price,
      "amount_total": amount_total,
      "lesson_num": lesson_num,
      "video_len": video_len,
      "down_num": down_num,
      "follow": follow,
      "score": score,
      "id": id,
    };
  }
}

class AuthorItem {
  String? token;
  String? name;
  String? description;
  String? avatar;
  String? job;
  int? follow;
  int? score;
  int? download;
  int? online;

  // Constructor
  AuthorItem({
    this.token,
    this.name,
    this.description,
    this.avatar,
    this.job,
    this.follow,
    this.score,
    this.download,
    this.online,
  });

  // Factory method to create an AuthorItem object from a JSON map
  factory AuthorItem.fromJson(Map<String, dynamic> json) {
    return AuthorItem(
      token: json["token"],
      name: json["name"],
      description: json["description"],
      avatar: json["avatar"],
      job: json["job"],
      follow: json["follow"],
      score: json["score"],
      download: json["download"],
      online: json["online"],
    );
  }

  // Method to convert an AuthorItem object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      "token": token,
      "name": name,
      "description": description,
      "avatar": avatar,
      "job": job,
      "follow": follow,
      "score": score,
      "download": download,
      "online": online,
    };
  }
}
