import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import '../../../Api/Api_network.dart';
import '../../../SessionManager.dart';

class AddCarDetails extends StatefulWidget {
  const AddCarDetails({super.key});

  @override
  State<AddCarDetails> createState() => _AddCarDetailsState();
}

class _AddCarDetailsState extends State<AddCarDetails> {
  TextEditingController carName = TextEditingController();
  TextEditingController carModel = TextEditingController();
  TextEditingController fuelType = TextEditingController();
  TextEditingController licenseplatenum = TextEditingController();
  TextEditingController numofSeat = TextEditingController();

  bool isVisibility = true;
  final ImagePicker imagePicker = ImagePicker();
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Car Details Add",
          style: GoogleFonts.fahkwang(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xff28a745),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 150,
                      child: Image(
                        image: image != null
                            ? FileImage(image!)
                            : AssetImage("assets/drivinglicence.png")
                                as ImageProvider<Object>,
                        height: 150,
                        width: 300,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        pickImage(ImageSource.gallery);
                      },
                      child: SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "add image ",
                              style: GoogleFonts.fahkwang(
                                  fontSize: 15, color: Color(0xff28a745)),
                            ),
                            Icon(Icons.camera_alt,
                                size: 25, color: Colors.green),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  child: TextField(
                    controller: carName,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
                        borderSide: BorderSide(color: Color(0xff28a745)),
                      ),
                      labelText: "Car Name",
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      controller: carModel,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(8, 8)),
                          borderSide: BorderSide(color: Color(0xff28a745)),
                        ),
                        labelText: "Car Model",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      controller: fuelType,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(8, 8)),
                          borderSide: BorderSide(color: Color(0xff28a745)),
                        ),
                        labelText: "Fuel Type",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      controller: licenseplatenum,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(8, 8)),
                          borderSide: BorderSide(color: Color(0xff28a745)),
                        ),
                        labelText: "License plate number ",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      controller: numofSeat,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(8, 8)),
                          borderSide: BorderSide(color: Color(0xff28a745)),
                        ),
                        labelText: "Number of Seats",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff28a745),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(8, 8))),
                    ),
                    onPressed: () {
                      addCarDetails();
                    },
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'ADD',
                        style: GoogleFonts.fahkwang(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
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

  pickImage(ImageSource source) async {
    XFile? xFileImage = await imagePicker.pickImage(source: source);
    if (xFileImage != null) {
      image = File(xFileImage.path);
      setState(() {});
    }
  }

  Future<void> addCarDetails() async {
    String carname = carName.text;
    String carmodel = carModel.text;
    String fuel = fuelType.text;
    String license = licenseplatenum.text;
    String numseat = numofSeat.text;
    String userId = SessionManager.getUserId();
    File img = File(image!.path);
    String km = '20';

    if (null == img) {
      message("Select Image");
      return;
    }
    if (carname.isEmpty) {
      message("Enter car Name");
      return;
    }
    if (carmodel.isEmpty) {
      message("Enter Car Model Name");
      return;
    }
    if (fuel.isEmpty) {
      message("Enter Fuel Type");
      return;
    }
    if (license.isEmpty) {
      message("Enter License Plate Number");
      return;
    }
    if (numseat.isEmpty) {
      message("Enter Number Of Seats");
      return;
    }

    var request =
        http.MultipartRequest('POST', Uri.parse(Api_network.addCarDetails));
    request.files.add(await http.MultipartFile.fromPath('image', img.path));
    request.fields.addAll({
      "name": carname,
      "price": "299",
      "car_modal": carmodel,
      "fuel_type": fuel,
      "license_plate_number": license,
      "number_of_seats": numseat,
      "owner_id": userId,
      "km": km,
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      message('Updated successfully');
      Navigator.pushNamed(context, "car_details");
    } else {
      message('Something went wrong');
    }
  }

  void message(String s) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(s)));
  }
}
