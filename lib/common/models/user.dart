class LogingRequesEntity {
  int? type;
  String? name;
  String? description;
  String? email;
  String? phone;
  String? avatar;
  String? openId;
  int? online;

  LogingRequesEntity(
      {this.type,
      this.name,
      this.description,
      this.email,
      this.phone,
      this.avatar,
      this.openId,
      this.online});

  Map<String, dynamic> toJson() => {
        "type": type,
        "name": name,
        "description": description,
        "email": email,
        "phone": phone,
        "avatar": avatar,
        "openId": openId,
        "online": online,
      };
}

class UserLoginResponseEntity {
  int? code;
  String? msg;
  UserProfile? data;
  UserLoginResponseEntity({this.code, this.msg, this.data});
  // factory UserLoginResponseEntity.fromJson(Map<String, dynamic> json) {
  //   UserLoginResponseEntity(
  //       code: json["code"],
  //       msg: json["msg"],
  //       data: UserProfile.fromJson(json["data"]));
  // }
}

//login result
class UserProfile {
  String? accessToken;
  String? token;
  String? name;
  String? description;
  String? avatar;
  int? online;
  int? type;
  UserProfile(
      {this.accessToken,
      this.token,
      this.name,
      this.description,
      this.avatar,
      this.online,
      this.type});
  factory UserProfile.fromJson(Map<String, dynamic> json) {
    // if ((json["accessToken"]) == null || json["accessToken"].isEmpty) {
    //   return UserProfile();
    // }
    return UserProfile(
      accessToken: json['accessToken'],
      token: json['token'],
      name: json['name'],
      description: json['description'],
      avatar: json['avatar'],
      online: json['online'],
      type: json['type'],
    );
  }
  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "token": token,
        "name": name,
        "description": description,
        "avatar": avatar,
        "online": online,
        "type": type,
      };
}
