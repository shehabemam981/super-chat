import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:superchat/models/my%20user.dart';

class databaseutils {
  static CollectionReference<myuser> getCollection() {
    return FirebaseFirestore.instance.collection(myuser.collection).withConverter<myuser>(
        fromFirestore:(snapshot, options) => myuser.fromjson(snapshot.data()!),
        toFirestore:(value,options)=>value.tojson(),);
  }

 static Future<void> adduserstofirebase(myuser user){
  return  getCollection().doc(user.id).set(user);
  }
 static Future<myuser?> readuserstofirebase(String id)async{
    DocumentSnapshot<myuser> document=await getCollection().doc(id).get();
    var Uusers=document.data();
    return Uusers;
  }
}