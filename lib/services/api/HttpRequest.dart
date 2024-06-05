import 'dart:convert';
import 'package:http/http.dart';
import 'base.dart';


Future<void> login(String username , password) async {
  try{
    
    Response response = await post(
      Uri.parse('$host/api/auth/login/'),
      body: {
        'username' : username,
        'password' : password
      }
    );
    if(response.statusCode == 200){
      final data = jsonDecode(response.body.toString());
      print(data['access']);
      print('Login successfully');

    }else {
      print('failed');
    }
  }catch(e){
    print(e.toString());
  }
}


