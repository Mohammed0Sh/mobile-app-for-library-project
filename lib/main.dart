
import 'package:Library/screen/lunch_screen.dart';
import 'package:flutter/material.dart';
import 'service/size_config.dart';

void main() {

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context,constraint){
        SizeConfig().init(constraint);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
         title: 'مكتبة المعلوماتية',
         theme: ThemeData(
           primaryColor: Colors.brown,
           
         ),
         home: LunchScreen(),
          );
      },
      
    );
  }
}
