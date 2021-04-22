
import 'package:flutter/material.dart';
import 'package:theblast/widgets/title.dart';

import '../helpers/commens.dart';

class BottomNavIcons extends StatelessWidget {
  final IconData icon;
  final String name;
  final Function onTap;

  BottomNavIcons({@required this.icon,@required this.name,@required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap?? null,
        child: Column(children:<Widget>[
          Icon(icon,color:blue,size:30),
          CustomText(text: name,size: 14,),
        ],),
      ),
    );
  }
}
