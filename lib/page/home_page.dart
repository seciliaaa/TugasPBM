import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

void main() => runApp(MaterialApp(
      theme: ThemeData(primaryColor: Color(0xFF12a644)),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ));

class _HomePageState extends State<HomePage> {
  double _height = 170.0;
  double _weight = 75.0;
  int _bmi = 0;
  String _condition = 'Select data';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO : bikin tampilan UI
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            height: 270,
            width: double.infinity,
            decoration: new BoxDecoration(color: Colors.blue),
            padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "BMI",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 60.0),
                  ),
                  Text(
                    "Calculator",
                    style: TextStyle(color: Colors.white, fontSize: 40.0),
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: Container(
                        child: Text(
                          "$_bmi",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 45.0,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      )),
                  RichText(
                      text: TextSpan(
                          text: "Condition : ",
                          style: TextStyle(color: Colors.white, fontSize: 25.0),
                          children: <TextSpan>[
                        TextSpan(
                            text: "$_condition",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ))
                      ]))
                ]),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: double.infinity,
            child: Column(children: <Widget>[
              
              SizedBox(
                height: 25,
              ),
              Text(
                "Choose Data",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50,
              ),
              RichText(
                  text: TextSpan(
                      text: "Height : ",
                      style:
                          TextStyle(color: Color(0XFF403f3d), fontSize: 25.0),
                      children: <TextSpan>[
                    TextSpan(
                        text: "$_height cm",
                        style: TextStyle(
                          color: Color(0XFF403f3d),
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ))
                  ])),
              SizedBox(
                height: 25,
              ),
              Slider(
                value: _height,
                min: 0,
                max: 200,
                onChanged: (height) {
                  setState(() {
                    _height = height;
                  });
                },
                divisions: 250,
                label: "$_height",
                activeColor: Color(0XFF403f3d),
                inactiveColor: Colors.grey,
              ),
              SizedBox(
                height: 50,
              ),
              RichText(
                  text: TextSpan(
                      text: "Weight : ",
                      style:
                          TextStyle(color: Color(0XFF403f3d), fontSize: 25.0),
                      children: <TextSpan>[
                    TextSpan(
                        text: "$_weight kg",
                        style: TextStyle(
                          color: Color(0XFF403f3d),
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ))
                  ])),
              SizedBox(
                height: 25,
              ),
              Slider(
                value: _weight,
                min: 0,
                max: 150,
                onChanged: (weight) {
                  setState(() {
                    _weight = weight;
                  });
                },
                divisions: 250,
                label: "$_weight",
                activeColor: Color(0XFF403f3d),
                inactiveColor: Colors.grey,
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        maximumSize: Size(100.0, 90.0),
                        minimumSize: Size(100.0, 60.0),
                        primary: Colors.blue,
                        shape: StadiumBorder(),
                      ),
                      onPressed: () {
                        setState(() {
                          _bmi = (_weight / ((_height / 100) * (_height / 100)))
                              .round()
                              .toInt();
                          if (_bmi >= 18.5 && _bmi <= 25) {
                            _condition = "Normal";
                          } else if (_bmi > 25 && _bmi <= 30) {
                            _condition = "Overweight";
                          } else if (_bmi > 30) {
                            _condition = "Obsity";
                          } else {
                            _condition = "Underweight";
                          }
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Calculate', style: TextStyle(fontSize: 25)),
                        ],
                      )),
                ),
              )
            ]),
          )
        ]),
      ),
    );
  }
}
