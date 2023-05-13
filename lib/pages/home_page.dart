import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_project/data/boxes.dart';
import 'package:todo_project/model/todo.dart';
import 'package:todo_project/widgets/dialog_box.dart';
import 'package:todo_project/widgets/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controllerName = TextEditingController();
  final _controllerTarefa = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    Hive.close();
    // TODO: implement dispose
    super.dispose();
  }

  void actionButton() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
            textControllerName: _controllerName,
            textControllerText: _controllerTarefa,
            onCancel: () {
              _controllerName.clear();
              _controllerTarefa.clear();
              Navigator.of(context).pop();
            },
            onSave: () {
              setState(() {
                ToDo toDo = ToDo(
                    title: _controllerName.text,
                    task: _controllerTarefa.text,
                    did: false);
                Boxes.getToDo().add(toDo);
              });
              _controllerName.clear();
              _controllerTarefa.clear();
              Navigator.of(context).pop();
            });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade400,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen.shade900,
        title: const Center(
          child: Text('ToDo list'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreen.shade800,
        onPressed: () {
          actionButton();
        },
        child: const Icon(Icons.add_circle_outline),
      ),
      body: SafeArea(
        child: ValueListenableBuilder<Box<ToDo>>(
          valueListenable: Boxes.getToDo().listenable(),
          builder: (context, Box box, _) {
            if (box.values.isEmpty) {
              return const Center(
                child: Text(
                  "Sem tarefas no momento!",
                  style: TextStyle(
                      fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),
                ),
              );
            }
            return ListView.builder(
              itemCount: box.values.length,
              itemBuilder: (context, index) {
                ToDo currentToDo = box.getAt(index);
                return ToDoTile(
                  deleteFunction: (p0) => currentToDo.delete(),
                  taskName: currentToDo.title,
                  taskText: currentToDo.task,
                  isCompleted: currentToDo.did,
                  onChanged: (p0) {
                    currentToDo.did = !currentToDo.did;
                    currentToDo.save();
                    setState(() {});
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
