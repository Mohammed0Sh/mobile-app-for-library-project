import 'package:Library/Api/api_controller.dart';
import 'package:Library/screen/components/error_dialog.dart';
import 'package:flutter/material.dart';

class BuildContentMoreDetile extends StatelessWidget {
  final List list;
  final String title;
  const BuildContentMoreDetile({
    Key key,
    this.list,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            ': ' + title,
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
              children: list.map((e) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                      child: ListTile(
                        trailing: (title == 'files')?IconButton(
                          icon:  Icon(Icons.file_download,color: Colors.red,size: 25,),
                          onPressed: ()async{
                      dynamic res = await ApiController().pdfDownLoad(e['name'],e['id']);
                      if(res!=null){
                        if(res){
                          showErrorDialog(context, 'تم التحميل','تنبيه ');
                        }else{
                           showErrorDialog(context, ' لم يتم التحميل ','تنبيه ');

                        }
                      }
                      else
                        showErrorDialog(context, ' خطأبالسيرفر','تنبيه ');

                          },
                        ):SizedBox.shrink(),
                        title:  Text((title == 'authors')
                          ? e['first_name'] + ' ' +e['last_name']+' : الاسم'
                          : e['name'],
                          
                          style: TextStyle(
                            fontSize: 20
                          ),
                          )
                      ),   )).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

