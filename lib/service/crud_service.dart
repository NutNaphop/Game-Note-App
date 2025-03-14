import 'package:cloud_firestore/cloud_firestore.dart';

void addData(String name , String developer , String genres) async {
  try {
    await FirebaseFirestore.instance.collection('Games').add({
    "game_name" : name , 
    "developer_name" : developer , 
    "genres" : genres
  });
  }on Exception catch (e) {
    print(e);
  }
}

void updateData(String id , String name , String genres) async{
  try{
    await FirebaseFirestore.instance.collection('Games').doc(id).update({
      "game_name" : name , 
      "genres" : genres
    }); 
  }on Exception catch (e){
    print(e) ; 
  }
}

void deleteData(String id) async {
  try{
    await FirebaseFirestore.instance.collection('Games').doc(id).delete();
  }on Exception catch (e){
    print(e);
  }
}