import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kebeleyeapp/materials/colors.dart';
import 'package:kebeleyeapp/pages/loginofficials.dart';
import 'package:http/http.dart' as http;
import 'package:go_router/go_router.dart';

import '../Bloc/bloc.dart';

class LoginPage extends StatelessWidget {


  bool isSignupScreen = true;
  bool isRememberme = false;
  bool isbscure = true;
  final _formkey1 = GlobalKey<FormState>();
  final _formkey2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: coloringclasss.backgroundcolor,
      body: Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                    image: AssetImage("assets/logo16.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              )),
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is LoginOfficialstate){
                context.go("/loginofficials");
              }
            },
            builder: (context, state) {
              return Positioned(
                  top: 200,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    height: state.issignupScreen ? 350 : 420,
                    width: MediaQuery.of(context).size.width - 40,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 15,
                            spreadRadius: 5,
                          )
                        ]),
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                final authBloc =
                                  BlocProvider.of<AuthBloc>(context);
                              authBloc.add(ChangetoScreens(is_signupscreen: false)
                              );
                                },
                                child: Column(
                                  children: [
                                    Text("LOGIN",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: state.issignupScreen
                                                ? coloringclasss.TEXTCOLOR1
                                                : coloringclasss.Activecolor)),
                                    if (!state.issignupScreen)
                                      Container(
                                        margin: EdgeInsets.only(top: 3),
                                        height: 2,
                                        width: 55,
                                        color: Colors.blue,
                                      )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  final authBloc =
                                  BlocProvider.of<AuthBloc>(context);
                              authBloc.add(ChangetoScreens(is_signupscreen: true)
                              );
                                },
                                child: Column(
                                  children: [
                                    Text("Signup",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: state.issignupScreen
                                                ? coloringclasss.Activecolor
                                                : coloringclasss.TEXTCOLOR1)),
                                    if (state.issignupScreen)
                                      Container(
                                        margin: EdgeInsets.only(top: 2),
                                        height: 2,
                                        width: 55,
                                        color: Colors.blue,
                                      )
                                  ],
                                ),
                              )
                            ]),
                        state.issignupScreen
                            ? _buildsignupsection(context)
                            : _buildloginsection(context)
                      ],
                    ),
                  ));
            },
          )
        ],
      ),
    );
  }

  Form _buildsignupsection(BuildContext context) {
    return Form(
        key: _formkey1,
        // margin: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            _buildtextfield(Icons.person, "Full name", false, false),
            _buildtextfield(Icons.person, "Kebele ID", false, true),
            _buildtextfield(Icons.password, "Password", true, false),
            _buildtextfield(Icons.password, "Confirm Password", true, false),
            Container(
              child: TextButton(
                onPressed: () {
                  final authBloc =
                                  BlocProvider.of<AuthBloc>(context);
                              authBloc.add(TologinOfficial());
                },
                child: const Text(
                  "For Administrators and Officials ? Signup/login here",
                  style: TextStyle(fontSize: 12, color: Colors.orange),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.08,
              width: double.infinity,
              child: SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  color: blueColors,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  )),
                  onPressed: () {
                    //http request to be send
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }

  Form _buildloginsection(BuildContext context) {
    return Form(
        key: _formkey2,
        child: Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                _buildtextfield(Icons.person, "Kebele ID", false, true),
                SizedBox(height: 88.0),
                _buildtextfield(Icons.password, "password", true, false),
                
                Container(
                  child: TextButton(
                    onPressed: () {final authBloc =
                                  BlocProvider.of<AuthBloc>(context);
                              authBloc.add(TologinOfficial());
                    },
                    child: const Text(
                      "For Administrators and Officials ? Signup/login here",
                      style: TextStyle(fontSize: 12, color: Colors.orange),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: double.infinity,
                  child: SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      color: blueColors,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      )),
                      onPressed: () async {
                        //http request
                      },
                      child: Text(
                        "Log in",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )));
  }

  TextFormField _buildtextfield(
      IconData icon, String hintText, bool ispassword, bool isEmail) {
    return TextFormField(
      obscureText: ispassword ? isbscure : false,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      decoration: InputDecoration(
          prefixIcon: Icon(icon),
          
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: coloringclasss.TEXTCOLOR1),
              borderRadius: BorderRadius.all(Radius.circular(35.0))),
          contentPadding: EdgeInsets.all(10),
          hintText: hintText,
          hintStyle:
              const TextStyle(fontSize: 14, color: coloringclasss.TEXTCOLOR1)),
      onSaved: (value) {
        // name = value!;
      },
    );
  }
}
