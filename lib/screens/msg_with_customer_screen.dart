import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MsgWithCustomer extends StatefulWidget {
  const MsgWithCustomer({Key? key}) : super(key: key);

  @override
  State<MsgWithCustomer> createState() => _MsgWithCustomerState();
}

class _MsgWithCustomerState extends State<MsgWithCustomer> {
  List<String> chatMessages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Message',
          style: GoogleFonts.fahkwang(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff28a745),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: chatMessages.length,
                itemBuilder: (BuildContext context, int index) {
                  bool isUserMessage = index % 2 == 0;
                  String message = chatMessages[index];

                  return Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: isUserMessage
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        if (!isUserMessage)
                          Padding(
                            padding: EdgeInsets.all(4),
                            child: SizedBox(
                              height: 25,
                              width: 25,
                              child: Image.asset(
                                'assets/userpro.png',
                                height: 20,
                                width: 20,
                              ),
                            ),
                          ),
                        Container(
                          color:
                              isUserMessage ? Color(0xff28a745) : Colors.grey,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              message,
                              style: GoogleFonts.fahkwang(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                color:
                                    isUserMessage ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 40,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "type something...",
                      ),
                      onSubmitted: (text) {
                        setState(() {
                          chatMessages.add(text);
                        });
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        chatMessages.add("Hello! How can I help you?");
                      });
                    },
                    icon: Icon(Icons.send, color: Colors.green),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
