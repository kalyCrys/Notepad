import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.black,
        title: Text(
          'Notepad',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.50),
        ),
        actions: [],
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Card(
            color: Colors.grey[200],
            child: Container(
              height: 100,
                child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceAround ,children: [Text("title"), Text("Date")],),
                Row(children: [Text("Description")],),
               
              ],
            )),
          ),
        )
      ]),
    );
  }
}
