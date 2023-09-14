import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superchat/base/baseview.dart';
import 'package:superchat/models/my%20user.dart';
import 'package:superchat/modules/home/homeview.dart';
import 'package:superchat/modules/login/loginnavigator.dart';
import 'package:superchat/modules/login/loginviewmodel.dart';
import 'package:superchat/modules/signup/signupview.dart';
import 'package:superchat/provider/userprovider.dart';
class loginview extends StatefulWidget {
  static const String RouteName="login";

  loginview({Key? key}) : super(key: key);

  @override
  State<loginview> createState() => _loginviewState();
}

class _loginviewState extends baseview<loginview,loginviewmodel>
    implements loginnavigator {
  @override
  var emailcontroller=TextEditingController();
  var passcontroller=TextEditingController();
  GlobalKey<FormState>formKey=GlobalKey<FormState>();
  void initState() {
    // TODO: implement initState
    super.initState();
    model.navigator=this;

  }
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (BuildContext context)=> model,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  validator: (validate){
                    if (validate?.isEmpty ?? false) {
                      return "Please Enter your Email";
                    }
                    return null;
                  },
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 2,color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "enter your email ",
                  ),
                ),
                SizedBox(height: 30,),
                TextFormField(
                  validator: (validate) {
                    if (validate == null || validate.isEmpty) {
                      return "please enter your  password";
                    }
                    return null;
                  },
                  controller: passcontroller,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 2,color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "enter your password ",
                  ),
                ),
                SizedBox(height: 40,),
                ElevatedButton(onPressed: (){
                  validatelogin();
                }, child: Text("Submit")),
                SizedBox(height: 20,),
                InkWell(
                  onTap: (){
                    Navigator.pushReplacementNamed(context, Signup.RouteName);
                  },
                    child: Text("don\'t have account",textAlign: TextAlign.center,)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  ViewModel() {
   return loginviewmodel();
  }
  void validatelogin() async{
    if(formKey.currentState!.validate()){
       model.login(emailcontroller.text, passcontroller.text);

    }
  }

  @override
  gotohome(myuser user) {
    var pro=Provider.of<userprovider>(context,listen: false);
    pro.user=user;
    Navigator.pushReplacementNamed(context, homeview.RouteName);
    setState((){});
  }


}
