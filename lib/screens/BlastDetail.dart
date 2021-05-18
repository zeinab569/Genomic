
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theblast/screens/search.dart';
import 'package:theblast/widgets/BottomNav.dart';
import 'package:theblast/widgets/NAV.dart';
import 'BlastnDetail.dart';
import 'home.dart';
class HomeScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<HomeScreen > {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
       appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(right:40),
            child: Text("Blast", style: TextStyle(fontSize: 30,fontStyle: FontStyle.italic,fontWeight:FontWeight.bold,)),
          ),
          backgroundColor: Colors.teal,
         leading: IconButton(icon:Icon(Icons.arrow_back_ios,size: 25,), onPressed:(){Navigator.pop(context);}),
         elevation: 0,
       ),
       body: ListView(
           children: <Widget>[

             Image.asset("images/DNA5.jpg",),

             Padding(
              padding: const EdgeInsets.only(right:20,left: 20),
               child: Container(
                  height:310,
                   width: 190,
                   decoration: BoxDecoration(
                       color: Colors.white,
                       boxShadow: [BoxShadow(
                           color:Colors.tealAccent,
                           offset: Offset(3,3),
                           blurRadius:5
                       )]
                   ),
                 child: Column(
                   children: <Widget>[
                     Padding(
                       padding: const EdgeInsets.all(17),
                       child: Text("BLAST(Basic Local Alignment Search Tool) "
                           "  finds regions of similarity between biological sequences . "
                           " The program compares nucleotide or protein sequences to sequence databases and calculates the statistical significance ,Including five types, they are blastn,blastp,blastx,tblastx ,And tblastn"
                           " Our application that will be based on blastn nucleotide to nucleotide , It is specific to nucleic acid searches only in terms of bases .",

                           style:TextStyle(
                             fontSize: 19
                           ) ,
                       ),
                     ),
                     SizedBox(
                        height:3,
                     ),

                   ],
                 ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(left:280,top: 2),
               child: GestureDetector(
                 onTap: (){
                   changeScreen(context, BlastN());
                 },
                 child: Text("Learn more",style: TextStyle(
                     color: Colors.teal,
                     fontSize: 20,
                   fontWeight: FontWeight.w700
                 ),),
               ),
             ),
           ],
         ),
        bottomNavigationBar:  Container(
            height: 57,
            decoration: BoxDecoration(
              color:Colors.white,
            ),
            child: Row(
              mainAxisAlignment:MainAxisAlignment.spaceAround ,
              children: <Widget>[
                GestureDetector(
                    onTap: (){
                      changeScreen(context, Home());
                    },
                    child: BottomNav(Icons.home, 'Home', Colors.teal)

                ),
                GestureDetector(
                    onTap: (){
                      changeScreen(context, Search());
                    },
                    child: BottomNav(Icons.search, 'Search', Colors.teal)
                )
              ],
            )
        ),
      ),
    );
  }
}