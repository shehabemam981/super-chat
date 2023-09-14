import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:superchat/models/my%20user.dart';
import 'package:superchat/shared/network/remote/firebase.dart';

class userprovider extends ChangeNotifier{

  late User? userauth;
  myuser? user;
  userprovider(){
    userauth=FirebaseAuth.instance.currentUser;
    initlogin();
  }
    void  initlogin()async{
    user=await databaseutils.readuserstofirebase(userauth!.uid);
  }
  Future<void> initsignout()async{
   await FirebaseAuth.instance.signOut();
   notifyListeners();

  }
}