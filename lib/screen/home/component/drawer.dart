import 'package:Library/Api/api_controller.dart';
import 'package:Library/screen/addition/addition_screen.dart';
import 'package:Library/screen/auth/login_page.dart';
import 'package:Library/screen/auth/register_page.dart';
import 'package:Library/screen/home/home_screen.dart';
import 'package:Library/screen/items/items_screen.dart';
import 'package:Library/screen/revsevation/reservation_screen.dart';
import 'package:Library/service/constants.dart';
import 'package:Library/service/data_transfer.dart';
import 'package:flutter/material.dart';

class Drawer_block extends StatelessWidget {
  const Drawer_block({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange.shade300, Colors.white],
          ),
        ),
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              accountName: Text(
                (sharedPrefrences != null)
                    ? sharedPrefrences.email
                    : "no login",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.person),
              trailing: Icon(Icons.arrow_forward_ios),
              title: Text(
                "معلوماتي",
                style: KlistTileDrawer,
              ),
            ),
            ListTile(
              onTap: () {
                (sharedPrefrences == null)
                    ? Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginPage()))
                    : Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Reservation('حجوزاتي',
                            () => ApiController().getReservation(), true)));
              },
              leading: Icon(Icons.block),
              trailing: Icon(Icons.arrow_forward_ios),
              title: Text("حجوزاتي", style: KlistTileDrawer),
            ),
            ListTile(
              onTap: () {
                (sharedPrefrences == null)
                    ? Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginPage()))
                    : Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ItemScreen('عناصرك المفضلة',
                            () => ApiController().getFavorate())));
              },
              leading: Icon(Icons.favorite),
              trailing: Icon(Icons.arrow_forward_ios),
              title: Text("مفضلات", style: KlistTileDrawer),
            ),
            ListTile(
              onTap: () {
                (sharedPrefrences == null)
                    ? Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginPage()))
                    : Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Reservation('استعاراتي',
                            () => ApiController().getBorrow(), false)));
              },
              leading: Icon(Icons.restore),
              trailing: Icon(Icons.arrow_forward_ios),
              title: Text("استعاراتي", style: KlistTileDrawer),
            ),
            ListTile(
              onTap: () {
                (sharedPrefrences == null)
                    ? Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginPage()))
                    : Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Addition()));
              },
              leading: Icon(Icons.add),
              trailing: Icon(Icons.arrow_forward_ios),
              title: Text("طلب اضافة عنصر", style: KlistTileDrawer),
            ),

            ListTile(
              onTap: (){
              Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => RegisterPage()));
              },
              leading: Icon(Icons.verified_user),
              trailing: Icon(Icons.arrow_forward_ios),
              title: Text("طلب تسجيل عضوية", style: KlistTileDrawer),
            ),

            (sharedPrefrences == null)
                ? ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    leading: Icon(Icons.vpn_key),
                    trailing: Icon(Icons.arrow_forward_ios),
                    title: Text("تسجيل دخول", style: KlistTileDrawer),
                  )
                : ListTile(
                    onTap: () async {
                      await ApiController().logOut();
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    leading: Icon(Icons.vertical_align_top),
                    trailing: Icon(Icons.arrow_forward_ios),
                    title: Text("تسجل خروج", style: KlistTileDrawer),
                  ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
              },
              leading: Icon(Icons.close),
              title: Text(
                "اغلاق",
                style: KlistTileDrawer,
              ),
            )
          ],
        ),
      ),
    );
  }
}
