import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kebeleyeapp/materials/colors.dart';

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
      context.go("/");
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
