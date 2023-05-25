import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/screens/home/tabs/list_tab/list_tab.dart';
import 'package:to_do_app/screens/home/tabs/settings/settingsTab.dart';
import 'package:to_do_app/utlis/app_color.dart';
import '../../provider/list_provider.dart';
import 'bottom_sheets/add_bottom_sheet.dart';

class Home extends StatefulWidget {
  static String routeName = "home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int crurrentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          " To Do list",
        ),
        toolbarHeight: MediaQuery.of(context).size.height * 0.15,
      ),

      body:crurrentTab==0?ListTab(): SettingsTab(),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddBottomSheet();
        },
        child: Icon(
          Icons.add,
          color: App_color.whiteColor,
        ),
        shape: StadiumBorder(
            side: BorderSide(color: App_color.whiteColor, width: 4)),
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.hardEdge,
        shape: CircularNotchedRectangle(),
        notchMargin: 7,
        child: BottomNavigationBar(

          currentIndex: crurrentTab,
          onTap: (index) {
            crurrentTab=index;
            setState(() {

            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "list"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "settings")
          ],
        ),
      ),
    );
  }

  void showAddBottomSheet() {
    showModalBottomSheet(context: context,
        builder: (_)=>AddBottomSheete());
  }
}


