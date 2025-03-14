import 'package:flutter/material.dart';
import 'package:game_note/Components/Form/EditForm.dart';

class EditPage extends StatefulWidget {
  final String doc_id ; 
  final String game_name;
  final String genres;

  EditPage({
    required this.game_name,
    required this.genres,
    required this.doc_id
  });

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Game"),
          centerTitle: true,
        ),
        body: Column(
          spacing: 30,
          children: [
            SizedBox(
              height: 10,
            ),
            SizedBox(
                width: 300,
                child: Text(
                  "Update your favorite game note",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )),
            Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: EditForm(
                    game_name: widget.game_name, genres: widget.genres , doc_id: widget.doc_id)),
          ],
        ));
  }
}
