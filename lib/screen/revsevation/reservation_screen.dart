import 'package:Library/Api/api_controller.dart';
import 'package:Library/screen/components/error_dialog.dart';
import 'package:Library/screen/revsevation/component/list_of_reservation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Reservation extends StatelessWidget {
  String title;
  Function apiFunction;
  final isReservation;
  Reservation(this.title, this.apiFunction, this.isReservation);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: FutureBuilder(
            future: Future.delayed(Duration(seconds: 2), () => apiFunction()),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
             
                return BuildListReservation(
                  list: snapshot.data,
                  isReservation: isReservation,
                );
              } else if (snapshot.hasError) {
                return showErrorDialog(context, 'خطأ بالاتصال', 'aaaaaa');
              } else {
                return SpinKitCircle(
                  color: Colors.orangeAccent,
                  size: 65,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
