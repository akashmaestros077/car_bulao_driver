class loginModel {
  String? status;
  String? message;
  UserData? userData;

  loginModel({this.status, this.message, this.userData});

  loginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    userData = json['user-data'] != null
        ? new UserData.fromJson(json['user-data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    if (userData != null) {
      data['user-data'] = userData!.toJson();
    }
    return data;
  }
}

class UserData {
  String? id;
  String? carName;
  String? driverName;
  String? mobile;
  String? email;
  String? licenseNumber;
  String? experience;
  String? address;
  String? dob;
  String? password;

  UserData(
      {this.id,
        this.carName,
        this.driverName,
        this.mobile,
        this.email,
        this.licenseNumber,
        this.experience,
        this.address,
        this.dob,
        this.password});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    carName = json['car_name'];
    driverName = json['driver_name'];
    mobile = json['mobile'];
    email = json['email'];
    licenseNumber = json['license_number'];
    experience = json['experience'];
    address = json['address'];
    dob = json['dob'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['car_name'] = carName;
    data['driver_name'] = driverName;
    data['mobile'] = mobile;
    data['email'] = email;
    data['license_number'] = licenseNumber;
    data['experience'] = experience;
    data['address'] = address;
    data['dob'] = dob;
    data['password'] = password;
    return data;
  }
}