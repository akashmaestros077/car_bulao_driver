import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';

class PickUp extends StatefulWidget {
  const PickUp({Key? key}) : super(key: key);

  @override
  State<PickUp> createState() => _PickUpState();
}

class _PickUpState extends State<PickUp> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Pick Up',
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
          children: [],
        )
    );
  }
}
