import 'package:Library/Api/api_controller.dart';
import 'package:Library/service/data_transfer.dart';
import 'package:flutter/material.dart';

class BuildContaiStep1 extends StatelessWidget {
  const BuildContaiStep1({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    List suggestion = [];
    
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)]),
      padding: EdgeInsets.all(20),
      alignment: Alignment.center,
      height: size.height * (0.6),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                "بيانات رئيسية",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 220,
                    child: TextField(
                      onChanged: (value) {
                        addItemResult['name'] = value;
                      },
                      textDirection: TextDirection.rtl,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5),
                          fillColor: Colors.black12,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          enabledBorder: InputBorder.none),
                    ),
                  ),
                  Text(
                    ': عنوان العنصر',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Text(
              " : وصف عن العنصر",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                onChanged: (value) {
                  addItemResult['desc'] = value;
                },
                minLines: 5,
                maxLines: 6,
                textDirection: TextDirection.rtl,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    fillColor: Colors.black12,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    enabledBorder: InputBorder.none),
              ),
            ),
            FutureBuilder(
              future: ApiController().allTags(),
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  suggestion = snapShot.data;
                  return Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                RaisedButton(
                                  child: Text('add tag'),
                                  onPressed: () => showSearch(
                                      context: context,
                                      delegate: AddTags(suggestion)),
                                ),
                                Text(
                                  " : اضافة كلمات بحث عن العنصر",
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black12
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                              child: ListView.builder(
                                itemCount: tags.length,
                                itemBuilder: (context,index){
                                  return Text(tags[index]+',');
                                } 
                                ),
                            )
                          ],
                        ),
                      ));
                } else if (snapShot.hasError) {
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
List tags=[];
class AddTags extends SearchDelegate<String> {
  final List list;

  AddTags(this.list);
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {},
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: AnimatedIcon(
        icon: AnimatedIcons.event_add,
        progress: this.transitionAnimation,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
  
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List suggestion = query.isEmpty
        ? list
        : list
            .where(
                (element) => element['name'].toString().startsWith(this.query))
            .toList();
    return ListView.builder(
        itemCount: suggestion.length,
        itemBuilder: (context, index) {
          return ListTile(
              onTap: () {
                query = suggestion[index]['name'];
            //   tags[index]=query.toString();
                Navigator.of(context).pop();
              },
              title: RichText(
                text: TextSpan(
                    style: TextStyle(
                        fontSize: 23,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    text: suggestion[index]['name']
                        .toString()
                        .substring(0, query.length),
                    children: [
                      TextSpan(
                          style: TextStyle(fontSize: 19, color: Colors.black45),
                          text: suggestion[index]['name']
                              .toString()
                              .substring(query.length))
                    ]),
              ));
        });
  }
}
