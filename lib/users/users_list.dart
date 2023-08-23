
/*
//implement login with api
Future<User> _login(String usernameOrEmail, String password) async{
  final response = await http.post('http://192.168.43.75:80/api/
  auth',
  headers:{
    'Content-Type':'application/json'},
    body: jsonEncode(<String,dynamic>{
      "username":usernameOrEmail,"password":password}));
      if (response.statusCode == 200){
        return userFromJson(utf8.decode(response.bodyBytes));
        }else{
          throw Exception("error");
          }
          //return null ;
          }

          */