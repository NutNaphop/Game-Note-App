import 'package:flutter/material.dart';
import 'package:game_note/Components/Form/AddForm.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {


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
            SizedBox(height: 10,) , 
            SizedBox(
              width: 300,
              child: Text("Add your favorite game into your note" , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
            Padding(
              padding: EdgeInsets.only(left: 30 , right: 30),
              child: FormAdd()) , 
          ],
        ));
  }
}
