import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_project/model/todo.dart';

class Boxes {
  static Box<ToDo> getToDo() => Hive.box<ToDo>('ToDo');
}
