import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class CarDetails extends StatefulWidget {
  const CarDetails({super.key});

  @override
  State<CarDetails> createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
  bool isVisibility = true;
  final ImagePicker imagePicker = ImagePicker();
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Car Details",
          style: GoogleFonts.fahkwang(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xff28a745),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
              visible: isVisibility,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    child: SizedBox(
                      height: 30,
                      child: Image.asset(
                        'assets/car.png',
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Car Name',
                        style: GoogleFonts.fahkwang(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "car number",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          isVisibility = false;
                        });
                      },
                      child: Text("Edit Details")),
                ],
              ),
            ),
            Visibility(
              visible: !isVisibility,
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
                      SizedBox(height: 5,),
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
                              Icon(Icons.camera_alt,size: 25,color: Colors.green),
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
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(8, 8)),
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
                    height: 45,width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff28a745),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(8, 8))),
                      ),
                      onPressed: () {
                        setState(() {
                          isVisibility = true;
                        });
                      },
                      child: Padding(
                        padding:  EdgeInsets.all(10),
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
          ],
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
}
