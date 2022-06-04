import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kebeleyeapp/materials/colors.dart';

class editofficialpost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
                                   Padding(
                          padding: EdgeInsets.only(right:80,left:80,bottom: 20),
                          child: Container(
                            child: Row(
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 30),
                                    child: TextFormField(
                                      key: Key("a"),
                                      style: TextStyle(color: Colors.black),
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color:
                                                      coloringclasss.TEXTCOLOR1),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(35.0))),
                                          hintText: "day",
                                          label: Text("day"),
                                          labelStyle:
                                              TextStyle(color: Colors.black),
                                          hintStyle: TextStyle(
                                              color:
                                                Colors.black
                                                  )),
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
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(35.0))),
                                        hintText: "month",
                                        hintStyle: TextStyle(color: Colors.black),
                                        label: Text("month"),
                                        labelStyle:
                                            TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 40, left: 10),
                                    child: TextFormField(
                                      key: Key("c"),
                                      style: TextStyle(
                                          color: 
                                               Colors.black
                                              ),
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: coloringclasss.TEXTCOLOR1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(35.0))),
                                        hintText: "year",
                                        hintStyle: TextStyle(color: Colors.black),
                                        label: Text("year"),
                                        labelStyle:
                                            TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 40, left: 10,bottom: 20.0),
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
                                          borderSide: BorderSide(
                                              color: coloringclasss.TEXTCOLOR1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(35.0))),
                                      hintText: "from time",
                                      hintStyle: TextStyle(color: Colors.black),
                                      label: Text("from time"),
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.only( right: 90),
                                  child: TextFormField(
                                    key: Key("e"),
                                    style: TextStyle(
                                        color:  Colors.black
),
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: coloringclasss.TEXTCOLOR1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(35.0))),
                                      hintText: "to time",
                                      hintStyle: TextStyle(color: Colors.black),
                                      label: Text("to time"),
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

            Container(
              height: 500,
              width: 500,
              child: TextFormField(
      maxLines: 20,

                style: TextStyle(color: Colors.white),
                        decoration: new InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.blue, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: coloringclasss.TEXTCOLOR1),
                  borderRadius: BorderRadius.all(
                      Radius.circular(35.0))),
              hintText: 'POST',
              hintStyle: TextStyle(color: Colors.black),
            ),
      ),
      
              ),

               Padding(
                          padding: EdgeInsets.only(left: 30, right: 30),
                          child: RaisedButton(
                              child: Text(
                                "Post",
                                style: TextStyle(
                                  fontSize: 24,
                                ),
                              ),
                              shape: StadiumBorder(),
                              color: Colors.purple,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              textColor: Colors.white,
                              onPressed: () {}),
                        )
          ],
        ),
          ),
          
    );
  }
}
