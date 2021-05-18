import 'package:flutter/material.dart';
class BottomNav  extends StatelessWidget {
  final IconData icon ;
  final String name ;
  final Color  color;
  BottomNav(this.icon,this.name,this.color);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
         Padding(
            padding: EdgeInsets.all(0.8),
           child:Icon(
             icon , size: 33,color: color,
           )
         ),
        SizedBox(
           height: 1,
        ),
        Text(name,style: TextStyle(fontSize:18,color:Colors.teal,fontWeight: FontWeight.w700),)
      ],
    );
  }
}