
import 'package:Library/Api/api_controller.dart';
import 'package:Library/screen/components/lunch_button.dart';
import 'package:Library/screen/detile/pdf.dart';
import 'package:Library/service/constants.dart';
import 'package:Library/service/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'home/home_screen.dart';
class LunchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;
    return   Container(
             
             width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:AssetImage('assets/library.jpg'),
                  fit: BoxFit.cover
                )
              ),
              child: Column(
               children: <Widget>[
                 SizedBox(
                   height:MediaQuery.of(context).size.height *(0.25),
                 ),
                 Container(
                   decoration: BoxDecoration(
                     color: Colors.black12,
                     boxShadow: [
                       BoxShadow(
                         blurRadius: 40,
                         color: Colors.black54,
                       )
                     ]
                   ),
                  child: RichText(
                     text: TextSpan(
                       text: titleLunch,
                       style:TextStyle(
                         fontSize: SizeConfig.heightMulti*3.9,
                         fontWeight: FontWeight.bold,
                         fontStyle: FontStyle.italic,
                         
                       ),
                       children: [
                         TextSpan(
                           text: 'المعلوماتية',
                           style: TextStyle(
                             fontSize: SizeConfig.heightMulti*4.9,
                             color: Colors.red
                           )
                         )
                       ]
                     ),
                   ),
                 ),
                
                 Spacer(),
                 LunchButton(
                   press: (){
                   Navigator.of(context).push(MaterialPageRoute(
                       builder: (context)=>Home()
                     ));
                   },
                 ),
                 Padding(
                   padding: EdgeInsets.only(top: SizeConfig.heightMulti*2),
                   child: FlatButton(
                     onPressed: () {

                     },
                     child: Text('حول التطبيق',
                   style: TextStyle(
                 fontSize: SizeConfig.titleSize * 3.1,
                 color: Colors.white,
                 fontWeight: FontWeight.bold,
                 fontStyle: FontStyle.italic     
                 ),
                     ),
                   ),
                 ),
                 SizedBox(
                   height: SizeConfig.heightMulti *5,
                 )
               ],
                )
            );
  }
}