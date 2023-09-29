import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class InviteFriends extends StatefulWidget {
  const InviteFriends({Key? key}) : super(key: key);

  @override
  State<InviteFriends> createState() => _InviteFriendsState();
}

class _InviteFriendsState extends State<InviteFriends> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Invite Friends',
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
          Image(
            image: AssetImage('assets/refer.jpg'),
            height: 200,
            width: 400,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff28a745),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.elliptical(8, 8))),
            ),
            onPressed: () {
              Share.share('https://CarBulao.com', subject: 'carbulao.com');
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Share',
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
    );
  }
}
