class Routes{

  static String home = "/home";
   static String addNote = "/addNote";
  static var pages = [
  GetPage(name: home, page: ()=>HomeScreen(),),
  GetPage(name: addNote, page: ()=>AddNoteScreen()),
  ];
}