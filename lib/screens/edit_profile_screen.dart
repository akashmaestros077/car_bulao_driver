import 'dart:convert';
import 'dart:io';
import 'package:car_bulao_driver/Api/Api_network.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../SessionManager.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  final ImagePicker imagePicker = ImagePicker();
  File? image;

  bool isLoader = false;

  Future<void> dateSelect(BuildContext context, DateTime initialDate,
      DateTime selectedValue, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedValue) {
      setState(() {
        selectedValue = picked;
        controller.text = DateFormat('yyyy-MM-dd').format(selectedValue);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: GoogleFonts.fahkwang(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, 'my_profile');
            },
            child: Text(
              'Done',
              style: GoogleFonts.fahkwang(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
        backgroundColor: Color(0xff28a745),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 90,
                      width: 90,
                      child: CircleAvatar(
                        backgroundImage: image != null
                            ? FileImage(image!) // Use FileImage for local files
                            : AssetImage('assets/userpro.png')
                        as ImageProvider<Object>,
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 55,
                      child: IconButton(
                        onPressed: () => pickImage(),
                        icon: Icon(
                          Icons.camera_alt_rounded,
                          size: 30,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  child: SizedBox(
                    height: 45,
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.elliptical(8, 8)),
                          borderSide: BorderSide(color: Color(0xff28a745)),
                        ),
                        labelText: 'Name',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 45,
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
                        borderSide: BorderSide(color: Color(0xff28a745)),
                      ),
                      labelText: 'Email Address',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  child: SizedBox(
                    height: 45,
                    child: TextField(
                      controller: mobileController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.elliptical(8, 8)),
                          borderSide: BorderSide(color: Color(0xff28a745)),
                        ),
                        labelText: 'Mobile Number',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 45,
                  child: TextField(
                    controller: genderController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
                        borderSide: BorderSide(color: Color(0xff28a745)),
                      ),
                      labelText: 'Gender',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 20),
                  child: SizedBox(
                    height: 45,
                    child: TextField(
                      readOnly: true,
                      controller: dobController,
                      onTap: () => dateSelect(
                          context, selectedDate, selectedDate, dobController),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.elliptical(8, 8)),
                          borderSide: BorderSide(color: Color(0xff28a745)),
                        ),
                        labelText: 'Date Of Birth',
                        suffixIcon: Icon(Icons.calendar_month),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: isLoader
                      ? CircularProgressIndicator()
                      : SizedBox(
                    height: 45,width: double.infinity,
                        child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff28a745),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.elliptical(8, 8))),
                    ),
                    onPressed: () {
                        editProfile();
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'SAVE',
                          style: GoogleFonts.fahkwang(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                    ),
                  ),
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    try {
      final XFile? cameraImage = await imagePicker.pickImage(source: ImageSource.camera);
      final XFile? galleryImage = await imagePicker.pickImage(source: ImageSource.gallery);

      if (cameraImage != null || galleryImage != null) {
        if (cameraImage != null) {
          image = File(cameraImage.path);
        } else {
          image = File(galleryImage!.path);
        }
        setState(() {});
      } else {
        message("No image selected");
      }
    } catch (e) {
      message("Something went wrong");
    }
  }
  Future<void> editProfile() async {
    String id = SessionManager.getUserId();
    String name = nameController.text;
    String email = emailController.text;
    String mobile = mobileController.text;
    String gen = genderController.text;
    String dob = dobController.text;

    if (name.isEmpty ||
        email.isEmpty ||
        mobile.isEmpty ||
        gen.isEmpty ||
        dob.isEmpty) {
      message("Please fill in all the fields");
      return;
    }

    // Create a multipart request
    final request = http.MultipartRequest(
      'POST',
      Uri.parse(Api_network.editProfile),
    );

    request.fields['id'] = id;
    request.fields['name'] = name;
    request.fields['mobile'] = mobile;
    request.fields['email'] = email;
    request.fields['date_of_b'] = dob;
    request.fields['gender'] = gen;

    if (image != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'img',
          image!.path,
        ),
      );
    }
    try {
      final response = await request.send();
      if (response.statusCode == 200) {
        final responseJson = jsonDecode(await response.stream.bytesToString());
        if (responseJson['message'] == "profile update successfull") {
          message("Profile update successful");
          Navigator.pushNamed(context, 'my_profile');
        } else {
          message(responseJson['message'].toString());
        }
      } else {
        message("Error: ${response.reasonPhrase}");
      }
    } catch (e) {
      message("Error: $e");
    }
  }

  void message(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        msg,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.black,
    ));
  }
}
