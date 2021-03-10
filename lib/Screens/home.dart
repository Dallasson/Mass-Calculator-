import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/Constants/extras.dart';
import 'package:untitled/Widgets/left_bar.dart';
import 'package:untitled/Widgets/right_bar.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController heightController = new TextEditingController();
  TextEditingController weightController = new TextEditingController();
  double personResult = 0;
  String personObservation = "";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("BMI Calculator"),
        titleTextStyle: TextStyle(color: Colors.white,
        fontWeight: FontWeight.w300),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: new Column(
          children: [
            SizedBox(height: 20),
            Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                new Container(
                  width: 130,
                  child: TextField(
                    controller: heightController,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w300),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                        color : Colors.white
                      )
                    ),
                  ),
                ),
                new Container(
                  width: 130,
                  child: TextField(
                    controller: weightController,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w300),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight",
                        hintStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                            color : Colors.white
                        )
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            new Container(
              child : new GestureDetector(
                onTap: (){
                  double height = double.parse(heightController.text);
                  double weight = double.parse(weightController.text);

                  setState(() {
                      personResult = weight / (height * height);
                      if(personResult > 25){
                         personObservation = "You are overweight";
                      } else if(personResult >= 18.5 &&  personResult <= 25){
                         personObservation = "You are good";
                      } else {
                         personObservation = "You are under weight";
                      }
                  });

                },
                child: Text("Calculate",style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w300,
                  color: accentHexColor
              ),
              )
              ),
            ),
            SizedBox(height: 50,),
            new Container(
              child: Text(personResult.toStringAsFixed(2),style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: accentHexColor
              ),
              ),
            ),
            SizedBox(height: 70,),
            Visibility(
                child:Container(
                  child: Text(personObservation,style: TextStyle(color: Colors.deepOrange,
                      fontSize: 25),
                  ),
                )
            )
            ,
            SizedBox(height: 20,),
            LeftBar(barWidth: 30),
            SizedBox(height: 20,),
            LeftBar(barWidth: 50),
            SizedBox(height: 20,),
            LeftBar(barWidth: 30),
            SizedBox(height: 25,),
            RightBar(barWidth: 30),
            SizedBox(height: 20,),
            RightBar(barWidth: 50),
            SizedBox(height: 20,),
            RightBar(barWidth: 30)
          ],
        ),
      ),
    );
  }
}
