import 'package:car_bulao_driver/Api/Api_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact Us',
          style: GoogleFonts.fahkwang(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff28a745),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 45,
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
                        borderSide: BorderSide(color: Color(0xff28a745)),
                      ),
                      labelText: 'Full Name',
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 45,
                  child: TextField(
                    controller: mobileController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
                        borderSide: BorderSide(color: Color(0xff28a745)),
                      ),
                      labelText: 'mobile number',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: SizedBox(
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
                ),
                SizedBox(
                  height: 160,
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
                        borderSide: BorderSide(color: Color(0xff28a745)),
                      ),
                      labelText: 'Message*',
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff28a745),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.elliptical(8, 8))),
                  ),
                  onPressed: () {
                    contactUs();
                    //Navigator.pushNamed(context, 'home');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
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

  void contactUs() {
    String name = nameController.text;
    String email = emailController.text;
    String mobile = mobileController.text;
    String msg = messageController.text;

    if (name.isEmpty) {
      return message("Enter Full Name");
    }
    if(mobile.isEmpty){
      return message("Enter Mobile Number");
    }
    if(email.isEmpty){
      return message("Enter Email Address");
    }
    if(msg.isEmpty){
      return message("Enter a message");
    }

    setState(() {

    });

    Map<String,String> body = {
      "name" : name,
      "contact" : mobile,
      "email": email,
      "description" : msg,
    };

    Api_helper().contactUs(body).then((value){
      if(value.message=="contact successfully"){
        message("contact successfully");

      }
      else{
        message(value.message.toString());
      }
    });
  }

  void message(String s) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(s,
      style: TextStyle(
        color: Colors.white,
      ),
    )));
  }
}
