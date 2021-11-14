import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData iconData;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  //final Function validation;

  const CustomTextFormField(
      {Key? key,
      required this.labelText,
      required this.hintText,
      required this.iconData,
      required this.textEditingController,
      required this.textInputType
      //,required this.validation
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 22.5, right: 22.5, left: 22.5),
      child: TextFormField(
        controller: textEditingController,
        cursorColor: Colors.white,
        keyboardType: textInputType,
        //validator: validation,
        decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(90, 90, 90, 1))),
          icon: const Icon(
            Icons.email,
            color: Colors.white,
          ),
          contentPadding: const EdgeInsets.all(11.25),
          labelText: labelText,
          hintText: hintText,
        ),
        style: const TextStyle(
          //using ARGB (Alpha Red Green Blue)
          color: Colors.white,
        ),
      ),
    );
  }
}
