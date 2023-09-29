import 'dart:io';
import 'package:car_bulao_driver/Api/Api_network.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class IdentityCard extends StatefulWidget {
  const IdentityCard({super.key});

  @override
  State<IdentityCard> createState() => _IdentityCardState();
}

class _IdentityCardState extends State<IdentityCard> {
  TextEditingController carNumberController = TextEditingController();
  final ImagePicker imagePicker = ImagePicker();
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
                    controller: carNumberController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
                        borderSide: BorderSide(color: Color(0xff28a745)),
                      ),
                      labelText: "Identity Card Number",
                      prefixIcon: Icon(
                        Icons.newspaper_outlined,
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
                  editIdentityCard();
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

  Future<void> editIdentityCard() async {
    String cardNumber = carNumberController.text;
    File img = File(image!.path);

    if(cardNumber.isEmpty){
      return message("Enter Card Number");
    }
    if(img==null){
      return message("Select card image");
    }


    var request = http.MultipartRequest('POST',
        Uri.parse(Api_network.adharEdit));
    request.files
        .add(await http.MultipartFile.fromPath('Aadhaar_img', img.path));
    request.fields.addAll({
      'Aadhaar_no': cardNumber,
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      message('Updated successfully'); // Show success message to user

    } else {
      message('Something went wrong'); // Show error message to user
    }
  }

  pickImage(ImageSource source) async {
    XFile? xFileImage = await imagePicker.pickImage(source: source);
    if (xFileImage != null) {
      image = File(xFileImage.path);
      setState(() {});
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
