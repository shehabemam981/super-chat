import 'package:superchat/base/baseviewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:superchat/models/my%20user.dart';
import 'package:superchat/modules/signup/signupNavigator.dart';
import 'package:superchat/shared/network/remote/firebase.dart';
import 'package:superchat/shared/styles/constanterror.dart';
class signupviewmodel extends baseviewmodel<signupNavigator> {
  String? massege;

  void CreateEmailpass(
    String emailAddress,
    String password,
    String fname,
    String lname,
  ) async {
    FirebaseAuth firebase = FirebaseAuth.instance;
    try {
      navigator!.showdialog();
      final credential = await firebase.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      massege = "Successful Created";
      myuser users = myuser(
          fname: fname,
          lname: lname,
          email: emailAddress,
          id: credential.user?.uid ?? '');
      databaseutils.adduserstofirebase(users).then((value) {
        navigator!.hideDialog();
        navigator!.home(users);
        return;
      });

      //read the user
      navigator!.home(users);
    } on FirebaseAuthException catch (e) {
      if (e.code == errorsflutter.weakpass) {
        massege = "The password provided is too weak.";
      } else if (e.code == errorsflutter.emailalreadyinnuse) {
        massege = "The account already exists for that email.";
      }
    } catch (e) {
      massege = "Something wrong";
      print(e.toString());
    }
    if (massege != '') {
      navigator!.hideDialog();
      navigator!.showmassege(massege!);
    }
  }
}
