import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:Library/model/user.dart';
import 'package:Library/service/data_transfer.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ApiController {
  final String serverUlr = 'http://192.168.43.144/laravel_project/public/api/';

  static User user = null;

  /// auth operations

  Future<bool> logIn(String email, String password) async {
    String url = 'http://192.168.43.144/laravel_project/public/api/login';
    try {
      http.Response response =
          await http.post(url, body: {'email': email, 'password': password});
      Map res = json.decode(response.body);
      if (res['status'] == true) {
        String token = res['user']['api_token'].toString();

        User u = User(email, password, token);
        await _saveUser(u);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return null;
    }
  }
    Future<bool> register(String firstName, String lastName,String email,String password) async {
    String url ='http://192.168.43.144/laravel_project/public/api/register';
   
    try {
      http.Response response =
          await http.post(url, body: {'first_name': firstName, 'last_name': lastName,
          'email':email,'password':password
          });
      Map res = json.decode(response.body);
      if (res['status'] == true) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return null;
    }
  }

  Future<User> logOut() async {
    User user = await reedUser();
    if (user == null) {
    
    } else {
      sharedPrefrences = null;
    }
  }

  /////  save and reed user by shaeshared preferences
  Future<void> _saveUser(user) async {
    try {
      sharedPrefrences = user;
      // final sharedPre = await SharedPreferences.getInstance();
      // sharedPre.setString('keyT', user);

    } catch (e) {}
  }

  Future<User> reedUser() async {
    try {
      //   final sharedPre = await SharedPreferences.getInstance();
      //  user  = sharedPre.getString('keyT') ?? null;
      //   return user;

      return sharedPrefrences;
    } catch (e) {
      return null;
    }
  }

  Future<Map> filters() async {
    String url = serverUlr + 'filters';
    try {
      http.Response response = await http.get(url);
      Map res = json.decode(response.body);
      if (!res.isEmpty)
        return res;
      else
        return {};
    } catch (e) {
      return null;
    }
  }

  Future<Map> storeExtendBorrow(id,String day) async {
    String url = serverUlr + 'storeExtendBorrow';
    try {
      http.Response response = await http.post(url, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${sharedPrefrences.token}'
      }, body: {
        'borrow_id':id.toString(),
        'day': day.toString()
      });
      Map res = json.decode(response.body);
      
      if (!res.isEmpty)
        return res;
      else
        return {};
    } catch (e) {
      return null;
    }
  }



  Future<List> items() async {
    String url = serverUlr + 'index';
    try {
      http.Response response = await http.get(url);
      List res = json.decode(response.body);
      if (!res.isEmpty)
        return res;
      else
        return [];
    } catch (e) {
      return null;
    }
  }

  Future<List> search() async {
    String url = 'http://192.168.43.144/laravel_project/public/api/search';
    if(sharedPrefrences != null){
      searchResult['user_token']= sharedPrefrences.token.toString();
    }
    try {
      http.Response response = await http.post(url, body:searchResult);
      List res = json.decode(response.body);
      if (!res.isEmpty){
    
        return res;
      }

      else
        return [];
    } catch (e) {
     
      return null;
    }
  }

  Future<bool> pdfDownLoad(String name,int id) async {
    String url = serverUlr+'download_file?id=$id';
    //String d='http://192.168.43.144/laravel_project/public/item_files/img/1599909842.jpg';
    try {
      http.Response response = await http.get(url);
    
      if (!response.body.isEmpty) {
       
        Directory directory = await getApplicationDocumentsDirectory();
      
        File file = File(directory.path + '/$name');
      await  file.writeAsBytes(response.bodyBytes, flush: true);
      int o=  await file.length();
        print(o);
        
        
        return true;
      } else
        return false;
    } catch (e) {
      return null;
    }
  }
    Future<List> allTags() async {
    String url = serverUlr+'allTags';
    try {
      http.Response response = await http.get(url, headers: {
        'Accept': 'application/json',
      });
      List res = json.decode(response.body);
      if (!res.isEmpty) {
        return res;
      } else
        return [];
    } catch (e) {
      return null;
    }
  }
  

  Future<List> getFavorate() async {
    String url = serverUlr + 'getFavorate';
    try {
      http.Response response = await http.get(url, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${sharedPrefrences.token}'
      });
      List res = json.decode(response.body);
      if (!res.isEmpty) {
        return res;
      } else
        return [];
    } catch (e) {
      return null;
    }
  }

  Future<List> getReservation() async {
    String url = serverUlr + 'getReservation';
    try {
      http.Response response = await http.get(url, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${sharedPrefrences.token}'
      });
      List res = json.decode(response.body);
      if (!res.isEmpty) {
        return res;
      } else
        return [];
    } catch (e) {
      return null;
    }
  }

  Future<List> getBorrow() async {
    String url = serverUlr + 'getBorrows';
    try {
      http.Response response = await http.get(url, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${sharedPrefrences.token}'
      });
      List res = json.decode(response.body);
      if (!res.isEmpty) {
        return res;
      } else
        return [];
    } catch (e) {
      return null;
    }
  }

  Future<bool> addAndCancelFavorate(token, id) async {
    String url = serverUlr + 'addFavorite';
    try {
      http.Response response = await http.post(url, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      }, body: {
        'id': id.toString()
      });

      Map res = json.decode(response.body);

      if (res['status'] == true) {
        return false;
      } else if (res['status'] == false) return true;
    } catch (e) {
      return null;
    }
  }

  Future<Map> getReservationDetile(id) async {
    String url = serverUlr + 'getReservationDetile';
    try {
      http.Response response = await http.post(url, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${sharedPrefrences.token}'
      }, body: {
        'id': id.toString()
      });

      Map res = json.decode(response.body);

      return res;
    } catch (e) {
      return null;
    }
  }

  Future<Map> addAndCancelReservation(token, id) async {
    String url = serverUlr + 'addReservation';
    try {
      http.Response response = await http.post(url, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      }, body: {
        'id': id.toString()
      });

      Map res = json.decode(response.body);
      

      return res;
    } catch (e) {
      return null;
    }
  }

  Future<Map> getMoreDetile(id) async {
    String url = serverUlr + 'item_detile?id=$id';
    try {
      http.Response response = await http.get(
        url,
        headers: {
          'Accept': 'application/json',
        },
      );
      Map res = json.decode(response.body);
      if (!res.isEmpty) {
        return res;
      } else
        return {};
    } catch (e) {
      return null;
    }
  }

  Future<Map> showAddItemProjectRequest() async {
    String url =
        'http://192.168.43.144/laravel_project/public/api/show_add_item_project_request';
    try {
      http.Response response = await http.get(url, headers: {
        'Accept': 'application/json',
      });
      Map res = json.decode(response.body);
      if (!res.isEmpty) {
        return res;
      } else
        return {};
    } catch (e) {
      return null;
    }
  }
}
