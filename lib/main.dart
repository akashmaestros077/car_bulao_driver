import 'dart:io';

import 'package:car_bulao_driver/screens/drop_off_screen.dart';
import 'package:car_bulao_driver/screens/edit_profile_screen.dart';
import 'package:car_bulao_driver/screens/forgot_password_screen.dart';
import 'package:car_bulao_driver/screens/login_screen.dart';
import 'package:car_bulao_driver/screens/msg_with_customer_screen.dart';
import 'package:car_bulao_driver/screens/pick_up_screen.dart';
import 'package:car_bulao_driver/screens/register_screen.dart';
import 'package:car_bulao_driver/screens/save_password_screen.dart';
import 'package:car_bulao_driver/screens/drawer/CarDetails_Screens/car_details.dart';
import 'package:car_bulao_driver/screens/drawer/documents_screens/documents.dart';
import 'package:car_bulao_driver/screens/drawer/documents_screens/driving.dart';
import 'package:car_bulao_driver/screens/drawer/documents_screens/identity_card.dart';
import 'package:car_bulao_driver/screens/drawer/history.dart';
import 'package:car_bulao_driver/screens/drawer/invite_friends.dart';
import 'package:car_bulao_driver/screens/drawer/my_notification.dart';
import 'package:car_bulao_driver/screens/drawer/my_profile.dart';
import 'package:car_bulao_driver/screens/drawer/settings.dart';
import 'package:car_bulao_driver/screens/drawer/trip_history.dart';
import 'package:car_bulao_driver/screens/drawer/wallet.dart';
import 'package:car_bulao_driver/screens/settings_screens/about_us.dart';
import 'package:car_bulao_driver/screens/settings_screens/contact_us.dart';
import 'package:car_bulao_driver/screens/settings_screens/privacy.dart';
import 'package:flutter/material.dart';

import 'SessionManager.dart';
import 'screens/customer_requst_details_screen.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SessionManager.init();
  bool isLoggedIn = SessionManager.isLoggedIn();
  runApp(MyApp(isLoggedIn: isLoggedIn));
  HttpOverrides.global = MyHttpOverrides();
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
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
        'register_screen': (context) => Register(),
        'login_screen': (context) => Login(),
        'forgot_password_screen': (context) => ForgotPassword(),
        'save_password_screen': (context) => SavePassword(),
        'home_screen': (context) => Home(),
        'my_profile': (context) => MyProfile(),
        'history': (context) => History(),
        'customer_requst_details_screen': (context) => CustomerRequestDetails(),
        'wallet': (context) => Wallet(),
        'settings': (context) => Settings(),
        'invite_friends': (context) => InviteFriends(),
        'pick_up_screen': (context) => PickUp(),
        'drop_off_screen': (context) => DropOff(),
        'privacy': (context) => Privacy(),
        'about_us': (context) => AboutUs(),
        'my_notification': (context) => MyNotification(),
        'contact_us': (context) => ContactUs(),
        'edit_profile_screen': (context) => EditProfile(),
        'msg_with_customer_screen': (context) => MsgWithCustomer(),
        'trip_history': (context) => TripHistory(),
        'documents': (context) => Documents(),
        'driving': (context) => DrivingLicense(),
        'identity_card': (context) => IdentityCard(),
        'car_details': (context) => CarDetails(),
      },
    );
  }
}
