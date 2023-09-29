import 'package:car_bulao_driver/Api/Api_helper.dart';
import 'package:car_bulao_driver/SessionManager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/documentsModel.dart';

class Documents extends StatefulWidget {
  const Documents({Key? key}) : super(key: key);

  @override
  State<Documents> createState() => _DocumentsState();
}

class _DocumentsState extends State<Documents> {

  late Future< documentsModel> _future ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Documents',
          style: GoogleFonts.fahkwang(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff28a745),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: (){
              Navigator.pushNamed(context,'driving');
            },
            child: Padding(
              padding:EdgeInsets.symmetric(horizontal: 15,vertical: 20),
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        (Image.asset('assets/drivinglicence.png',height: 150,width: double.infinity,)),
                        Text(
                          "Driving License",
                          style: GoogleFonts.fahkwang(
                              fontSize: 15, color: Color(0xff28a745)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding:EdgeInsets.symmetric(horizontal: 15,vertical: 20),
            child: InkWell(
              onTap: (){
                Navigator.pushNamed(context,'identity_card');
              },
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        (Image.asset('assets/identification.png',height: 150,width: double.infinity,)),
                        Text(
                          "Identification Cards",
                          style: GoogleFonts.fahkwang(
                              fontSize: 15, color: Color(0xff28a745)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

