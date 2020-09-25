import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Function press;
  final isLogin;
  const LoginButton({
    Key key,
    @required this.size, this.press, this.isLogin,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 10,
      shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(30)),
      fillColor: Colors.deepOrange,
      onPressed:press,
      child: Container(
        alignment: Alignment.center,
        height: 60,
        width: size.width * (.5),
        child: Text(
          (isLogin)?
          'دخول':'ارسال الطلب',
          style: TextStyle(
              letterSpacing: 1,
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
