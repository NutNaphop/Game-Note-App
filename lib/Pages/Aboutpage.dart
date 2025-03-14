import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 20,
      children: [
      Text("This App made by Naphop khumchawna" , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold), textAlign: TextAlign.center,) ,
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.man , size: 100 , color: Colors.blue[300],) ,
          Icon(Icons.gamepad_outlined , size: 100 , color: Colors.pink[300],) ,
        ],
      )
    ],);
  }
}