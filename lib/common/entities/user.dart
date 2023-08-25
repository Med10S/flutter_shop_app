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
