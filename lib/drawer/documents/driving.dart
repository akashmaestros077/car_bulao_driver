import 'dart:io';
import 'package:car_bulao_driver/SessionManager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../../Api/Api_network.dart';

class DrivingLicense extends StatefulWidget {
  const DrivingLicense({Key? key}) : super(key: key);

  @override
  State<DrivingLicense> createState() => _DrivingLicenseState();
}

class _DrivingLicenseState extends State<DrivingLicense> {
  final ImagePicker imagePicker = ImagePicker();
  TextEditingController licenseNumber = TextEditingController();
  TextEditingController expDate = TextEditingController();

  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update Documents',
          style: GoogleFonts.fahkwang(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff28a745),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Card(
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: image != null
                            ? FileImage(image!)
                            : AssetImage("assets/drivinglicence.png")
                                as ImageProvider<Object>,
                        height: 150,
                        width: 300,
                      ),
                      SizedBox(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                pickImage(ImageSource.gallery);
                              },
                              child: SizedBox(
                                child: Text(
                                  "Upload",
                                  style: GoogleFonts.fahkwang(
                                      fontSize: 15, color: Color(0xff28a745)),
                                ),
                              ),
                            ),
                            Icon(
                              Icons.camera_alt_rounded,
                              color: Color(0xff28a745),
                              size: 20,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    controller: licenseNumber,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
                        borderSide: BorderSide(color: Color(0xff28a745)),
                      ),
                      labelText: "Driver's License Number",
                      prefixIcon: Icon(
                        Icons.newspaper_outlined,
                        color: Color(0xff28a745),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    controller: expDate,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
                        borderSide: BorderSide(color: Color(0xff28a745)),
                      ),
                      labelText: "Expiration Date",
                      prefixIcon: Icon(
                        Icons.calendar_month,
                        color: Color(0xff28a745),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff28a745),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
                  ),
                ),
                onPressed: () {
                  editLicense();
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
            ],
          ),
        ),
      ),
    );
  }

  pickImage(ImageSource source) async {
    XFile? xFileImage = await imagePicker.pickImage(source: source);
    if (xFileImage != null) {
      image = File(xFileImage.path);
      setState(() {});
    }
  }

  Future<void> editLicense() async {
    String license = licenseNumber.text;
    String exp = expDate.text;
    String id = SessionManager.getUserId();
    File imgPath = File(image!.path);

    if (license.isEmpty) {
      return message("Enter License Number");
    }
    if (exp.isEmpty) {
      return message('Enter Exp Date');
    }

    var request = http.MultipartRequest(
        'POST', Uri.parse(Api_network.drivingLicense));

    request.fields.addAll(
        {'driver_lic_no': license, 'driver_lic_ex_date': exp, 'driver_id': id});

    request.files.add(
      await http.MultipartFile.fromPath('driver_lic_img', imgPath.path),
    );
    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        message('Updated successfully'); // Show success message to user
      } else {
        message('Something went wrong'); // Show error message to user
      }
    } catch (e) {
      message(
          'An error occurred. Please try again.'); // Show error message to user
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
