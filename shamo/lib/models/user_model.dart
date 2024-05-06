class UserModel {
  int? id;
  String? name;
  String? email;
  String? username;
  String? profilePhotoUrl;
  String? token;

UserModel({
  this.id,
  this.name,
  this.email,
  this.username,
  this.profilePhotoUrl,
  this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    id = json['name'];
    id = json['email'];
    id = json['username'];
    id = json['profile_photo_url'];
    id = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'name' : name,
      'email' : email,
      'username' : username,
      'profilePhotoUrl' : profilePhotoUrl,
      'token' : token,
    };
  }
}