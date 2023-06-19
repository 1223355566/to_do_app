import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/provider/list_provider.dart';
import 'package:to_do_app/utlis/app_color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddBottomSheete extends StatefulWidget {
  @override
  State<AddBottomSheete> createState() => _AddBottomSheeteState();
}

class _AddBottomSheeteState extends State<AddBottomSheete> {
  DateTime selectedDay = DateTime.now();
TextEditingController titlecontroller=TextEditingController();
  TextEditingController descriptionecontroller=TextEditingController();
  late listProvider provider;
  @override
  Widget build(BuildContext context) {
     provider=Provider.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Add new Task",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 20,
          ),
         TextField(
            controller: titlecontroller,
            decoration: const InputDecoration(labelText: "Enter your task title"),
          ),
          const SizedBox(
            height: 22,
          ),
          TextField(
            controller: descriptionecontroller,
            decoration:
                const InputDecoration(labelText: "Enter your task description"),
          ),
          const SizedBox(
            height: 22,
          ),
          Text(
            "Select time",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            height: 22,
          ),
          InkWell(
            onTap: () {
              showMydatepicker();
            },
            child: Text(
                '${selectedDay.day}/${selectedDay.month}/${selectedDay.year}',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: App_color.hintColor)),
          ),
          const Spacer(),
          ElevatedButton(
              onPressed: () {
                onAddPressed();
              },
              child: const Text(
                'add',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }

  Future<void> showMydatepicker() async {
    selectedDay = await showDatePicker(
            context: context,
            initialDate: selectedDay,
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 365))) ?? DateTime.now();

  }

  Future<void> onAddPressed() async {
    CollectionReference todos = FirebaseFirestore.instance.collection('todos');
    DocumentReference doc =todos.doc();
       doc.set({
      "id":doc.id,
      "title":titlecontroller.text,
      "description":descriptionecontroller.text,
      "isDone":false,
      "dataTime":selectedDay.millisecondsSinceEpoch
    }).timeout(Duration(milliseconds: 500),onTimeout: (){
         Navigator.pop(context);
provider.refreshTodosfromfirestore();



       });


  }
}
