import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatefulWidget {
  final String taskName;
  final String taskText;
  final bool isCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile(
      {super.key,
      required this.deleteFunction,
      required this.taskName,
      required this.taskText,
      required this.isCompleted,
      required this.onChanged});

  @override
  State<ToDoTile> createState() => _ToDoTileState();
}

class _ToDoTileState extends State<ToDoTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Slidable(
        startActionPane: ActionPane(motion: const ScrollMotion(), children: [
          const SizedBox(
            width: 8,
          ),
          SlidableAction(
            onPressed: widget.deleteFunction,
            backgroundColor: Colors.red.shade900,
            borderRadius: BorderRadius.circular(18),
            icon: Icons.delete,
          ),
          const SizedBox(
            width: 8,
          ),
        ]),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.green.shade900,
            borderRadius: BorderRadius.circular(12),
          ),
          height: MediaQuery.of(context).size.height * .09,
          child: Row(
            children: [
              Checkbox(
                value: widget.isCompleted,
                onChanged: widget.onChanged,
                activeColor: Colors.black,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.taskName,
                    style: TextStyle(
                        decoration: widget.isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.taskText,
                    style: TextStyle(
                        decoration: widget.isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
