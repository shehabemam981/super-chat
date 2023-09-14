import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superchat/base/baseview.dart';
import 'package:superchat/models/my%20user.dart';
import 'package:superchat/modules/home/homeview.dart';
import 'package:superchat/modules/login/loginview.dart';
import 'package:superchat/modules/signup/signupNavigator.dart';
import 'package:superchat/modules/signup/signupviewmodel.dart';
import 'package:superchat/provider/userprovider.dart';

class Signup extends StatefulWidget {
  static const String RouteName = "signup";

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends baseview<Signup, signupviewmodel>
    implements signupNavigator {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model.navigator = this;
  }

  @override
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => model,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sign Up"),
          centerTitle: true,
        ),
        body: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  validator: (validate) {
                    if (validate == null || validate.isEmpty) {
                      return "please enter your first name";
                    }
                    return null;
                  },
                  controller: fname,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 2, color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "enter your first name",
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  validator: (validate) {
                    if (validate == null || validate.isEmpty) {
                      return "please enter your last name";
                    }
                    return null;
                  },
                  controller: lname,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 2, color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "enter your last name",
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  validator: (validate) {
                    if (validate == null || validate.isEmpty) {
                      return "please enter your email ";
                    }
                    final bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(validate);
                    if (!emailValid) {
                      return "Please enter Valid email";
                    }
                    ;
                    return null;
                  },
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 2, color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "enter your email ",
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  validator: (validate) {
                    if (validate == null || validate.isEmpty) {
                      return "please enter your  password";
                    }
                    return null;
                  },
                  controller: passController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 2, color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "enter your password ",
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    onPressed: () {
                      createacount();
                    },
                    child: Text("Submit")),
                InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, loginview.RouteName);
                    },
                    child: Text(
                      "Ihave account",
                      textAlign: TextAlign.center,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  ViewModel() {
    return signupviewmodel();
  }

  createacount() {
    if (formkey.currentState!.validate()) {
      return model.CreateEmailpass(
          emailController.text, passController.text, fname.text, lname.text);
    }
  }

  @override
  home(myuser user) {
    var pro=Provider.of<userprovider>(context,listen: false);
    pro.user=user;
    Navigator.pushReplacementNamed(context, homeview.RouteName);
  }
}
