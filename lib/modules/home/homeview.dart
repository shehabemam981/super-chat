import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superchat/base/baseview.dart';
import 'package:superchat/modules/home/homenavigator.dart';
import 'package:superchat/modules/home/homeviewmodel.dart';
import 'package:superchat/modules/login/loginview.dart';

class homeview extends StatefulWidget {
  static const String RouteName = "home";

  @override
  State<homeview> createState() => _homeviewState();
}

class _homeviewState extends baseview<homeview, homeviewmodel>
    implements homenavigator {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => model,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Super Chat"),
          actions: [
            InkWell(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, loginview.RouteName);
                  },
                child: Icon(Icons.logout)),
          ],
        ),
      ),
    );
  }

  @override
  ViewModel() {
    return homeviewmodel();
  }
}
