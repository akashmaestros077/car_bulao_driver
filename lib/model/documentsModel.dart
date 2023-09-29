class documentsModel {
  String? status;
  DrData? drData;

  documentsModel({this.status, this.drData});

  documentsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    drData =
    json['dr_data'] != null ? DrData.fromJson(json['dr_data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (drData != null) {
      data['dr_data'] = drData!.toJson();
    }
    return data;
  }
}

class DrData {
  String? driverLicNo;
  String? driverLicExDate;
  String? driverLicImg;
  String? aadhaarNo;
  String? aadhaarImg;
  String? driverId;

  DrData(
      {this.driverLicNo,
        this.driverLicExDate,
        this.driverLicImg,
        this.aadhaarNo,
        this.aadhaarImg,
        this.driverId});

  DrData.fromJson(Map<String, dynamic> json) {
    driverLicNo = json['driver_lic_no'];
    driverLicExDate = json['driver_lic_ex_date'];
    driverLicImg = json['driver_lic_img'];
    aadhaarNo = json['Aadhaar_no'];
    aadhaarImg = json['Aadhaar_img'];
    driverId = json['driver_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['driver_lic_no'] = driverLicNo;
    data['driver_lic_ex_date'] = driverLicExDate;
    data['driver_lic_img'] = driverLicImg;
    data['Aadhaar_no'] = aadhaarNo;
    data['Aadhaar_img'] = aadhaarImg;
    data['driver_id'] = driverId;
    return data;
  }
}