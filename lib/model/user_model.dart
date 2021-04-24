class UserModel {
  int? id;
  String? name;
  String? avatar;
  String? nickname;

  UserModel({this.id, this.name, this.avatar, this.nickname});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    name = json['name'];
    avatar = json['avatar'];
    nickname = json['nickname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id.toString();
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['nickname'] = this.nickname;
    return data;
  }
}
