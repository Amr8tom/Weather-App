import 'package:flutter/material.dart';
import 'layout.dart';
class A extends StatelessWidget {
  final String cityname;
  final String temp;
  A({this.cityname , this.temp});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Weather in $cityname"),),
      body: Center(
        child: Container(
          child:Text("The tempreture in $cityname is $temp") ,
        ),
      ),
    );
  }
}
