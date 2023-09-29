class LessonVideoItem {
  String? name;
  String? url;
  String? thumbnail;
  LessonVideoItem({this.name, this.thumbnail, this.url});
  factory LessonVideoItem.fromJson(Map<String, dynamic> json) {
    return LessonVideoItem(
      name: json["name"],
      url: json["url"],
      thumbnail: json["thumbnail"],
    );
  }
  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
        "thumbnail": thumbnail,
      };
}

class LessonItem {
  String? name;
  String? description;
  String? thumbnail;
  int? id;

  LessonItem({
    this.name,
    this.description,
    this.thumbnail,
    this.id,
  });

  // Factory method to create a LessonItem object from a JSON map
  factory LessonItem.fromJson(Map<String, dynamic> json) {
    return LessonItem(
      name: json["name"],
      description: json["description"],
      thumbnail: json["thumbnail"],
      id: json["id"],
    );
  }

  // Method to convert a LessonItem object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "description": description,
      "thumbnail": thumbnail,
      "id": id,
    };
  }
}

class LessonDetailResponceEntity {
  int? code;
  String? msg;
  List<LessonVideoItem>? data;

  LessonDetailResponceEntity({this.code, this.data, this.msg});

  // Factory method to create a LessonDetailResponceEntity object from a JSON map
  factory LessonDetailResponceEntity.fromJson(Map<String, dynamic> json) {
    return LessonDetailResponceEntity(
      code: json["code"],
      msg: json["msg"],
      data: json["data"] != null
          ? List<LessonVideoItem>.from((json["data"] as List)
              .map((item) => LessonVideoItem.fromJson(item)))
          : [],
    );
  }
}

class LessonListReResponceEntity {
  int? code;
  String? msg;
  List<LessonItem>? data;

  LessonListReResponceEntity({this.code, this.data, this.msg});

  // Factory method to create a LessonListReResponceEntity object from a JSON map
  factory LessonListReResponceEntity.fromJson(Map<String, dynamic> json) {
    return LessonListReResponceEntity(
      code: json["code"],
      msg: json["msg"],
      data: json["data"] != null
          ? List<LessonItem>.from(
              (json["data"] as List).map((item) => LessonItem.fromJson(item)))
          : [],
    );
  }
}

class LessonRequestEntity {
  int? id;
  LessonRequestEntity({this.id});
  Map<String, dynamic> toJson() => {"id": id};
}
