import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kebeleyeapp/materials/colors.dart';
import 'package:kebeleyeapp/pages/loginofficials.dart';
import 'package:http/http.dart' as http;
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isSignupScreen = true;
  bool isRememberme = false;
  bool isbscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: coloringclasss.backgroundcolor,
        body: Stack(children: [
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
                height: isSignupScreen ? 420 : 350,
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
                              setState(() {
                                isSignupScreen = false;
                              });
                            },
                            child: Column(
                              children: [
                                Text("LOGIN",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: isSignupScreen
                                            ? coloringclasss.TEXTCOLOR1
                                            : coloringclasss.Activecolor)),
                                if (!isSignupScreen)
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
                              setState(() {
                                isSignupScreen = true;
                              });
                            },
                            child: Column(
                              children: [
                                Text("Signup",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: isSignupScreen
                                            ? coloringclasss.Activecolor
                                            : coloringclasss.TEXTCOLOR1)),
                                if (isSignupScreen)
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
                    isSignupScreen
                        ? buildsignupsection(context)
                        : Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                buildtextfield(
                                    Icons.person, "Kebele ID", false, true),
                                buildtextfield(
                                    Icons.password, "password", true, false),
                                Container(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Forget Password?",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: coloringclasss.textcolor2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: TextButton(
                                    onPressed: () {
                                      context.go("/loginofficials");
                                    },
                                    child: const Text(
                                      "For Administrators and Officials ? Signup/login here",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.orange),
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height:
                                      MediaQuery.of(context).size.height * 0.08,
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
                            ))
                  ],
                ),
              ))
        ]));
  }

  Form buildsignupsection(BuildContext context) {
    return Form(
        // margin: EdgeInsets.only(top: 20),
        child: Column(
      children: [
        buildtextfield(Icons.person, "Full name", false, false),
        buildtextfield(Icons.person, "Kebele ID", false, true),
        buildtextfield(Icons.password, "Password", true, false),
        buildtextfield(Icons.password, "Confirm Password", true, false),
        Container(
          child: TextButton(
            onPressed: () {
              context.go("/loginofficials");
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

  Form buildtextfield(
      IconData icon, String hintText, bool ispassword, bool isEmail) {
    return Form(
      // key: _formkey,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: TextFormField(
          obscureText: ispassword ? isbscure : false,
          keyboardType:
              isEmail ? TextInputType.emailAddress : TextInputType.text,
          decoration: InputDecoration(
              prefixIcon: Icon(icon),
              suffixIcon: ispassword
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isbscure = !isbscure;
                        });
                      },
                      icon: Icon(
                          isbscure ? Icons.visibility_off : Icons.visibility))
                  : null,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: coloringclasss.TEXTCOLOR1),
                  borderRadius: BorderRadius.all(Radius.circular(35.0))),
              contentPadding: EdgeInsets.all(10),
              hintText: hintText,
              hintStyle: const TextStyle(
                  fontSize: 14, color: coloringclasss.TEXTCOLOR1)),
          onSaved: (value) {
            // name = value!;
          },
        ),
      ),
    );
  }
}
