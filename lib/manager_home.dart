import 'dart:convert';

import 'package:api_app/test.dart';
import 'package:api_app/users/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'addtasks.dart';
import 'addtasks2.dart';


class ManagerHome extends StatefulWidget {


Future<List<User>> fetchUsers() async {
  final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/users'));

  if (response.statusCode == 200) {
    final List<dynamic> responseData = json.decode(response.body);
    return responseData.map((userJson) => User.fromJson(userJson)).toList();
  } else {
    throw Exception('Failed to load users');
  }
}





  @override
  State<ManagerHome> createState() => _ManagerHomeState();
}

class _ManagerHomeState extends State<ManagerHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     getData();
  }





/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manager Home'),
        backgroundColor: Colors.cyan,
        
      ),
      body: ListView(
        scrollDirection:Axis.vertical,
         padding: EdgeInsets.all(20),
        children: [
          Text("Add Tasks",style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 20,),
           TextFormField(
              maxLines: 3,
              decoration: InputDecoration(hintText: "Task"),
            ),
            ElevatedButton(
              child: Text("Add"),
              onPressed: ()  {
                          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: AddTaskScreen((newTaskTitle) {
                      // setState(() {
                      //   tasks.add(Task(name: newTaskTitle));
                      //   Navigator.pop(context);
                      // });
                    }))),
          );
              }
            ),



            SizedBox(height: 30,),
          



     
             Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: TasksList(),
              ),
            ),
       






        
          
        ],
      ),
      
    );
  }


  */






















  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Manager Home"),
        backgroundColor: Colors.red,
        centerTitle: true,

      ),
      body: FutureBuilder<List<User>>(
        future: fetchUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  trailing: ElevatedButton(
                    onPressed: () {
                      // Handle button press for the user
                      _handleUserButtonPress(context, user); 
                    },
                    child: Text('Press'),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

}





Future<List<User>> fetchUsers() async {
  final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/users'));

  if (response.statusCode == 200) {
    final List<dynamic> responseData = json.decode(response.body);
    return responseData.map((userJson) => User.fromJson(userJson)).toList();
  } else {
    throw Exception('Failed to load users');
  }
}







 void _handleUserButtonPress(BuildContext context, User user) {
    if (user.id == 1) {
      // Action for user with ID 1
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => AddTasks()),
      );
    } else if (user.id == 2) {
      // Action for user with ID 2
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Addtaskstwo()),
      );
    } else {
      // Default action for other users
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => AddTasks()),
      );
    }
  }
