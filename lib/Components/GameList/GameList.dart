import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:game_note/Pages/EditPage.dart';
import 'package:game_note/service/crud_service.dart';

class GameListComponent extends StatefulWidget {
  const GameListComponent({super.key});

  @override
  State<GameListComponent> createState() => _GameListComponentState();
}


void handleDelete(String id){
  deleteData(id) ;
}

class _GameListComponentState extends State<GameListComponent> {
  CollectionReference postCollection =
      FirebaseFirestore.instance.collection('Games');

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
          stream: postCollection.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var gameIndex = snapshot.data!.docs[index];

                  return ListTile(
                    leading: Icon(Icons.gamepad),
                    title: Text(gameIndex["game_name"]),
                    subtitle: Text(gameIndex["genres"]),
                    trailing: Row(
                      spacing: 20,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: (){
                            deleteData(gameIndex.id) ; 
                          },
                          icon: Icon(Icons.delete),
                        ),
                        IconButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => EditPage(game_name: gameIndex["game_name"], genres: gameIndex["genres"] , doc_id: gameIndex.id,),)) ; 
                        }, icon: Icon(Icons.edit))
                      ],
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
