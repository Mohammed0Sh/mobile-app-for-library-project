import 'package:Library/Api/api_controller.dart';
import 'package:Library/screen/auth/component/input_field.dart';
import 'package:Library/screen/auth/component/login_button.dart';
import 'package:Library/screen/components/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FormZone extends StatefulWidget {
  final size;
  final isLogin;
  const FormZone({Key key, this.size, this.isLogin}) : super(key: key);

  @override
  _FormZoneState createState() => _FormZoneState();
}

class _FormZoneState extends State<FormZone> {
  bool cheakLog = false;
  @override
  Widget build(BuildContext context) {
    TextEditingController email, passowrd,lastName,email2;
    email = TextEditingController();
    passowrd = TextEditingController();
    if(!widget.isLogin){
      email2 = TextEditingController();
     lastName = TextEditingController();
    }
 
    return Container(
      child: (!cheakLog)
          ? SingleChildScrollView(
            padding: EdgeInsets.all(30),
                      child: Column(
                  children: <Widget>[
                    InputField(
                      size: widget.size,
                      controller: email,
                      lable:(widget.isLogin)? 'الايميل':'الاسم الأول',
                    ),
                    (!widget.isLogin)?
                     InputField(
                        textInputType: TextInputType.text,
                      size: widget.size,
                      controller: lastName,
                      lable:'الاسم الثاني ',
                    )   
                    :SizedBox.shrink(),
                   (!widget.isLogin)?
                     InputField(
                        textInputType: TextInputType.emailAddress,
                        
                      size: widget.size,
                      controller: email2,
                      lable:'الايميل',
                    )   
                    :SizedBox.shrink(),
                    InputField(
                      textInputType: TextInputType.text,
                      size: widget.size,
                      controller: passowrd,
                       lable: 'كلمة السر',
                       
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    LoginButton(
                      isLogin: (widget.isLogin)?true:false,
            size: widget.size,
            press: () async {
             
              if (email.text.trim().isEmpty ||
                  passowrd.text.trim().isEmpty ||(!widget.isLogin && (lastName.text.trim().isEmpty ||email2.text.trim().isEmpty ))) {
                showErrorDialog(context, 'كل الحقول مطلوبة', 'تنبيه');
              } else {
                setState(() {
                  cheakLog = !cheakLog;
                });

                // is Login

                if (widget.isLogin) {
                  dynamic res = await Future.delayed(
                      Duration(seconds: 2), () async {
                    return await ApiController()
                        .logIn(email.text, passowrd.text);
                  });

                  if (res != null) {
                    if (res == false) {
                      showErrorDialog(
                          context, 'تنبيه', 'الحساب غير موجود');
                      setState(() {
                        cheakLog = !cheakLog;
                      });
                    } else
                      Navigator.of(context).pop();
                  } else {
                    showErrorDialog(context, 'تنبيه', 'خطأ تقني');
                    setState(() {
                      cheakLog = !cheakLog;
                    });
                  }
                }

                // is Register

                else {
                  dynamic res = await Future.delayed(
                      Duration(seconds: 2), () async {
                    return await ApiController()
                        .register(email.text, lastName.text,email2.text,passowrd.text);
                  });

                  if (res != null) {
                    if (res == false) {
                      showErrorDialog(
                          context, 'تنبيه', 'لم يتم تسجيل الطلب');
                      setState(() {
                        cheakLog = !cheakLog;
                      });
                    } else{
                        Navigator.of(context).pop();
                        Fluttertoast.showToast(msg: 'تم ارسال طلب الانضمام',toastLength: Toast.LENGTH_LONG,);
                    }
                    
                  } else {
                    showErrorDialog(context, 'تنبيه', 'خطأ تقني');
                    setState(() {
                      cheakLog = !cheakLog;
                    });
                  }
                }
              }
            })
                  ],
                ),
          )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
