import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:api_app/addtasks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'users_home.dart';
import 'manager_home.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  void initState() {
    super.initState();

    _firebaseMessaging.requestPermission(
      announcement: true,
      carPlay: true,
      criticalAlert: true,
    );

    _firebaseMessaging.getToken().then((token) {
      print("FCM Token: $token");
      // You can send this token to your server if needed.
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle incoming foreground notifications here.
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Handle notifications that were tapped when the app was in the background or terminated.
    });
  }

  bool isLoading = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? errorMsg;

  Future<void> login(String email, String password) async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:8000/api/users'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> users = json.decode(response.body);

        bool loggedIn = false;

        for (var user in users) {
          if (user['email'] == email && user['password'] == password) {
            loggedIn = true;
            break;
          }
        }

        if (loggedIn) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => AddTasks()),
          );
        } else {
          setState(() {
            errorMsg = "Invalid email or password.";
          });
        }
      } else {
        setState(() {
          errorMsg = "Failed to fetch users.";
        });
      }
    } catch (e) {
      setState(() {
        errorMsg = "An error occurred.";
      });
    }
  }

  Future<void> managerLogin(String email, String password) async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:8000/api/managers'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> managers = json.decode(response.body);

        bool loggedIn = false;

        for (var manager in managers) {
          if (manager['email'] == email && manager['password'] == password) {
            loggedIn = true;
            break;
          }
        }

        if (loggedIn) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => ManagerHome()),
          );
        } else {
          setState(() {
            errorMsg = "Invalid email or password.";
          });
        }
      } else {
        setState(() {
          errorMsg = "Failed to fetch managers.";
        });
      }
    } catch (e) {
      setState(() {
        errorMsg = "An error occurred.";
      });
    }
  }

  Future<void> register(
    String name,
    String phoneNumber,
    String email,
    String password,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:8000/api/manager'),
        body: {
          'name': name,
          'phone_number': phoneNumber,
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 201) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => ManagerHome()),
        );
      } else {
        setState(() {
          errorMsg = "Failed to register user.";
        });
      }
    } catch (e) {
      setState(() {
        errorMsg = "An error occurred.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Login"),
        centerTitle: true,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(17),
        children: [
          Text(
            "Login as user",
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: "Email",
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
              hintText: "Password",
            ),
            obscureText: true,
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            child: Text("Login"),
            onPressed: () {
              final email = emailController.text;
              final password = passwordController.text;
              login(email, password);
            },
          ),
          if (errorMsg != null)
            Text(
              errorMsg!,
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Login as Manager",
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: "Email",
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
              hintText: "Password",
            ),
            obscureText: true,
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            child: Text("Login as Manager"),
            onPressed: () {
              final email = emailController.text;
              final password = passwordController.text;
              managerLogin(email, password);
            },
          ),
          if (errorMsg != null)
            Text(
              errorMsg!,
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          SizedBox(
            height: 40,
          ),
          Text(
            "Register",
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "name",
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "phone number",
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Email",
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Password",
            ),
            obscureText: true,
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            child: Text("Register"),
            onPressed: () {
            Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => ManagerHome())
            );
            }
  
          ),
          if (errorMsg != null)
            Text(
              errorMsg!,
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ElevatedButton(
            child: Text("Send Test Notification"),
            onPressed: () {
               //sendNotificationToUser();
            },
          ),
        ],
      ),
    );
  }

  Future<void> sendNotificationToUser(String userToken) async {
    final String serverKey =
        'AAAALFf0mXk:APA91bHRqYpYR-OxSNI-ehbuXMBxw0Fod1V_L64Zt307532zKfjJsb2QwlBEkWEclxHS6Fb3X1jxdHa56dqwoIU4wjUc5BrG_NeHCizuwmKAtbUMIppfaG8-UuW0RnT9QFI-BpyWGn56';
    final String url = 'https://fcm.googleapis.com/fcm/send';

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'key=$serverKey',
    };

    final message = {
      'notification': {
        'title': 'New Message',
        'body': 'You have a new message!',
      },
      'to': userToken,
    };

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(message),
    );

    if (response.statusCode == 200) {
      print('Notification sent successfully');
    } else {
      print('Failed to send notification');
    }
  }
}


//token :
//dtETdCTvR1iqulCsruaNiB:APA91bETa3IfNhm3-BsQHH7RhJPW4LKAHECzdyjGt245_zA9Ff1oRXqJiZYbzJn5jNyNxP84GRNTlrh3LzVNgI40M2Qn5nmcM3BBIF3n1wewZ46xOLQlwg9Sz8-D5fPEcqiywKc6NXWO