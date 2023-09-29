class identityCardModel {
  String? status;
  String? message;
  DriverDoc? driverDoc;

  identityCardModel({this.status, this.message, this.driverDoc});

  identityCardModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    driverDoc = json['driver_doc'] != null
        ? DriverDoc.fromJson(json['driver_doc'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (driverDoc != null) {
      data['driver_doc'] = driverDoc!.toJson();
    }
    return data;
  }
}

class DriverDoc {
  String? aadhaarNo;
  String? aadhaarImg;

  DriverDoc({this.aadhaarNo, this.aadhaarImg});

  DriverDoc.fromJson(Map<String, dynamic> json) {
    aadhaarNo = json['Aadhaar_no'];
    aadhaarImg = json['Aadhaar_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Aadhaar_no'] = aadhaarNo;
    data['Aadhaar_img'] = aadhaarImg;
    return data;
  }
}