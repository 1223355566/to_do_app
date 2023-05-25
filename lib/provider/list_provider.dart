import 'package:flutter/material.dart';

import '../model/todo_dm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class listProvider extends ChangeNotifier{
  DateTime selectedDate=DateTime.now();
  List <TodoDM> todosList=[];

  listProvider(){refreshTodosfromfirestore();}
  refreshTodosfromfirestore() {
    var todos = FirebaseFirestore.instance.collection('todos');
    todos.get().then((querySnapshot) {
      todosList = querySnapshot.docs.map((documentSnapShot) {
        var json = documentSnapShot.data();
        return TodoDM(id: json["id"],
            title: json["title"],
            descrbtion: json["description"],
            isDone: json["isDone"],
            date: DateTime.fromMillisecondsSinceEpoch(json["dataTime"]));
      }).toList();
      todosList = todosList.where((todo) {
        if (todo.date.day == selectedDate.day &&
            todo.date.month == selectedDate.month
            && todo.date.year == selectedDate.year)
          return true;
        else
          return false;
      }
      ).toList();
      notifyListeners();
    });
  }



}