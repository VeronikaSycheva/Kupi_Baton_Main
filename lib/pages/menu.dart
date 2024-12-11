import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/services/my_text.dart';
import '../services/gradient_box.dart';

class Menu extends StatelessWidget {

  TextButton ButtonInMenu(String textOn, String nav, BuildContext context)
  {
    return TextButton(onPressed: () {
      Navigator.pushNamed(context, nav);
    }, child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyText(text: textOn, isTitle: false, isDark: true),
          Container(
            width: 40,
            height: 40,
            child: Image.asset('assets/right.png')
          )
        ]
    ),
        style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.all(25)))
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Row(children: [
            Container(
              child: Image.asset('assets/bread.png'),
              width: 64,
              height: 64,
            ),
            Container(
              child: MyText(text: ' Kupi baton', isTitle: true, isDark: true),
              height: 50,
            )
          ],)
        ),
        body: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Grad(ButtonInMenu('Profile', '/prof', context),'assets/gradient1.jpg'),
              Padding(padding: EdgeInsets.only(top: 40)),
              Grad(ButtonInMenu('Shopping lists', '/hab', context),'assets/gradient2.jpg'),
              Padding(padding: EdgeInsets.only(top: 40)),

            ],
          ),
        ),
      ),
    );
  }
}
