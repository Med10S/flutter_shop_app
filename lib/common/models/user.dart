// ignore_for_file: non_constant_identifier_names

class LogingRequestModel {
  int? type;
  String? name;
  String? description;
  String? email;
  String? phone;
  String? avatar;
  String? openId;
  int? online;

  LogingRequestModel(
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
        "open_id": openId,
        "online": online,
      };
}

class UserLoginResponseEntity {
  int? code;
  String? msg;
  UserProfile? data;
  UserLoginResponseEntity({this.code, this.msg, this.data});
  factory UserLoginResponseEntity.fromJson(Map<String, dynamic> json) {
    return UserLoginResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: UserProfile.fromJson(json["data"]));
  }
}

//login result
class UserProfile {
  String? access_token;
  String? token;
  String? name;
  String? description;
  String? avatar;
  int? online;
  int? type;
  UserProfile(
      {this.access_token,
      this.token,
      this.name,
      this.description,
      this.avatar,
      this.online,
      this.type});
  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      access_token: json['access_token'],
      token: json['token'],
      name: json['name'],
      description: json['description'],
      avatar: json['avatar'],
      online: json['online'],
      type: json['type'],
    );
  }
  Map<String, dynamic> toJson() => {
        "access_token": access_token,
        "token": token,
        "name": name,
        "description": description,
        "avatar": avatar,
        "online": online,
        "type": type,
      };
}
