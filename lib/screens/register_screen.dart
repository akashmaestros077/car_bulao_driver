
import 'dart:io';

import 'package:car_bulao_driver/Api/Api_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController caridController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController driverLicenseController = TextEditingController();
  final TextEditingController drivingExpController = TextEditingController();
  final TextEditingController addController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();


  bool isRegister = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          'Register',
          style: GoogleFonts.fahkwang(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black87,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // Center content vertically
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: SizedBox(
                        height: 40,
                        child: TextField(
                          controller: caridController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(8, 8)),
                              borderSide: BorderSide(color: Color(0xff28a745)),
                            ),
                            labelText: 'Select Car Name',
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Color(0xff28a745),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(

                      height: 40,
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(8, 8)),
                            borderSide: BorderSide(color: Color(0xff28a745)),
                          ),
                          labelText: 'Name',
                          prefixIcon:
                              Icon(Icons.person, color: Color(0xff28a745)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: SizedBox(
                        height: 40,
                        child: TextField(
                          controller: mobileController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(8, 8)),
                              borderSide: BorderSide(color: Color(0xff28a745)),
                            ),
                            labelText: 'Mobile Number',
                            prefixIcon: Icon(
                              Icons.call,
                              color: Color(0xff28a745),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(8, 8)),
                            borderSide: BorderSide(color: Color(0xff28a745)),
                          ),
                          labelText: 'Email Address',
                          prefixIcon: Icon(
                            Icons.email,
                            color: Color(0xff28a745),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: SizedBox(
                        height: 40,
                        child: TextField(
                          controller: dobController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(8, 8)),
                              borderSide: BorderSide(color: Color(0xff28a745)),
                            ),
                            labelText: 'Date Of Birth',
                            prefixIcon: Icon(
                              Icons.calendar_month,
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
                          controller: driverLicenseController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(8, 8)),
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
                          controller: drivingExpController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(8, 8)),
                              borderSide: BorderSide(color: Color(0xff28a745)),
                            ),
                            labelText: "Driving Experience",
                            prefixIcon: Icon(
                              Icons.drive_eta,
                              color: Color(0xff28a745),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: SizedBox(
                        height: 40,
                        child: TextField(
                          controller: addController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(8, 8)),
                              borderSide: BorderSide(color: Color(0xff28a745)),
                            ),
                            labelText: 'Address',
                            prefixIcon: Icon(
                              Icons.wrong_location_rounded,
                              color: Color(0xff28a745),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: SizedBox(
                        height: 40,
                        child: TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(8, 8)),
                              borderSide: BorderSide(color: Color(0xff28a745)),
                            ),
                            labelText: 'Password',
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Color(0xff28a745),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: SizedBox(
                        height: 40,
                        child: TextField(
                          controller: confirmpasswordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.elliptical(8, 8)),
                              borderSide: BorderSide(color: Color(0xff28a745)),
                            ),
                            labelText: 'Confirm Password',
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Color(0xff28a745),
                            ),
                          ),
                        ),
                      ),
                    ),

                    isRegister
                        ? Center(child: CircularProgressIndicator())
                        : SizedBox(height: 40,width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff28a745),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(8, 8))),
                              ),
                              onPressed: () {
                                register();
                              },
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'Register',
                                  style: GoogleFonts.fahkwang(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                        ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'login_screen');
                        },
                        child: Text(
                          'Back To Login',
                          style: GoogleFonts.fahkwang(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color(0xff28a745),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void register() {
    String carid = caridController.text;
    String name = nameController.text;
    String email = emailController.text;
    String mobile = mobileController.text;
    String dob = dobController.text;
    String driverlicense = driverLicenseController.text;
    String drivingExp = drivingExpController.text;
    String address = addController.text;
    String password = passwordController.text;
    String confirmpassword = confirmpasswordController.text;

    if (carid.isEmpty) {
      message('Select Car');
      return;
    }
    if (name.isEmpty) {
      message('Enter Name');
      return;
    }
    if (email.isEmpty) {
      message('Enter Email');
      return;
    }
    if (mobile.isEmpty) {
      message('Enter Mobile Number');
      return;
    }
    if (dob.isEmpty) {
      message('Enter Date Of Birth');
      return;
    }
    if (driverlicense.isEmpty) {
      message('Enter Driving License');
      return;
    }
    if (drivingExp.isEmpty) {
      message('Enter Driving Exp');
      return;
    }
    if (address.isEmpty) {
      message('Enter Address');
      return;
    }
    if (password.isEmpty) {
      message('Enter Password');
      return;
    }
    if (confirmpassword.isEmpty) {
      message('Enter Password');
      return;
    }
    setState(() {
      isRegister = true;
    });

    Map<String, String> body = {
      'car_name': carid,
      'driver_name': name,
      'mobile': mobile,
      'email': email,
      'dob': dob,
      'license_number': driverlicense,
      'experience': drivingExp,
      'address': address,
      'password': password,
      're_password' : confirmpassword,
    };

    Api_helper.Register(body).then((value) {
      setState(() {
        isRegister = false;
      });
      if (value.message == "Register successfully") {
        message("Signup Successfull");
        Navigator.pushNamed(context, 'login_screen');
        return;
      } else {
        message(value.message.toString());
        return;
      }
    });
  }

  void message(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.black,
    ));
  }
}


