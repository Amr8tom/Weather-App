import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app22/CatApp/A.dart';
import 'package:flutter_app22/modules/NewCitry.dart';
import 'package:http/http.dart' as http;
var tempp;
class CatApp extends StatefulWidget {
  //const CatApp({Key key}) : super(key: key);
  @override
  _CatAppState createState() => _CatAppState();
}

class _CatAppState extends State<CatApp> {

  Future weather ({ @required String Country}) async {
    http.Response response = await http.get(Uri.parse(
        "http://api.weatherapi.com/v1/current.json?key=01c8a9078ab4444cba1212722212108&q=$Country&aqi=yes"));
    if(response.statusCode==200){
      var API_data = jsonDecode(response.body);
      print("${API_data["current"]["temp_c"]}");
      tempp=API_data["current"]["temp_c"];
      setState(() {

      });
    }
    else
    {
      return "Error 404 CUZ :::  ${response.statusCode.toString()}";
      setState(() {});
    }
  }

  TextEditingController x =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title:Text('Weather'),),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text("Enter the country",style: TextStyle(fontSize: 25.0),),
              ),
              TextFormField(
                onFieldSubmitted:(value){
                  print("$value");
                  print("${x.text}");
                  weather(Country: '${value}');
                  } ,
                controller: x,
                keyboardType: TextInputType.name,
                decoration:InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "City weather",
                  hintText: "Enter the city name",
                  prefix: IconButton(
                      onPressed: (){
                      },
                      icon: Icon(Icons.wb_sunny)
                  ),

                ),
              ),
              SizedBox(height: 20,),
              RaisedButton(
                child: Text("Press here",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                  onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => A(cityname: "${x.text}",temp: tempp,)));
              })
            ],
          ),
        ),
      ),
    );
  }
}