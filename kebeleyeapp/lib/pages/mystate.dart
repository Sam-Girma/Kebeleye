import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kebeleyeapp/materials/colors.dart';
import 'package:kebeleyeapp/pages/loginpage.dart';
import 'package:kebeleyeapp/pages/model_for_posts.dart';
import 'package:kebeleyeapp/pages/officialshomepage.dart';
import 'package:kebeleyeapp/pages/tosee_tosend_toreportpage.dart';
import 'loginofficials.dart';
import 'officialshomepage.dart';
import 'members_home_page.dart';
import 'package:go_router/go_router.dart';

class mystate extends StatefulWidget {
  @override
  State<mystate> createState() => _mycurrentstate();
}

class _mycurrentstate extends State<mystate> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 4000), () {
<<<<<<< HEAD
      Navigator.push(
          context, MaterialPageRoute(builder: (context) =>LoginPage()));
=======
      context.go("/");
>>>>>>> 5eca5152dcd6ed15351c561f78038ce554862116
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [blueColors, bluelightcolor],
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter),
            ),
            child: Center(child: Image.asset("assets/logo9.png"))));
  }
}
