import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final textControllerName;
  final textControllerText;

  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      required this.textControllerName,
      required this.textControllerText,
      required this.onCancel,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.green.shade100,
      content: SizedBox(
        height: MediaQuery.of(context).size.height * .5,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const Center(
              child: Text(
                'Nova tarefa',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
            TextField(
              controller: textControllerName,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'Tarefa'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            TextField(
              controller: textControllerText,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'Instruções'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: onSave,
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.green.shade900),
                  ),
                  child: const Text('Salvar'),
                ),
                ElevatedButton(
                  onPressed: onCancel,
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.red.shade900),
                  ),
                  child: const Text('Fechar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
