import 'package:flutter/material.dart';

void main(){
  runApp(
    new MaterialApp(
      home: new AwesomeButton()
  ));
}
class AwesomeButton extends StatefulWidget{
   @override
   AwesomeButtonState createState() => new AwesomeButtonState();
}
class AwesomeButtonState extends State<AwesomeButton>{
  int counter = 0;
  List<String> phrase = ["Flutter","Is","Awesome!"];
  String displayword = "Let me tell you something"; 
  void onPressed()
  {
    setState(() {
            displayword = phrase[counter];
            counter = counter < 2 ? counter +1 : 0;
        });
  }
  @override
  Widget build (BuildContext context){
      return new Scaffold(
        appBar: new AppBar(title: new Text("StatefulWidget"),backgroundColor: Colors.deepPurple),
        body: new Container(
          child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(displayword, style: new TextStyle(fontSize: 20.0)),
                new Padding(padding: new EdgeInsets.all(10.0),),
                new RaisedButton(
                  child: new Text("Press me!", style: new TextStyle(color: Colors.white,fontSize: 20.0)),
                  color: Colors.deepPurple,
                  onPressed: onPressed
                )
              ],
            ),
          ),
        ),
      );
  }
}