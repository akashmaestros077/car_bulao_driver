import 'dart:io';
import 'package:car_bulao_driver/Api/Api_helper.dart';
import 'package:car_bulao_driver/SessionManager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../model/showCarModel.dart';

class CarDetails extends StatefulWidget {
  const CarDetails({super.key});

  @override
  State<CarDetails> createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
  TextEditingController carName = TextEditingController();
  TextEditingController carModel = TextEditingController();
  TextEditingController fuelType = TextEditingController();
  TextEditingController licenseplatenum = TextEditingController();
  TextEditingController numofSeat = TextEditingController();

  bool isVisibility = true;
  final ImagePicker imagePicker = ImagePicker();
  File? image;

  late Future<showCarModel> showcar_future;

  void initState() {
    super.initState();
    showcar_future = showCarDetails();
  }

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
            Expanded(
              child: FutureBuilder<showCarModel>(
                  future: showcar_future,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Text("Errors ${snapshot.hasError}");
                    } else if (!snapshot.hasData) {
                      return Text("Data not found");
                    } else {
                      final showData = snapshot.data?.carData;
                      return ListView.builder(
                          itemCount: showData?.length,
                          itemBuilder: (BuildContext context, int index) {
                            final car = showData?[index];
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  child: SizedBox(
                                    height: 30,
                                    child: Image.network(
                                      car?.image.toString() ?? "",
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      car?.name.toString() ?? " ",
                                      style: GoogleFonts.fahkwang(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      car?.licensePlateNumber.toString() ?? " ",
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
                                      Navigator.pushNamed(context, "add_car_details_screen");
                                      setState(() {
                                        isVisibility = false;
                                      });
                                    },
                                    child: Text("Edit Details")),
                              ],
                            );
                          });
                    }
                  }),
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


  void message(String s) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(s)));
  }

  Future<showCarModel> showCarDetails() async {
    String userId = SessionManager.getUserId();
    Map<String, String> body = {
      'owner_id': userId,
    };
    return Api_helper().ShowCar(body);
  }
}
