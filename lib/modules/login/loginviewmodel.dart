

import 'package:firebase_auth/firebase_auth.dart';

import 'package:superchat/base/baseviewmodel.dart';
import 'package:superchat/models/my%20user.dart';
import 'package:superchat/modules/login/loginnavigator.dart';
import 'package:superchat/shared/network/remote/firebase.dart';


class loginviewmodel extends baseviewmodel<loginnavigator>{
    String massege="";

  void login(String emailAddress,String password)async{
    try {
      navigator!.showdialog();
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
    myuser? theUser =await databaseutils.readuserstofirebase(credential.user?.uid??'');
        navigator!.hideDialog();
        navigator!.gotohome(theUser!);

        return;



    } on FirebaseAuthException catch (e) {
       massege="wrong email or password";
    }catch(e){
      massege = "Something went wrong";
    }


}

}