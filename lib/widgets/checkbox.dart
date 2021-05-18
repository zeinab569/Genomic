
import 'package:flutter/material.dart';

import 'NAV.dart';

class Anothersearch extends StatefulWidget {
  @override
  _AnothersearchState createState() => _AnothersearchState();
}

class _AnothersearchState extends State<Anothersearch> {
  var checkbox1 =true;
  var radio=0;
  checkbox(bool val){
    setState(() {
      checkbox1=val;
    });
  }

  void Radiochecked (int val){
    setState(() {
      radio=val;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading:  IconButton(icon:Icon(Icons.arrow_back_ios,size: 25,), onPressed: (){Navigator.pop(context);})
      ),
        backgroundColor: Colors.white12,
        body:ListView(
            children: <Widget>[
              SizedBox(
                height: 5,
              ),
              Container(
              color: Colors.white70,
              width:150 ,
              height: 300,
              child:Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5, right:150),
                    child: Container(
                      color: Colors.white70,
                      child:  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Enter Query Sequence",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.teal),),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom:5,top: 5,left:10),
                    child: Text("Enter acceesion number(s) ,gi(s), or FASTA sequence(s):-",style: TextStyle(fontWeight:FontWeight.w700),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration:BoxDecoration(
                        color:Colors.white ,
                        borderRadius: BorderRadius.only(
                            bottomLeft:Radius.circular(20)
                        ),
                      ),

                      child: TextFormField(
                        cursorColor: Colors.teal,
                        autofocus:false,
                        maxLines: null,
                        textInputAction: TextInputAction.search,
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                            hintText: "Enter Your Sequence:-",
                            enabledBorder:OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft:Radius.circular(20)
                                ),
                                borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 2.0,
                                    style: BorderStyle.solid
                                )
                            ),
                            focusedBorder:OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.teal,
                                  width: 2.0,
                                  style: BorderStyle.solid
                              ),
                              borderRadius: BorderRadius.only(
                                  bottomLeft:Radius.circular(20)
                              ),
                            )
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom:0.1,top: 7,left: 24),
                      child: Row(
                        children: <Widget>[
                          Text("Or, upload file:-",style: TextStyle(fontWeight:FontWeight.w800),),
                          Padding(
                            padding: const EdgeInsets.only(left:8),

                            child: FlatButton(
                              onPressed:(){
                                print("choose file");
                              },
                              child:Text("Choose File"),
                              color: Colors.white,
                              textColor: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:8,top: 1),
                            child: Text("No choose file",style: TextStyle(fontWeight: FontWeight.w500),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 27),
                            child: Icon(Icons.help,color: Colors.teal,),
                          )
                        ],
                      )
                  ),
                  GestureDetector(
                      onTap: (){
                        changeScreen(context,Anothersearch());
                      },
                      child:Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              color: Colors.white,
                              child: FlatButton(
                                  child: Text("Align two or more sequences",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 18,
                                          color: Colors.black
                                      )
                                  )
                              ),
                            ),
                          ),
                          Icon(Icons.help,color: Colors.teal,)
                        ],
                      )
                  ),

                ],
              ),
            ),
              SizedBox(
                height:10 ,
              ),
              Container(
                color: Colors.white70,
                width:100 ,
                height: 220,
                child:Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5, right:150),
                      child: Container(
                        color: Colors.white70,
                        child:  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Enter Subject Sequence",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.teal),),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom:5,top: 5,left:10),
                      child: Text("Enter acceesion number(s) ,gi(s), or FASTA sequence(s):-",style: TextStyle(fontWeight:FontWeight.w700),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        decoration:BoxDecoration(
                          color:Colors.white ,
                          borderRadius: BorderRadius.only(
                              bottomLeft:Radius.circular(20)
                          ),
                        ),

                        child: TextFormField(
                          cursorColor: Colors.teal,
                          autofocus:false,
                          maxLines: null,
                          textInputAction: TextInputAction.search,
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                              hintText: "Enter Your Sequence:-",
                              enabledBorder:OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft:Radius.circular(20)
                                  ),
                                  borderSide: BorderSide(
                                      color: Colors.grey,
                                      width: 2.0,
                                      style: BorderStyle.solid
                                  )
                              ),
                              focusedBorder:OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.teal,
                                    width: 2.0,
                                    style: BorderStyle.solid
                                ),
                                borderRadius: BorderRadius.only(
                                    bottomLeft:Radius.circular(20)
                                ),
                              )
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom:0.1,top: 7,left: 24),
                        child: Row(
                          children: <Widget>[
                            Text("Or, upload file:-",style: TextStyle(fontWeight:FontWeight.w800),),
                            Padding(
                              padding: const EdgeInsets.only(left:8),

                              child: FlatButton(
                                onPressed:(){
                                  print("choose file");
                                },
                                child:Text("Choose File"),
                                color: Colors.white,
                                textColor: Colors.black,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:8,top: 1),
                              child: Text("No choose file",style: TextStyle(fontWeight: FontWeight.w500),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 27),
                              child: Icon(Icons.help,color: Colors.teal,),
                            )
                          ],
                        )
                    ),
                  ],
                ),
              ),
              SizedBox(
                height:9,
              ),

              Container(
                color: Colors.white70,
                width:100 ,
                height: 220,
                child:Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5, right:190),
                      child: Container(
                        color: Colors.white70,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Program Selection",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.teal),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left:20),
                          child: Text("Optimize for ",style: TextStyle(fontWeight: FontWeight.w700)),
                        ),
                        Radio(
                            value: 0,
                            groupValue: radio,
                            onChanged:Radiochecked,
                          activeColor: Colors.teal,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text("Highly similar sequences (megablast)",style: TextStyle(fontWeight: FontWeight.w500),),
                        ),

                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: Row(
                        children: <Widget>[

                          Radio(
                              value: 1,
                              groupValue: radio,
                              onChanged:Radiochecked,
                              activeColor: Colors.teal,
                          ),
                          Text("More dissimilar sequences",style: TextStyle(fontWeight: FontWeight.w500),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: Row(
                        children: <Widget>[
                          Radio(
                              value: 2,
                              groupValue: radio,
                              onChanged:Radiochecked,
                             activeColor: Colors.teal,
                          ),
                          Text("Optimize forSomewhat similar sequences",style: TextStyle(fontWeight: FontWeight.w500),)
                        ],
                      ),
                    )
                  ],
                ),
              )
            ]
        ),
    );
  }
}