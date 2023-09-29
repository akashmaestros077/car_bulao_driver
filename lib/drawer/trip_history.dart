import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TripHistory extends StatefulWidget {
  const TripHistory({Key? key}) : super(key: key);

  @override
  State<TripHistory> createState() => _TripHistoryState();
}

class _TripHistoryState extends State<TripHistory> {

  bool isTab = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Trip History',
          style: GoogleFonts.fahkwang(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff28a745),
      ),
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            TabBar(
              isScrollable: true,
              indicatorColor: Color(0xff28a745),
              indicatorWeight: 3,
              labelColor: Color(0xff28a745),
              tabs: [
                Tab(text: "On-Going"),
                Tab(text: "Up-Coming"),
                Tab(text: "Completed"),
                Tab(text: 'Cancel'),
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                ListView.builder(
                    itemCount: 1,
                    itemBuilder: (BuildContext contex, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                          height: 180,
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
                                                fontWeight: FontWeight.normal,
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
                                            fontWeight: FontWeight.normal,
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
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                ListView.builder(
                    itemCount: 1,
                    itemBuilder: (BuildContext contex, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                          height: 180,
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
                                                fontWeight: FontWeight.normal,
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
                                            fontWeight: FontWeight.normal,
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
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                ListView.builder(
                    itemCount: 1,
                    itemBuilder: (BuildContext contex, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                          height: 180,
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
                                                fontWeight: FontWeight.normal,
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
                                            fontWeight: FontWeight.normal,
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
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                ListView.builder(
                    itemCount: 1,
                    itemBuilder: (BuildContext contex, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                          height: 180,
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
                                                fontWeight: FontWeight.normal,
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
                                            fontWeight: FontWeight.normal,
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
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
