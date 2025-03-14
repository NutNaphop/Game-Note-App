import 'package:flutter/material.dart';
import 'package:game_note/service/crud_service.dart';

class EditForm extends StatefulWidget {
  final String doc_id;
  final String game_name;
  final String genres;

  EditForm({
    required this.game_name,
    required this.genres,
    required this.doc_id,
  });

  @override
  State<EditForm> createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  late String _selectGenres; 

  @override
  void initState() {
    super.initState();
    _selectGenres = widget.genres;
  }


  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    final gameController = TextEditingController(text: widget.game_name);
    final developerController = TextEditingController();


    List<String> list = <String>['Action', 'Horror', 'Puzzle', 'Sport'];

    void handleSubmit() {
      var gamename = gameController.text;
      var developer = developerController.text;
      var genres = _selectGenres;

      updateData(widget.doc_id, gamename, genres);

      Navigator.pop(context) ; 
    }

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
                      value: _selectGenres,
                      items: list.map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectGenres = value!;
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
                  "Update",
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
