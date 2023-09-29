import 'dart:io';

import 'package:car_bulao_driver/customer_requst_details.dart';
import 'package:car_bulao_driver/drawer/CarDetails/car_details.dart';
import 'package:car_bulao_driver/drawer/documents/documents.dart';
import 'package:car_bulao_driver/drawer/documents/driving.dart';
import 'package:car_bulao_driver/drawer/documents/identity_card.dart';
import 'package:car_bulao_driver/drawer/history.dart';
import 'package:car_bulao_driver/drawer/invite_friends.dart';
import 'package:car_bulao_driver/drawer/my_notification.dart';
import 'package:car_bulao_driver/drawer/settings.dart';
import 'package:car_bulao_driver/drawer/trip_history.dart';
import 'package:car_bulao_driver/drawer/wallet.dart';
import 'package:car_bulao_driver/drop_off.dart';
import 'package:car_bulao_driver/edit_profile.dart';
import 'package:car_bulao_driver/forgot_password.dart';
import 'package:car_bulao_driver/login.dart';
import 'package:car_bulao_driver/drawer/my_profile.dart';
import 'package:car_bulao_driver/msg_with_customer.dart';
import 'package:car_bulao_driver/pick_up.dart';
import 'package:car_bulao_driver/register.dart';
import 'package:car_bulao_driver/save_password.dart';
import 'package:car_bulao_driver/settings/about_us.dart';
import 'package:car_bulao_driver/settings/contact_us.dart';
import 'package:car_bulao_driver/settings/privacy.dart';
import 'package:flutter/material.dart';

import 'SessionManager.dart';
import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SessionManager.init();
  bool isLoggedIn = SessionManager.isLoggedIn();
  runApp(MyApp(isLoggedIn: isLoggedIn));
  HttpOverrides.global = MyHttpOverrides();

}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({Key? key, required this.isLoggedIn}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'carBulaoDriver app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xff28a745),
        ),
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: isLoggedIn ? Home() : Login(),
      routes: {
        'register': (context) => Register(),
        'login': (context) => Login(),
        'forgot_password': (context) => ForgotPassword(),
        'save_password': (context) => SavePassword(),
        'home': (context) => Home(),
        'my_profile': (context) => MyProfile(),
        'history': (context) => History(),
        'customer_requst_details': (context) => CustomerRequestDetails(),
        'wallet': (context) => Wallet(),
        'settings': (context) => Settings(),
        'invite_friends': (context) => InviteFriends(),
        'pick_up': (context) => PickUp(),
        'drop_off': (context) => DropOff(),
        'privacy': (context) => Privacy(),
        'about_us': (context) => AboutUs(),
        'my_notification': (context) => MyNotification(),
        'contact_us': (context) => ContactUs(),
        'edit_profile' : (context) => EditProfile(),
        'msg_with_customer': (context) => MsgWithCustomer(),
        'trip_history': (context) => TripHistory(),
        'documents' : (context) => Documents(),
        'driving' : (context) => DrivingLicense(),
        'identity_card' : (context) => IdentityCard(),
        'car_details' : (context) => CarDetails(),
      },
    );
  }
}
