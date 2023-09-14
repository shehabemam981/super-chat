import 'package:flutter/material.dart';
import 'package:superchat/base/baseNavigator.dart';
import 'package:superchat/base/baseviewmodel.dart';

abstract class baseview<t extends StatefulWidget,vm extends baseviewmodel>extends State<t>
implements baseNavigator
{
 late vm model;
 ViewModel();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    model=ViewModel();
  }


  @override
  hideDialog() {
    Navigator.pop(context);
  }

  @override
  void  showdialog({String massege = "loading"}) {
     showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Row(
          children: [
            CircularProgressIndicator(),
            Text(massege),
          ],
        ),
      );
    }
    );
  }

  @override
  showmassege(String massege) {
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Row(
          children: [
            Text(massege),
          ],
        ),
      );
    }
    );
  }


}