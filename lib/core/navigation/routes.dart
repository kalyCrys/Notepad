// class Routes{

//   static String home = "/home";
//    static String addNote = "/addNote";
//   static var pages = [
//   GetPage(name: home, page: ()=>HomeScreen(),),
//   GetPage(name: addNote, page: ()=>AddNoteScreen()),
//   ];
// }

import 'package:get/get.dart';
import 'package:notepad/screens/addNote_screen.dart';
import 'package:notepad/screens/home_screen.dart';

class Routes{
  static String home = "home";
  static String addNote = "/addNote";
}

var pages = [
  GetPage(name: Routes.home, page: () => HomeScreen()),
  GetPage(name: Routes.addNote, page: () => AddNote()),
];