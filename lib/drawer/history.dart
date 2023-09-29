import 'dart:convert';

import 'package:car_bulao_driver/Api/Api_network.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../model/HistoryModel.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {

  late Future<HistoryModel> _futureHistory;

  @override
  void initState() {
    super.initState();
    history();
  }


  Future<HistoryModel> getHistory(Map<String, dynamic> map) async {
    Uri url = Uri.parse(Api_network.showBooking);

    try{
      final response = await http.post(url, body: map);
      if (response.statusCode == 200) {
        return HistoryModel.fromJson(jsonDecode(response.body));
      } else {
        return HistoryModel(message: "Somthing went wrong");
      }
    }
    catch(e){
      return HistoryModel(message: "Somthing went wrong");

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'History',
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
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.elliptical(10, 10),
                    ),
                    color: Color(0xff28a745),
                  ),
                  height: 60,
                  width: 160,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.drive_eta,
                        size: 40,
                        color: Colors.white,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Total Trip',
                            style: GoogleFonts.fahkwang(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '10',
                            style: GoogleFonts.aboreto(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
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
                  width: 160,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.monetization_on,
                        size: 40,
                        color: Colors.white,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Earned',
                            style: GoogleFonts.fahkwang(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '₹1000',
                            style: GoogleFonts.aboreto(
                              fontSize: 15,
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
          ),
          Expanded(
            child: FutureBuilder(
                future: _futureHistory,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text('Error: ${snapshot.error.toString()}'));
                  } else if (!snapshot.hasData) {
                    return Center(
                      child: Text("No Data available"),
                    );
                  } else {
                    final HistoryData = snapshot.data?.data ?? [];
                    return ListView.builder(
                        itemCount: snapshot.data?.data?.length,
                        itemBuilder: (BuildContext contex, int index) {

                          final history = HistoryData[index];
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: SizedBox(
                              height: 180,
                              child: Card(
                                elevation: 4,
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 15),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                      style:
                                                          GoogleFonts.fahkwang(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Level',
                                                      style:
                                                          GoogleFonts.fahkwang(
                                                        fontSize: 12,
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.normal,
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
                                                    fontSize: 12,
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.normal,
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
                                                fontWeight: FontWeight.normal,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Text(
                                               history.from.toString(),
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
                                                fontWeight: FontWeight.normal,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Text(
                                              history.to.toString(),
                                              style: GoogleFonts.fahkwang(
                                                fontSize: 13,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  }
                }),
          ),
        ],
      ),
    );
  }

  void history() {
    String userId = "1";

    Map<String, String> body = {
      "user_id": userId,
    };
    setState(() {
      _futureHistory = getHistory(body);
    });
  }
}
