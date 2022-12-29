

import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
final options = [{
  'title': 'Uno',
  'icon': Icons.play_lesson
}, 
{
  'title': 'Dos',
  'icon':Icons.podcasts
},
{
  'title': 'Tres',
  'icon': Icons.polymer
}
,
{
  'title': 'Cuatro',
  'icon':Icons.print
}
,
{
  'title': 'Cinco',
  'icon': Icons.king_bed
}];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(title: Text('Componentes'),),
body: ListView(
children: _getColumsOptions(),

),
    );
  }




List<Widget> _getColumsOptions(){
return options.map((e) {
final icon=   e['icon'] as IconData;
return Column(
children: [
ListTile(
title: Text(e['title'].toString()),
leading: Icon(icon),
 trailing: Icon(Icons.keyboard_arrow_right),
 onTap: ()=>{},
),
Divider()
],
);
}).toList();

}


}