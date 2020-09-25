
import 'package:flutter/material.dart';
import 'component/app_bar_zone.dart';
import 'component/custom_clipper.dart';
import 'component/form_zone.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      body: Container(
        child: Column(
          children: <Widget>[
            ClipPath(
              clipper: CustomClip(),
              child: Container(
                width: size.width,
                height: size.height * (0.55),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/library.jpg'),
                        fit: BoxFit.cover)),
                child: Align(
                  alignment: Alignment.topRight,
                  child: AppBarZone(title: 'login',),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: FormZone(size: size,isLogin: true,),
            ),
          ],
        ),
      ),
    );
  }
}

