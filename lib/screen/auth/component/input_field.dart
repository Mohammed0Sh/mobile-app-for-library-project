import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextInputType textInputType;
  const InputField({
    Key key,
    @required this.size,
    @required this.controller, this.lable, this.textInputType,
  }) : super(key: key);

  final String lable;
  final  size;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      height: 70,
      width: size.width * (0.8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                blurRadius: 30,
                color: Colors.black26,
                offset: Offset(0, 5))
          ]),
      child: TextFormField(
        keyboardType: textInputType,
        controller: controller,
        obscureText: (lable  =='كلمة السر')?true:false,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          labelText: lable,
          labelStyle: TextStyle(color: Colors.black38),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
      ),
    );
  }
}
