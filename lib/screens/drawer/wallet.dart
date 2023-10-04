import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wallet',
          style: GoogleFonts.fahkwang(
            fontWeight: FontWeight.normal,
            fontSize: 20,
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
          Container(
            height: 120,
            width: double.infinity,
            color: Color(0xff28a745),
            child: SizedBox(
              height: 150,
              child: Column(
                children: [
                  Text(
                    'Total Balance',
                    style: GoogleFonts.fahkwang(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '₹1000',
                    style: GoogleFonts.aboreto(
                      fontWeight: FontWeight.normal,
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade50,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.elliptical(8, 8))),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, 'home');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Withdrawal',
                            style: GoogleFonts.fahkwang(
                              fontSize: 15,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Card(
              color: Colors.green.shade50,
              elevation:10,

              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.elliptical(6, 6))),
              child: SizedBox(
                height: 80,width: 270,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
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
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            "₹1000",
                            style: GoogleFonts.aboreto(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              'PAYMENT HISTORY',
              style: GoogleFonts.fahkwang(
                fontSize: 15,
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext contex, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: SizedBox(
                      height: 80,
                      child: Card(
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "₹1000",
                                    style: GoogleFonts.aboreto(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
