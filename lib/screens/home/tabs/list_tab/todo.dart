import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/provider/list_provider.dart';
import 'package:to_do_app/utlis/app_color.dart';

import '../../../../model/todo_dm.dart';
class Todo extends StatelessWidget {


TodoDM todo;
Todo({required this.todo});

  @override
  Widget build(BuildContext context) {
listProvider provider=Provider.of(context);
    return Container(


      margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 22),
      decoration:BoxDecoration(

          borderRadius: BorderRadius.circular(18)
      ),
      child: Slidable(
        key:   ValueKey(todo),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          dismissible: DismissiblePane(onDismissed: () {
         var todoscollection= FirebaseFirestore.instance.collection("todos");
        var doc =todoscollection.doc(todo.id);
        doc.delete().timeout(Duration(milliseconds: 500));
        provider.refreshTodosfromfirestore();


          }),
          children: [
            SlidableAction(
              onPressed:(_){print("Clicked");},
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],

        ),
        child: Container(

            padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 25),
              decoration:BoxDecoration(
                color: Colors.white,
                 borderRadius: BorderRadius.circular(18)
                   ),
              child: Row(
                children: [
                  buildVerticalLine(),
                  SizedBox(width: 8,),
                  buildMiddleColumn(context),

                  buildStateIcon()
                ],
              ),
            ),
      ),
    );
  }

  Widget buildVerticalLine(){
    return Container(
      height: 60,
      width: 4,
      decoration: BoxDecoration( color: App_color.primaryColor,borderRadius: BorderRadius.circular(16)),
    );
  }

Widget buildMiddleColumn(BuildContext context){
    return Expanded(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(todo.title,style: Theme.of(context).textTheme.titleMedium,),
               SizedBox(height: 4,),
          Text(todo.descrbtion,textAlign: TextAlign.start,style: Theme.of(context).textTheme.titleSmall)
        ],

      ),
    );
}

Widget buildStateIcon(){
    return Container(

      decoration: BoxDecoration(  color: App_color.primaryColor,
      borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical:8 ),
        child: Image.asset("assets/Icon awesome-check.png"),
      ),

    );
}
}
