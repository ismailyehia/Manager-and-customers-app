import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_task/add_task_screen.dart';
import 'add_task/task_data.dart';
import 'add_task/tasks_list.dart';
import 'manager_home.dart';

class Addtaskstwo extends StatefulWidget {
  const Addtaskstwo({super.key});

  @override
  State<Addtaskstwo> createState() => _AddtaskstwoState();
}

class _AddtaskstwoState extends State<Addtaskstwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(



appBar: AppBar(
        title: Text('Tasks'),
        backgroundColor: Colors.cyan,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
             Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => ManagerHome()),
            );
          },
        ),
      ),


    
floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
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
        },
        backgroundColor: Colors.indigo[400],
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.teal[400],
      body: Container(
        padding: EdgeInsets.only(
          top: 70,
          left: 20,
          right: 20,
          bottom: 60,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.playlist_add_check,
                  size: 40,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "TODO LIST",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 10, 9, 9),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              "${Provider.of<TaskData>(context).tasks.length} Tasks",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 20,
            ),
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
      ),



























    );
  }
}