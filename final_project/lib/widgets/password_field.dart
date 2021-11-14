import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController textEditingController;
  final bool obscureText;
  final void Function() onTap;
  //final Function validation;

  const PasswordField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.textEditingController,
    required this.obscureText,
    required this.onTap,
    //@required this.validation
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 22.5, right: 22.5, left: 22.5),
      child: TextFormField(
        controller: textEditingController,
        cursorColor: Colors.white,
        //keyboardType: textInputType,
        //validator: validation,
        decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(90, 90, 90, 1))),
          icon: const Icon(
            Icons.lock,
            color: Colors.white,
          ),
          contentPadding: const EdgeInsets.all(11.25),
          labelText: labelText,
          hintText: hintText,
          suffixIcon: GestureDetector(
          onTap: onTap,
          child: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
        ),
        ),
        style: const TextStyle(
          //using ARGB (Alpha Red Green Blue)
          color: Colors.white,
        ),
      ),
    );
  }
}
