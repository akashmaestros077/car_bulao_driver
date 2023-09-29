class EditProfileModel {
  EditProfile? editProfile;
  String? status;
  String? message;

  EditProfileModel({this.editProfile, this.status, this.message});

  EditProfileModel.fromJson(Map<String, dynamic> json) {
    editProfile = json['edit_profile'] != null
        ? new EditProfile.fromJson(json['edit_profile'])
        : null;
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.editProfile != null) {
      data['edit_profile'] = this.editProfile!.toJson();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class EditProfile {
  String? name;
  String? mobile;
  String? email;
  String? dateOfB;
  String? gender;
  String? img;

  EditProfile(
      {this.name,
        this.mobile,
        this.email,
        this.dateOfB,
        this.gender,
        this.img});

  EditProfile.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    dateOfB = json['date_of_b'];
    gender = json['gender'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['date_of_b'] = this.dateOfB;
    data['gender'] = this.gender;
    data['img'] = this.img;
    return data;
  }
}
