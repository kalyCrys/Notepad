import 'package:flutter/material.dart';
import 'package:notepad/screens/home_screen.dart';
import 'package:intl/intl.dart';

class AddNote extends StatefulWidget {
   const AddNote({super.key});
   
  @override
  State<AddNote> createState() => _AddNoteState();
}

TextEditingController _editTextController = TextEditingController();
ScrollController _scrollController = ScrollController();

class _AddNoteState extends State<AddNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        backgroundColor: Colors.amber[100],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 5),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Título',
                hintStyle:
                    TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
              ),
            ),
            Row(
              children: [Text(DateFormat("dd/MM/yyyy   HH:mm").format(DateTime.now()), style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black38),)],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Scrollbar(
                controller: _scrollController,
                child: TextField(
                  scrollController: _scrollController,
                  autofocus: true,
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
                  onChanged: (s) => {},
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "Descrição"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
