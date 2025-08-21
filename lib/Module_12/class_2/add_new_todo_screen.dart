import 'package:flutter/material.dart';
import 'package:ostad_modules/Module_12/class_2/todo_blueprint.dart';

class AddNewTodoScreen extends StatefulWidget {
  const AddNewTodoScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddNewTodoScreenState();
  }
}

class _AddNewTodoScreenState extends State<AddNewTodoScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descripController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add new Todo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: 'Enter title', // better to give a static hint
                ),
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Enter a valid title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: descripController,
                decoration: InputDecoration(hintText: 'Enter Description'),
                validator: (String? value) { // Question
                  if (value == null || value.trim().isEmpty) {
                    return 'Enter a valid description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () { //Question
                  if(_formkey.currentState!.validate()==false){
                    return;
                  } //Question
                  Todo object = Todo(
                    title: titleController.text.trim(), // Free space cut
                    description: descripController.text,
                    status: 'Pending',
                    createdDate: DateTime.now(),
                  );

                  Navigator.pop(context, object);
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
