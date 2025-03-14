import 'package:flutter/material.dart';
import 'package:game_note/service/crud_service.dart';

class FormAdd extends StatefulWidget {
  const FormAdd({super.key});

  @override
  State<FormAdd> createState() => _FormAddState();
}

class _FormAddState extends State<FormAdd> {
  final key = GlobalKey<FormState>();
  final gameController = TextEditingController();
  final developerController = TextEditingController();
  var genresSelected;

  List<String> list = <String>['Action', 'Horror', 'Puzzle' , 'Sport'];

  void handleSubmit(){
    var gamename = gameController.text;
    var developer = developerController.text;
    var genres = genresSelected;

    addData(gamename, developer, genres) ; 

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: 15,
          children: [
            Column(
              spacing: 10,
              crossAxisAlignment:
                  CrossAxisAlignment.start, // กำหนดให้ Text อยู่ทางซ้าย
              children: [
                Text(
                  'Game Name',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextFormField(
                  controller: gameController,
                  autofocus: false,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "xxxxxx",
                      errorStyle: TextStyle(
                          color: Colors.yellow,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                  validator: (value) {
                    if (value!.isEmpty) return 'Please enter your email';
                  },
                ),
              ],
            ),
            Column(
              spacing: 10,
              crossAxisAlignment:
                  CrossAxisAlignment.start, // กำหนดให้ Text อยู่ทางซ้าย
              children: [
                Text(
                  'Developer name',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextFormField(
                  controller: developerController,
                  autofocus: false,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "John Doe",
                      errorStyle: TextStyle(
                          color: Colors.yellow,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                  validator: (value) {
                    if (value!.isEmpty) return 'Please enter your email';
                  },
                ),
                Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Genres"),
                    DropdownButtonFormField(
                      value: genresSelected,
                      items: list.map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          genresSelected = value!;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please select an item';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 200,
            ),
            Center(
              child: ElevatedButton(
                onPressed: handleSubmit,
                child: Text(
                  "Add",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                style: ButtonStyle(
                  fixedSize: WidgetStateProperty.all(Size(280, 50)),
                  backgroundColor: WidgetStateProperty.all(Color(0xFFF281C1)),
                  foregroundColor: WidgetStateProperty.all(Colors.white),
                ),
              ),
            )
          ],
        ));
  }
}
