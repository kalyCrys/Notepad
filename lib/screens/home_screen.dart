import 'package:flutter/material.dart';
import 'package:notepad/screens/addNote_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.amber[600],
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              
              clipBehavior: Clip.antiAlias,
              child: ListTile(
                tileColor: Colors.amber.shade100,
                title: Text(
                  "Title",
                ),
                subtitle: Text("Description"),
                shape: Border(
                    bottom: BorderSide(
                  color: Colors.black12,
                )),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddNote())),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
