import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kebeleyeapp/Dataprovider/official_dataprovider.dart';
import 'package:kebeleyeapp/materials/colors.dart';
import 'package:kebeleyeapp/pages/loginofficials.dart';
import 'package:http/http.dart' as http;
import 'package:go_router/go_router.dart';
import 'package:kebeleyeapp/repository/exporter.dart';

import '../Bloc/bloc.dart';
import '../Dataprovider/dataproviders.dart';

class LoginPage extends StatelessWidget {
  final homepagebloc = AuthBloc(
      membersRepository: MembersRepository(MemberDataProvider()),
      officialRepository: OfficialRepository(OfficialDataProvider()));
  final _formkey1 = GlobalKey<FormState>();
  final _formkey2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homepagebloc,
      child: Scaffold(
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
            Positioned(
                top: 200,
                child: Container(
                  padding: EdgeInsets.all(20),
                  height: 420,
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
                  child: BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is GotoOfficialLoginPageState) {
                        context.go("/");
                      }
                      if (state is SignupSuccesfulState){
                        homepagebloc.add(LoginScreenEvent());
                      if (state is SignupFailedState){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Signup failed try again.")));
                      }
                      }
                    },
                    builder: (context, state) {
                      return BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          final namecontroller = TextEditingController();
                          final idcontroller = TextEditingController();
                          final passcontroller = TextEditingController();
                          String passwordholding = "";
                          var confirmpasscontroller;
                          var idlogcontroller;
                          var passlogcontroller;
                          return Column(
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Text("LOGIN",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: state is SignupState
                                                    ? coloringclasss.TEXTCOLOR1
                                                    : coloringclasss
                                                        .Activecolor)),
                                        if ((state is LoginState))
                                          Container(
                                            margin: EdgeInsets.only(top: 3),
                                            height: 2,
                                            width: 55,
                                            color: Colors.blue,
                                          )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("Signup",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: state is SignupState
                                                    ? coloringclasss.Activecolor
                                                    : coloringclasss
                                                        .TEXTCOLOR1)),
                                        if (state is SignupState)
                                          Container(
                                            margin: EdgeInsets.only(top: 2),
                                            height: 2,
                                            width: 55,
                                            color: Colors.blue,
                                          )
                                      ],
                                    )
                                  ]),
                              state is SignupState
                                  ? Form(
                                      key: _formkey1,
                                      // margin: EdgeInsets.only(top: 20),
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            controller: namecontroller,
                                            obscureText: false,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                                prefixIcon: Icon(Icons.person),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: coloringclasss
                                                                .TEXTCOLOR1),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    35.0))),
                                                contentPadding:
                                                    EdgeInsets.all(10),
                                                hintText: "Full name",
                                                hintStyle: const TextStyle(
                                                    fontSize: 14,
                                                    color: coloringclasss
                                                        .TEXTCOLOR1)),
                                            validator: (String? name) {
                                              if (name == Null ||
                                                  name!.isEmpty) {
                                                return "Full Name field cannot be Empty.";
                                              }
                                            },
                                          ),
                                          TextFormField(
                                            controller: idcontroller,
                                            obscureText: false,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                                prefixIcon: Icon(Icons.person),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: coloringclasss
                                                                .TEXTCOLOR1),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    35.0))),
                                                contentPadding:
                                                    EdgeInsets.all(10),
                                                hintText: "Kebeleye Id",
                                                hintStyle: const TextStyle(
                                                    fontSize: 14,
                                                    color: coloringclasss
                                                        .TEXTCOLOR1)),
                                            validator: (String? kebeleid) {
                                              if (kebeleid == Null ||
                                                  kebeleid!.isEmpty) {
                                                return "Kebeleye Id field cannot be Empty.";
                                              }
                                            },
                                          ),
                                          TextFormField(
                                            controller: passcontroller,
                                            obscureText: false,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                                prefixIcon: Icon(Icons.person),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: coloringclasss
                                                                .TEXTCOLOR1),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    35.0))),
                                                contentPadding:
                                                    EdgeInsets.all(10),
                                                hintText: "Password",
                                                hintStyle: const TextStyle(
                                                    fontSize: 14,
                                                    color: coloringclasss
                                                        .TEXTCOLOR1)),
                                            validator: (String? password) {
                                              if (password == Null ||
                                                  password!.isEmpty) {
                                                return "Password field cannot be Empty.";
                                              }
                                              passwordholding = password;
                                              final validPassword =
                                                  password.length >= 8;
                                              return validPassword
                                                  ? null
                                                  : "Password too short";
                                            },
                                          ),
                                          TextFormField(
                                            controller: confirmpasscontroller,
                                            obscureText: false,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                                prefixIcon: Icon(Icons.person),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: coloringclasss
                                                                .TEXTCOLOR1),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    35.0))),
                                                contentPadding:
                                                    EdgeInsets.all(10),
                                                hintText: "Confirm password",
                                                hintStyle: const TextStyle(
                                                    fontSize: 14,
                                                    color: coloringclasss
                                                        .TEXTCOLOR1)),
                                            validator:
                                                (String? confirmpassword) {
                                              if (confirmpassword == Null ||
                                                  confirmpassword!.isEmpty) {
                                                return "Confirm Password cannot be empty";
                                              }
                                              if (passwordholding !=
                                                  confirmpassword) {
                                                return "Password don't match.";
                                              }
                                            },
                                          ),
                                          Container(
                                            child: TextButton(
                                              onPressed: () {
                                                homepagebloc.add(
                                                    GotoOfficialLoginEvent());
                                                //
                                              },
                                              child: const Text(
                                                "Are you Administrators or Officials? for Signup/login click here",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.orange),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.08,
                                            width: double.infinity,
                                            child: SizedBox(
                                              width: double.infinity,
                                              child: RaisedButton(
                                                color: blueColors,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                  Radius.circular(20),
                                                )),
                                                onPressed: () {
                                                  final formValid = _formkey1.currentState!.validate();
                                                  if (!formValid) return;
                                                  homepagebloc.add(SignupMemberEvent(idcontroller.text, passcontroller.text));
                                                  //http request to be send
                                                },
                                                child: 
                                                (state is SignUpingState) ? const CircularProgressIndicator():
                                                Text(
                                                  "Sign up",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                  ),
                                                )
                                                
                                                
                                              ),
                                            ),
                                          )
                                        ],
                                      ))
                                  : Form(
                                      key: _formkey2,
                                      child: Container(
                                          margin: EdgeInsets.only(top: 20),
                                          child: Column(
                                            children: [
                                              TextFormField(
                                            controller: idlogcontroller,
                                            obscureText: false,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                                prefixIcon: Icon(Icons.person),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: coloringclasss
                                                                .TEXTCOLOR1),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    35.0))),
                                                contentPadding:
                                                    EdgeInsets.all(10),
                                                hintText: "Kebeleye Id",
                                                hintStyle: const TextStyle(
                                                    fontSize: 14,
                                                    color: coloringclasss
                                                        .TEXTCOLOR1)),
                                            validator: (String? kebeleid) {
                                              if (kebeleid == Null ||
                                                  kebeleid!.isEmpty) {
                                                return "Kebeleye Id field cannot be Empty.";
                                              }
                                            },
                                          ),
                                              SizedBox(height: 88.0),
                                              TextFormField(
                                            controller: passlogcontroller,
                                            obscureText: false,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                                prefixIcon: Icon(Icons.person),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: coloringclasss
                                                                .TEXTCOLOR1),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    35.0))),
                                                contentPadding:
                                                    EdgeInsets.all(10),
                                                hintText: "Password",
                                                hintStyle: const TextStyle(
                                                    fontSize: 14,
                                                    color: coloringclasss
                                                        .TEXTCOLOR1)),
                                            validator: (String? password) {
                                              if (password == Null ||
                                                  password!.isEmpty) {
                                                return "Password field cannot be Empty.";
                                              }
                                              passwordholding = password;
                                              final validPassword =
                                                  password.length >= 8;
                                              return validPassword
                                                  ? null
                                                  : "Password too short";
                                            },
                                          ),
                                              
                                              Container(
                                                child: TextButton(
                                                  onPressed: () {
                                                    homepagebloc.add(GotoOfficialLoginEvent());
                                                  },
                                                  child: const Text(
                                                    "Are you Administrators or Officials? for Signup/login click here",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.orange),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.08,
                                                width: double.infinity,
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  child: RaisedButton(
                                                    color: blueColors,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                      Radius.circular(20),
                                                    )),
                                                    onPressed: () {
                                                      final formValid = _formkey2.currentState!.validate();
                                                  if (!formValid) return;
                                                  homepagebloc.add(LoginMemberEvent(idlogcontroller.text, passlogcontroller.text));
                                                  if (state is LoginginState){
                                                    return null;
                                                  }
                                                      //http request
                                                    },
                                                    
                                                    child: (state is LoginginState)? CircularProgressIndicator():
                                                    Text(
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
                                          )))
                            ],
                          );
                        },
                      );
                    },
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
