import 'dart:convert';
import 'package:car_bulao_driver/Api/Api_network.dart';
import 'package:car_bulao_driver/model/ContactusModel.dart';
import 'package:car_bulao_driver/model/PrivacyModel.dart';
import 'package:car_bulao_driver/model/identityCardModel.dart';
import 'package:car_bulao_driver/model/DrivingLicenseEdit.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import '../model/EditProfileModel.dart';
import '../model/car_details_model.dart';
import '../model/documentsModel.dart';
import '../model/loginModel.dart';
import '../model/myProfileModel.dart';
import '../model/registerModel.dart';

class Api_helper {
  static Future<registerModel> Register(Map<String, dynamic> map) async {
    Uri uri = Uri.parse(Api_network.register);
    try {
      final response = await http.post(uri, body: map);
      if (response.statusCode == 200) {
        return registerModel.fromJson(jsonDecode(response.body));
      } else {
        return registerModel(message: 'Something went wrong!');
      }
    } catch (e) {
      return registerModel(message: 'Something went wrong!');
    }
  }

  static Future<loginModel> Login(Map<String, dynamic> map) async {
    Uri uri = Uri.parse(Api_network.login);

    try {
      final response = await http.post(uri, body: map);
      if (response.statusCode == 200) {
        return loginModel.fromJson(jsonDecode(response.body));
      } else {
        return loginModel(message: 'Somthing went wrong!');
      }
    } catch (e) {
      return loginModel(message: 'Somthing went wrong!');
    }
  }

  Future<MyProfileModel> getProfile(Map<String, dynamic> map) async {
    Uri url = Uri.parse(Api_network.myProfile);

    try {
      final response = await http.post(url, body: map);

      if (response.statusCode == 200) {
        return MyProfileModel.fromJson(jsonDecode(response.body));
      } else {
        return MyProfileModel(message: "Somthing went wrong");
      }
    } catch (e) {
      return MyProfileModel(message: "Somthing went wrong");
    }
  }

  Future<EditProfileModel> editProfile(Map<String, dynamic> map) async {
    Uri url = Uri.parse(Api_network.editProfile);
    try {
      final response = await http.post(url, body: map);
      if (response.statusCode == 200) {
        return EditProfileModel.fromJson(jsonDecode(response.body));
      } else {
        return EditProfileModel(message: "Somthing went wrong ");
      }
    } catch (e) {
      return EditProfileModel(message: "Somthing went wrong ");
    }
  }

  Future<DrivingLicenseEdit> drivingLicenseEdit(
      Map<String, dynamic> map) async {
    Uri url = Uri.parse(Api_network.drivingLicense);

    try {
      final response = await http.post(url, body: map);

      if (response.statusCode == 200) {
        return DrivingLicenseEdit.fromJson(jsonDecode(response.body));
      } else {
        return DrivingLicenseEdit(message: "Somthing went wrong");
      }
    } catch (e) {
      return DrivingLicenseEdit(message: "Somthing went wrong");
    }
  }

  Future<documentsModel> documents (Map<String,dynamic>map) async{
    Uri url  = Uri.parse(Api_network.doc);
    final response = await http.post(url,body: map);

    try{
      if(response.statusCode==200){
        return documentsModel.fromJson(jsonDecode(response.body));
      }
      else{
        return documentsModel(status: response.body);
      }
    }
    catch(e){
      return documentsModel(status: response.body);
    }

  }

  Future<car_details_model> carDetails(Map<String,dynamic> map) async{
    Uri url = Uri.parse(Api_network.carShow);
    try{
      final response = await http.post(url,body: map);
      if(response.statusCode==200){
        return car_details_model.fromJson(jsonDecode(response.body));
      }
      else{
        return car_details_model(message: "Somthing went wrong");
      }
    }
    catch(e){
      return car_details_model(message: "Somthing went wrong");

    }
  }

  Future<ContactusModel> contactUs(Map<String, dynamic> map) async {
    Uri url = Uri.parse(Api_network.contact);

    try {
      final response = await http.post(url, body: map);
      if (response.statusCode == 200) {
        return ContactusModel.fromJson(jsonDecode(response.body));
      } else {
        return ContactusModel(message: "Somthing went wrong");
      }
    } catch (e) {
      return ContactusModel(message: "Somthing went wrong");
    }
  }

  Future<PrivacyModel> privacy() async {
    Uri url = Uri.parse(Api_network.privacy);
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return PrivacyModel.fromJson(jsonDecode(response.body));
      } else {
        return PrivacyModel(message: "Somthing went wrong");
      }
    } catch (e) {
      return PrivacyModel(message: "Somthing went wrong");
    }
  }

//Map
  static Future<void> onpenMap(double Longitute, double Latitute) async {
    Uri googleMapUrl = Uri.parse(
        "https://www.google.com/maps/search/?api=1&query=$Latitute,$Longitute");

    if (await canLaunchUrl(googleMapUrl as Uri)) {
      await launchUrl(googleMapUrl);
    } else {
      throw " Somthing went wrong";
    }
  }
}
