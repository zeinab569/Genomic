import 'package:blast/helpers/commens.dart';
import 'package:blast/helpers/screen_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bottom_navigation_icons.dart';




class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        title: Text('Bioinformatics'),
        centerTitle: true,
      ),
      
      body:Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/bioinfo.jpg'),
              fit: BoxFit.cover,
            )
        ),

        child: ListView(
          children: [
            
          ],
        ),
      ),

      bottomNavigationBar: Container(
        height: 70,
        color: white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            BottomNavIcons(icon: Icons.home,name: "Home",onTap: (){ changeScreen(context, Home());},),

            BottomNavIcons(icon:Icons.search,name:"search",onTap: (){},),

            BottomNavIcons(icon:Icons.more,name:"learn more",onTap: (){},),

            BottomNavIcons(icon:Icons.computer,name:"Bioinformatics",onTap: (){},),
          ],
        ),
      ),
    );

  }
}
