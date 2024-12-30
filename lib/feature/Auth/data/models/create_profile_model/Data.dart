import 'User.dart';

class CreateProfileData {
  CreateProfileData({
      this.user,});

  CreateProfileData.fromJson(dynamic json) {
    user = json['user'] != null ? CreateProfileUser.fromJson(json['user']) : null;
  }
  CreateProfileUser? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}