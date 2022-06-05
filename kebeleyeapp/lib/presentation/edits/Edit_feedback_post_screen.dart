import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kebeleyeapp/materials/colors.dart';

class editofficialpost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:[ Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom:8.0),
                child: Text("UPDATE",style: TextStyle(fontSize: 20),),
              ),
              Padding(
                padding: EdgeInsets.only(right: 80, left: 80, bottom: 20),
                child: Container(
                  child: Row(
                    children: [
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.only(left: 50),
                          child: TextFormField(
                            key: Key("a"),
                            style: TextStyle(color: Colors.black),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: coloringclasss.TEXTCOLOR1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(35.0))),
                                hintText: "day",
                                label: Text("day"),
                                labelStyle: TextStyle(color: Colors.black),
                                hintStyle: TextStyle(color: Colors.black)),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.only(right: 10, left: 10),
                          child: TextFormField(
                            key: Key("b"),
                            style: TextStyle(color: Colors.black),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: coloringclasss.TEXTCOLOR1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0))),
                              hintText: "month",
                              hintStyle: TextStyle(color: Colors.black),
                              label: Text("month"),
                              labelStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.only(right: 40, left: 10),
                          child: TextFormField(
                            key: Key("c"),
                            style: TextStyle(color: Colors.black),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: coloringclasss.TEXTCOLOR1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0))),
                              hintText: "year",
                              hintStyle: TextStyle(color: Colors.black),
                              label: Text("year"),
                              labelStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40, left: 50, bottom: 20.0),
                child: Row(
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(left: 90, right: 70),
                        child: TextFormField(
                          key: Key("d"),
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: coloringclasss.TEXTCOLOR1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(35.0))),
                            hintText: "from time",
                            hintStyle: TextStyle(color: Colors.black),
                            label: Text("from time"),
                            labelStyle: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(right: 90),
                        child: TextFormField(
                          key: Key("e"),
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: coloringclasss.TEXTCOLOR1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(35.0))),
                            hintText: "to time",
                            hintStyle: TextStyle(color: Colors.black),
                            label: Text("to time"),
                            labelStyle: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 400,
                width: 400,
                child: TextFormField(
                  maxLines: 20,
                  style: TextStyle(color: Colors.black),
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: coloringclasss.TEXTCOLOR1),
                        borderRadius: BorderRadius.all(Radius.circular(35.0))),
                    hintText: 'update',
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                width: 100,
                height: 50,
                child: RaisedButton(
                  
                    child: Text(
                      "Update",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    shape: StadiumBorder(),
                    color: Colors.purple,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    textColor: Colors.white,
                    onPressed: () {}),
              )
            ],
          ),
        ),
        ]
      ),
    );
  }
}
