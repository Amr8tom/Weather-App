import 'package:flutter/material.dart';
class newcity extends StatelessWidget {
  final String cityname;
  newcity({@required this.cityname});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Weather in $cityname"),),
    );
  }
}
