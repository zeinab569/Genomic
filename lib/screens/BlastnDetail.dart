
import 'package:flutter/material.dart';
import 'package:theblast/screens/home.dart';
import 'package:theblast/widgets/BottomNav.dart';
import 'package:theblast/widgets/NAV.dart';
import 'package:theblast/screens/search.dart';
import 'home.dart';
class BlastN extends StatefulWidget {
  @override
  _BlastNState createState() => _BlastNState();
}

class _BlastNState extends State<BlastN> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("BlastN", style: TextStyle(fontSize: 30,fontStyle:FontStyle.italic,fontWeight:FontWeight.bold,)),
           backgroundColor: Colors.teal,
          leading: IconButton(icon:Icon(Icons.arrow_back_ios,size: 25,), onPressed: (){Navigator.pop(context);}),
        ),
        body:ListView(
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Image.asset("images/nucleutide-blast.jpg",),
            SizedBox(
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("BLASTn-what is BLASTn?",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,color: Colors.teal),),
            ),
            Padding(
                padding: const EdgeInsets.only(left:9),
              child: Text("*Basic Local Alignment Search Tool for Nucleotides",style: TextStyle(fontWeight: FontWeight.w500,)),
            ),
            Padding(
              padding: const EdgeInsets.only(left:25),
              child: Text("-DNA sequencing algorithm",style: TextStyle(fontWeight: FontWeight.w500,),),
            ),
            Padding(
              padding: const EdgeInsets.only(left:11),
              child: Text("*Finds regions of local similitry between nucleotide query and database sequences .",style: TextStyle(fontWeight: FontWeight.w500,)),
            ),
            Padding(
              padding: const EdgeInsets.only(left:11),
              child: Text("*Employs a heuristic search Algorithm that allows searches through databases by finding sequence hits and then extending them .",style: TextStyle(fontWeight: FontWeight.w500,)),
            ),
            Padding(
              padding: const EdgeInsets.only(left:11),
              child: Text("*Main criteria being speed , sensitivity ,and specificity .",style: TextStyle(fontWeight: FontWeight.w500,)),
            ),
            Padding(
              padding: const EdgeInsets.only(left:11),
              child: Text("*Cannot guaranntee 100% accurancy .",style: TextStyle(fontWeight: FontWeight.w500,)),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("BLASTn-Why is BLASTn useful?",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,color: Colors.teal),),
            ),
            Padding(
              padding: const EdgeInsets.only(left:9),
              child: Text("*Speeds up analysis of genomics data .",style: TextStyle(fontWeight: FontWeight.w500,)),
            ),
            Padding(
              padding: const EdgeInsets.only(left:25),
              child: Text("-Immensely valuable in the fields of personalized meddicine , detection of genomics mutations , and also contributes to understanding of molecular factors that lead to phenotypic diversity .",style: TextStyle(fontWeight: FontWeight.w500,)),
            ),
            Padding(
              padding: const EdgeInsets.only(left:11),
              child: Text("*Genomics data is expected to reach exabyte scale .",style: TextStyle(fontWeight: FontWeight.w500,)),
            ),
            Padding(
              padding: const EdgeInsets.only(left:25),
              child: Text("-Surpass YouTube and Twitter by 2025",style: TextStyle(fontWeight: FontWeight.w500,)),
            ),
            Padding(
              padding: const EdgeInsets.only(left:25),
              child: Text('-Fields of bioinformatics was developed to store , retrieve , organize , and analyze biological data .',style: TextStyle(fontWeight: FontWeight.w500,)),
            ),
            Padding(
              padding: const EdgeInsets.only(left:11),
              child: Text("*Despite advances in tech ,it is still difficult to process Overwhelming amount of genomics data .",style: TextStyle(fontWeight: FontWeight.w500,)),
            ),
            Padding(
              padding: const EdgeInsets.only(left:11),
              child: Text("*BLASTn is a DNA sequencing algorithm that analyzes genomic data .",style: TextStyle(fontWeight: FontWeight.w500,)),
            ),
            Padding(
              padding: const EdgeInsets.only(left:25,bottom: 10),
              child: Text("-Faster than full alignment procedures (Smith_Waterman) .",style: TextStyle(fontWeight: FontWeight.w500,)),
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