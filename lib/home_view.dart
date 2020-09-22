/*
  Home View 
*/
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  final age = TextEditingController();
  String message = "";
  int flag = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (flag == 0)
                      ? Colors.red
                      : Colors.green, // Logic to change color here
                ),
              ),
              Container(
                padding: EdgeInsets.all(35),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  /*inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],*/
                  controller: age,
                  decoration: InputDecoration(
                    hintText: "Enter your age",
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                child: FlatButton(
                  child: Text("Check"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    if (int.parse(age.text) >= 18) {
                      setState(() {
                        message = "Eligible";
                        flag = 1;
                      });
                    } else {
                      setState(() {
                        message = "Not Eligible";
                        flag = 0;
                      });
                    }
                  },
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "$message",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
