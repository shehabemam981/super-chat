import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superchat/modules/home/homeview.dart';
import 'package:superchat/modules/login/loginview.dart';
import 'package:superchat/modules/signup/signupview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:superchat/provider/userprovider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
      create: ( context)=> userprovider(),
  child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context){
    var pro=Provider.of<userprovider>(context);
    return MaterialApp(
      initialRoute:(pro.userauth!=null)?homeview.RouteName:loginview.RouteName,
      routes: {
        Signup.RouteName:(context)=>Signup(),
        loginview.RouteName:(context)=>loginview(),
        homeview.RouteName:(context)=>homeview(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}