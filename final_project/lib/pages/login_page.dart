import 'package:flutter/material.dart';
import 'package:final_project/widgets/custom_textformfield.dart';
import 'package:final_project/pages/dash_board.dart';
import 'package:final_project/widgets/password_field.dart';
import 'package:final_project/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  static const String routeName = "login";

  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://images.fineartamerica.com/images/artworkimages/mediumlarge/3/blur-colorful-pastel-colors-background-mikhail-uliannikov.jpg'),
                  fit: BoxFit.fill),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 120),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(53, 55, 88, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(37.5),
                topRight: Radius.circular(37.5),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 90),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Welcome",
                    style: TextStyle(
                        fontSize: 17,
                        color: Color.fromRGBO(147, 148, 184, 1),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  CustomTextFormField(
                    labelText: "Email",
                    hintText: "Password",
                    iconData: Icons.email,
                    textEditingController: emailController,
                    textInputType: TextInputType.emailAddress,
                    //validation: validateEmail,
                  ),
                  PasswordField(
                    labelText: "Password",
                    hintText: "Enter your password",
                    textEditingController: passwordController,
                    obscureText: obscureText,
                    onTap: setPasswordVisibility,
                    //validation: validatePassword,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    margin: const EdgeInsets.only(top: 40, left: 30, right: 30),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(255, 87, 34, 1),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (emailController.text.isEmpty == false ||
                            passwordController.text.isEmpty == false) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Dashboard()));
                        } else {
                          debugPrint("Enter your email and password");
                        }
                      },
                      child: const Text(
                        "Log in",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    margin: const EdgeInsets.only(top: 40, left: 30, right: 30),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(10, 10, 38, 10),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      onPressed: () {
                        final provider = Provider.of<GoogleSignInProvider>(
                            context,
                            listen: false);
                        provider.googleLogin();
                      },
                      child: const Text(
                        "Sign in with Google",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void setPasswordVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}
