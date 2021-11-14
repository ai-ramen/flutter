import 'package:flutter/cupertino.dart';
//import 'package:final_project/pages/Home.dart';
import 'package:final_project/pages/login_page.dart';
//import 'package:final_project/pages/ForgotPassword.dart';
//import 'package:final_project/pages/Registration.dart';

final Map<String, WidgetBuilder> routes = {
  //Home.routeName: (BuildContext context) => Home(),
  Login.routeName: (BuildContext context) => const Login(),
  //Registration.routeName: (BuildContext context) => Registration(),
  //ForgotPassword.routeName: (BuildContext context) => ForgotPassword(),
  // SignInPage.routeName: (BuildContext context) => SignInPage(),
  // SignUpPage.routeName: (BuildContext context) => SignUpPage(),
};
