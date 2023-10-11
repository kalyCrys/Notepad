import 'package:flutter/material.dart';
import 'package:notepad/screens/home_screen.dart';
import 'package:intl/intl.dart';

class AddNote extends StatefulWidget {
   const AddNote({super.key});
   
  @override
  State<AddNote> createState() => _AddNoteState();
}

showAlertdialog(BuildContext context){
  Widget cancelarButton = ElevatedButton(onPressed: (){
    Navigator.of(context).pop();
  }, child: Text("Cancelar"));
  Widget continuarButton = ElevatedButton(onPressed: (){
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }, child: Text("Continuar"));

  AlertDialog alert = AlertDialog(
    title: Text("Atenção"),
    content: Text("Sua anotação não será salva, deseja continuar ?"),
    actions: [
      cancelarButton,
      continuarButton
    ],
  );
  showDialog(context: context, builder:(context){
    return alert;
  });
}

TextEditingController _editTextController = TextEditingController();
ScrollController _scrollController = ScrollController();

class _AddNoteState extends State<AddNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: 
      AppBar(
        backgroundColor: Colors.amber[600],
        leading: IconButton(onPressed:() =>showAlertdialog(context), icon: Icon(Icons.arrow_back_ios) ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.check_outlined)),
        ],
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
                    TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
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

