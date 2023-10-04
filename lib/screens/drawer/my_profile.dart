import 'package:car_bulao_driver/Api/Api_helper.dart';
import 'package:car_bulao_driver/model/myProfileModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../SessionManager.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  late Future<MyProfileModel> _futureMyProfile;

  void initState() {
    // TODO: implement initState
    super.initState();
    _futureMyProfile = myProfile();
  }

  Future<MyProfileModel> myProfile() async {
    String userId = SessionManager.getUserId();
    Map<String, String> body = {'id': userId};
    return Api_helper().getProfile(body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: GoogleFonts.fahkwang(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff28a745),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'edit_profile_screen');
              },
              child: Text(
                'Edit',
                style: GoogleFonts.fahkwang(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<MyProfileModel>(
          future: _futureMyProfile,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Errors : ${snapshot.error.toString()}');
            } else if (!snapshot.hasData) {
              return Text('Data not available');
            } else {
              final profileData = snapshot.data?.editProfile;
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: CircleAvatar(
                        child: Image.network(profileData?.img.toString() ?? ""),
                      ),
                    ),
                    Divider(),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildProfile("Name",
                              profileData?.name.toString() ?? "Not Available"),
                          buildProfile("Email",
                              profileData?.email.toString() ?? "Not Available"),
                          buildProfile(
                              "Mobile",
                              profileData?.mobile.toString() ??
                                  'not available'),
                          buildProfile(
                              "Gender",
                              profileData?.gender.toString() ??
                                  'not available'),
                          buildProfile(
                              "Date Of Birth",
                              profileData?.dateOfB.toString() ??
                                  "Not Available"),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  buildProfile(String level, String value) {
    return SizedBox(
      height: 55,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            level,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
