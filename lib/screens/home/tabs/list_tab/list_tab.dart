import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/screens/home/tabs/list_tab/todo.dart';
import 'package:to_do_app/utlis/app_color.dart';
import '../../../../provider/list_provider.dart';
class ListTab extends StatefulWidget {

  @override
  State<ListTab> createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {



  @override
  Widget build(BuildContext context) {



    listProvider provider=Provider.of(context);
    return Column(
      children: [
        Container(color:App_color.whiteColor,
        child: CalendarTimeline(
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(Duration(days:365)),
          lastDate: DateTime.now().add(Duration(days:365)),

          onDateSelected: (date) {
            provider.selectedDate=date!;
            provider.refreshTodosfromfirestore();
            print("$date");

            },
          leftMargin: 20,
          monthColor: Colors.black,
          dayColor:  Colors.black,
          activeDayColor: Colors.white,
          activeBackgroundDayColor: App_color.primaryColor,
          dotsColor: Colors.transparent,
          locale: 'en_ISO',
          showYears: true,
        ),
      ),

        Expanded(
          child: Container(color:Colors.transparent,
            child: ListView.builder(
              itemCount: provider.todosList.length,
              itemBuilder: (context,index)
              {
               return Todo(
                 todo:
                 provider.todosList[index],);
              }

            ),
          ),
        ),
      ],
    );


  }


}
