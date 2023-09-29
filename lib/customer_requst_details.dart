import 'package:car_bulao_driver/Api/Api_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:location/location.dart';


class CustomerRequestDetails extends StatefulWidget {
  const CustomerRequestDetails({Key? key}) : super(key: key);

  @override
  State<CustomerRequestDetails> createState() => _CustomerRequestDetailsState();
}

class _CustomerRequestDetailsState extends State<CustomerRequestDetails> {
  double currentLongitude = 0.0;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    final Location location = Location();
    try {
      final LocationData _locationResult = await location.getLocation();
      setState(() {
        currentLongitude = _locationResult.longitude ?? 0.0;
      });
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Customer Details',
          style: GoogleFonts.fahkwang(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff28a745),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          height: 40,
                          child: Image.asset(
                            'assets/userpro.png',
                            height: 50,
                          )),
                      Column(
                        children: [
                          Text(
                            ' User Name',
                            style: GoogleFonts.fahkwang(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Level',
                            style: GoogleFonts.fahkwang(
                              fontSize: 13,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "₹1000",
                        style: GoogleFonts.aboreto(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '25.04 KM',
                        style: GoogleFonts.fahkwang(
                          fontSize: 13,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'PICK UP',
                    style: GoogleFonts.fahkwang(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'Bhopal Station',
                    style: GoogleFonts.fahkwang(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'DROP OFF',
                    style: GoogleFonts.fahkwang(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'Dehli Station',
                    style: GoogleFonts.fahkwang(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            SizedBox(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TRIP FARE',
                    style: GoogleFonts.fahkwang(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Ticket Fare',
                            style: GoogleFonts.fahkwang(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '₹1010',
                            style: GoogleFonts.aboreto(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Discount',
                            style: GoogleFonts.fahkwang(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '₹100',
                            style: GoogleFonts.aboreto(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: GoogleFonts.fahkwang(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '₹1000',
                            style: GoogleFonts.aboreto(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () async {
                    final Uri uri = Uri(scheme: "tel", path: "+91xxxxxxxxxx");
                    if (await canLaunch(uri.toString())) {
                      await launch(uri.toString());
                    } else {
                      print("Can't launch");
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.elliptical(10, 10),
                      ),
                      color: Color(0xff28a745),
                    ),
                    height: 60,
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.call,
                              size: 30,
                              color: Colors.white,
                            ),
                            Text(
                              'Call',
                              style: GoogleFonts.fahkwang(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'msg_with_customer');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.elliptical(10, 10),
                      ),
                      color: Color(0xff28a745),
                    ),
                    height: 60,
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.message,
                              size: 30,
                              color: Colors.white,
                            ),
                            Text(
                              'Message',
                              style: GoogleFonts.fahkwang(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.elliptical(10, 10),
                    ),
                    color: Color(0xff28a745),
                  ),
                  height: 60,
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delete,
                            size: 30,
                            color: Colors.white,
                          ),
                          Text(
                            'Cancel',
                            style: GoogleFonts.fahkwang(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff28a745),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.elliptical(8, 8))),
              ),
              onPressed: () {
                Api_helper.onpenMap(currentLongitude, 23.237515);
                //  Navigator.pushNamed(context, 'pick_up');
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'GO TO PICK UP',
                  style: GoogleFonts.fahkwang(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
