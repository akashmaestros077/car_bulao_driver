class DrivingLicenseEdit {
  String? status;
  String? message;
  DriverDoc? driverDoc;

  DrivingLicenseEdit({this.status, this.message, this.driverDoc});

  DrivingLicenseEdit.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    driverDoc = json['driver_doc'] != null
        ? new DriverDoc.fromJson(json['driver_doc'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.driverDoc != null) {
      data['driver_doc'] = this.driverDoc!.toJson();
    }
    return data;
  }
}

class DriverDoc {
  String? driverLicNo;
  String? driverLicExDate;
  String? driverLicImg;
  String? driverId;

  DriverDoc(
      {this.driverLicNo,
        this.driverLicExDate,
        this.driverLicImg,
        this.driverId});

  DriverDoc.fromJson(Map<String, dynamic> json) {
    driverLicNo = json['driver_lic_no'];
    driverLicExDate = json['driver_lic_ex_date'];
    driverLicImg = json['driver_lic_img'];
    driverId = json['driver_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['driver_lic_no'] = this.driverLicNo;
    data['driver_lic_ex_date'] = this.driverLicExDate;
    data['driver_lic_img'] = this.driverLicImg;
    data['driver_id'] = this.driverId;
    return data;
  }
}