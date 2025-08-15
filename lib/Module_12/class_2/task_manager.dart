import 'package:flutter/material.dart';
import 'package:ostad_modules/Module_12/class_2/add_new_todo_screen.dart';
import 'package:ostad_modules/Module_12/class_2/todo_blueprint.dart';

class TaskManager extends StatefulWidget {
  const TaskManager({super.key});

  @override
  State<TaskManager> createState() => _TaskManagerState();
}

class _TaskManagerState extends State<TaskManager> {
  List<Todo> todoList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo List')),
      body: ListView.builder(
        itemCount: todoList.length, // -> 5
        itemBuilder: (context, index) {
          // index -> 0 to 4 ->
          Todo object = todoList[index]; // -> index = index
          return ListTile(
            onLongPress:(){
              todoList.removeAt(index);
              setState(() {

              });
            } ,
            // context = location & index = currentIndex
            title: Text(object.title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(object.description),
                Text('${object.createdDate}'),
              ],
            ),
            trailing: Text(object.status),
          );
        },
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () async {

          Todo? object = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNewTodoScreen()),
          );
          if(object!=null){
            todoList.add(object);
          }
          setState(() {

          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
