// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class Notificationn extends StatelessWidget {

//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

//   @override
//   void initState() { 
    
//     flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();
//     var android=AndroidInitializationSettings('@mipmap/ic_launcher');
//     var ios=IOSInitializationSettings();
//     var iniSetting=InitializationSettings(android,ios);
//     flutterLocalNotificationsPlugin.initialize(iniSetting,onSelectNotification: _onSelectNotification);
    
//   }

//   Future showNotification() async{
//     var androidDetile=AndroidNotificationDetails('channalId','channalName','channalDesc',priority: Priority.Default);
//     var iosDetile=IOSNotificationDetails();
//     var notificationDetails=NotificationDetails(androidDetile,iosDetile);
//     flutterLocalNotificationsPlugin.show(0, 'title', 'content',notificationDetails,payload: 'payload');
//   }

//   Future _onSelectNotification(payload)async{
//     return await payload;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//        backgroundColor: Colors.blue,
//        body: Container(
//          child: RaisedButton(
//            child: Text("Login"),
//            onPressed: ()async{
//             await showNotification();
//            },
//          ),
//        ),
//     );
//   }
// }