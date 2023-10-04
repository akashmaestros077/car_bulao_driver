import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:overlay_toast_message/overlay_toast_message.dart';
import 'login_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late GoogleMapController mapController;
  LocationData? _currentLocationData;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    final location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    final currentLocation = await location.getLocation();
    setState(() {
      _currentLocationData = currentLocation;
    });
  }

  bool isSwitch = false;
  bool isOffline = true;
  bool isRequest = false;
  bool isOffMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'CarBulao Driver',
          style: GoogleFonts.fahkwang(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xff28a745)),
        actions: [
          Switch(
            splashRadius: 0,

            activeColor: Colors.green,
            trackOutlineColor: MaterialStateProperty.all<Color>(Colors.white),
            // Your desired color
            value: isSwitch,
            onChanged: (value) {
              setState(() {
                isSwitch = value;

                if (isSwitch) {
                  isOffline = false;
                  isRequest = true;
                  isOffMode = false;
                  OverlayToastMessage.show(
                    context,
                    duration: Duration(seconds: 3),
                    widget: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.zero,
                        color: Colors.blue.shade50,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: 100,
                                child: Icon(
                                  Icons.sunny,
                                  size: 25,
                                  color: Colors.grey,
                                )),
                            Column(
                              children: [
                                Text(
                                  'Now Your Online!',
                                  style: GoogleFonts.acme(fontSize: 13),
                                ),
                                Text(
                                  ' accepting new Trip Request',
                                  style:
                                      GoogleFonts.palanquinDark(fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              });
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              onDetailsPressed: () {
                Navigator.pushNamed(context, 'my_profile');
              },
              decoration: BoxDecoration(
                color: Color(0xff28a745),
              ),
              accountName: Row(
                children: [
                  Text(
                    "Akash",
                    style: GoogleFonts.fahkwang(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              accountEmail: Text(
                "akash@gmail.com",
                style: GoogleFonts.fahkwang(
                    fontWeight: FontWeight.normal, fontSize: 13),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.asset('assets/user.png'),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Color(0xff28a745),
                size: 20,
              ),
              title: const Text(
                'Home',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    color: Colors.black38),
              ),
              onTap: () {
                Navigator.pushNamed(context, 'home');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.wallet,
                color: Color(0xff28a745),
                size: 20,
              ),
              title: const Text(
                'My Wallet',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    color: Colors.black38),
              ),
              onTap: () {
                Navigator.pushNamed(context, 'wallet');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.history,
                color: Color(0xff28a745),
                size: 20,
              ),
              title: const Text(
                'History',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    color: Colors.black38),
              ),
              onTap: () {
                Navigator.pushNamed(context, 'history');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.cases_rounded,
                color: Color(0xff28a745),
                size: 20,
              ),
              title: const Text(
                'Trip',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    color: Colors.black38),
              ),
              onTap: () {
                Navigator.pushNamed(context, 'trip_history');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.edit_document,
                color: Color(0xff28a745),
                size: 20,
              ),
              title: const Text(
                'Documents',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    color: Colors.black38),
              ),
              onTap: () {
                Navigator.pushNamed(context, 'documents');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.directions_car_outlined,
                color: Color(0xff28a745),
                size: 20,
              ),
              title: const Text(
                'Car Details',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    color: Colors.black38),
              ),
              onTap: () {
                Navigator.pushNamed(context, 'car_details');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.notification_add,
                color: Color(0xff28a745),
                size: 20,
              ),
              title: const Text(
                'Notification',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    color: Colors.black38),
              ),
              onTap: () {
                Navigator.pushNamed(context, 'my_notification');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.card_giftcard,
                color: Color(0xff28a745),
                size: 20,
              ),
              title: const Text(
                'Invite friends',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    color: Colors.black38),
              ),
              onTap: () {
                Navigator.pushNamed(context, 'invite_friends');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Color(0xff28a745),
                size: 20,
              ),
              title: const Text(
                ' Settings',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    color: Colors.black38),
              ),
              onTap: () {
                Navigator.pushNamed(context, 'settings');
              },
            ),
            Divider(),
            ListTile(
              leading: const Icon(
                Icons.logout,
                size: 20,
                color: Color(0xff28a745),
              ),
              title: const Text(
                'LogOut',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: Colors.black38,
                ),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("LogOut"),
                      content: Text(
                        'Are you sure want to Logout',
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
                          onPressed: () async {
                            SharedPreferences pref =
                                await SharedPreferences.getInstance();
                            pref.remove("email");
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (_) {
                              return Login();
                            }));
                          },
                          child: Text(
                            'Ok',
                            style: GoogleFonts.fahkwang(
                                color: Color(0xff28a745),
                                fontWeight: FontWeight.normal,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
        // ... (Your drawer code)
      ),
      body: Stack(children: [
        _currentLocationData != null
            ? GoogleMap(
          mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    _currentLocationData!.latitude!,
                    _currentLocationData!.longitude!,
                  ),
                  zoom: 15,
                ),
                onMapCreated: (GoogleMapController controller) {
                  mapController = controller;
                },
                markers: {
                  Marker(
                    markerId: MarkerId("currentLocation"),
                    position: LatLng(
                      _currentLocationData!.latitude!,
                      _currentLocationData!.longitude!,
                    ),
                    infoWindow: InfoWindow(title: 'Current Location'),
                  ),
                },
              )
            : Center(child: CircularProgressIndicator()),
        Positioned(
          bottom: 110,
          right: 10,
          child: IconButton(
              onPressed: () {
                _getCurrentLocation();
              },
              icon: Icon(
                Icons.my_location,
                color: Colors.green,
              )),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (isOffline || !isSwitch)
              Container(
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.zero,
                  color: Colors.blue.shade50,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 65,
                          child: Icon(
                            Icons.nights_stay_sharp,
                            size: 25,
                            color: Colors.grey,
                          )),
                      Column(
                        children: [
                          Text(
                            'Your Offline!',
                            style: GoogleFonts.acme(fontSize: 13),
                          ),
                          Text(
                            'Go Online to start accept new Trip Request',
                            style: GoogleFonts.palanquinDark(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            if (isOffMode || !isSwitch)
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      height: 200,
                      child: Card(
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                                fontSize: 12,
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
                                          'Earning',
                                          style: GoogleFonts.fahkwang(
                                            fontSize: 12,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Card(
                                color: Color(0xff28a745),
                                elevation: 10,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.access_time_outlined,
                                                size: 30,
                                                color: Colors.white70,
                                              ),
                                              Text(
                                                '10.2',
                                                style: GoogleFonts.fahkwang(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                  color: Colors.white70,
                                                ),
                                              ),
                                              Text(
                                                'Hours Online',
                                                style: GoogleFonts.fahkwang(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  color: Colors.white70,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.share_location_outlined,
                                                size: 30,
                                                color: Colors.white70,
                                              ),
                                              Text(
                                                '20 KM',
                                                style: GoogleFonts.fahkwang(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                  color: Colors.white70,
                                                ),
                                              ),
                                              Text(
                                                'Total Distance',
                                                style: GoogleFonts.fahkwang(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  color: Colors.white70,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.drive_eta,
                                                size: 30,
                                                color: Colors.white70,
                                              ),
                                              Text(
                                                '5',
                                                style: GoogleFonts.fahkwang(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                  color: Colors.white70,
                                                ),
                                              ),
                                              Text(
                                                'Total Trip',
                                                style: GoogleFonts.fahkwang(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  color: Colors.white70,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            if (isRequest && isSwitch)
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'customer_requst_details_screen');
                  },
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        height: 230,
                        child: Card(
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                  height: 40,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'PICK UP',
                                        style: GoogleFonts.fahkwang(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        'Bhopal Station',
                                        style: GoogleFonts.fahkwang(
                                          fontSize: 13,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          fontSize: 13,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          isRequest = false;
                                        });
                                      },
                                      child: Text(
                                        "Ignore",
                                        style: GoogleFonts.fahkwang(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Color(0xff28a745),
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xff28a745),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.elliptical(8, 8))),
                                      ),
                                      onPressed: () {},
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          'Accept',
                                          style: GoogleFonts.fahkwang(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ]),
    );
  }
}
