import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  ThemeMode _themeMode = ThemeMode.system;

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  bool isSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: GoogleFonts.fahkwang(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff28a745),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, 'privacy');
            },
            child: Text(
              'Privacy',
              style: GoogleFonts.fahkwang(
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, 'about_us');
            },
            child: Text(
              'About as',
              style: GoogleFonts.fahkwang(
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, 'contact_us');
            },
            child: Text(
              'Contact as',
              style: GoogleFonts.fahkwang(
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'Dark Theme',
                  style: GoogleFonts.fahkwang(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Switch(
                splashRadius: 0,

                activeTrackColor: Colors.green.shade200,
                activeColor: Colors.green,
                trackOutlineColor:
                    MaterialStateProperty.all<Color>(Colors.white),
                // Your desired color
                value: isSwitch,
                onChanged: (value) {
                  setState(() {
                    isSwitch = value;

                    if (isSwitch) {}
                  });
                },
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      "Delete Account",
                      style: GoogleFonts.fahkwang(
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                          color: Colors.red),
                    ),
                    content: Text(
                      'Are you sure want to Delete Account',
                      style: GoogleFonts.fahkwang(
                          fontWeight: FontWeight.normal, fontSize: 15),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Close the dialog
                        },
                        child: Text(
                          'Cancel',
                          style: GoogleFonts.fahkwang(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: Colors.red),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Perform logout logic here
                          Navigator.pop(context); // Close the dialog
                        },
                        child: Text(
                          'Ok',
                          style: GoogleFonts.fahkwang(
                              fontWeight: FontWeight.normal, fontSize: 15),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text(
              'Delete Account',
              style: GoogleFonts.fahkwang(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
