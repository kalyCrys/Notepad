import 'package:flutter/material.dart';
import 'package:notepad/screens/home_screen.dart';
import 'package:intl/intl.dart';

import '../database/database_service.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

showAlertdialog(BuildContext context) {
  Widget cancelarButton = ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text("Cancelar"));
  Widget continuarButton = ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      },
      child: Text("Continuar"));

  AlertDialog alert = AlertDialog(
    title: Text("Atenção"),
    content: Text("Sua anotação não será salva, deseja continuar ?"),
    actions: [cancelarButton, continuarButton],
  );
  showDialog(
      context: context,
      builder: (context) {
        return alert;
      });
}

class _AddNoteState extends State<AddNote> {
  DatabaseService db = DatabaseService();

  TextEditingController titleTextController = TextEditingController();
  TextEditingController descriptionTextController = TextEditingController();

  save() {
    db.insert("notes", {
      "title": titleTextController.text,
      "description": descriptionTextController.text,
      "date": DateTime.now().toString()
    });
    
    
    Navigator.of(context).pop();
    

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db.open();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        backgroundColor: Colors.amber[600],
        leading: IconButton(
            onPressed: () => showAlertdialog(context),
            icon: Icon(Icons.arrow_back_ios, color: Colors.white,)),
        actions: [
          IconButton(onPressed: () {save();}, icon: Icon(Icons.check_outlined , color: Colors.white,)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 5),
        child: Column(
          children: [
            TextField(
              controller: titleTextController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Título',
                hintStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ),
            Row(
              children: [
                Text(
                  DateFormat("dd/MM/yyyy   HH:mm").format(DateTime.now()),
                  style: TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.black38),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Scrollbar(
                child: TextField(
                  controller: descriptionTextController,
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
