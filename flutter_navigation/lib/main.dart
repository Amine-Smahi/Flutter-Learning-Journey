import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    home : new HomePage(),
    routes: <String, WidgetBuilder>{
      "/SecondPage" : (BuildContext context) => new SecondPage()
    }
  ));
} 
class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
        appBar: new AppBar(title: new Text("Home Page"),backgroundColor: Colors.redAccent),
        body: new Container(
          child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new IconButton(
                  icon : new Icon(Icons.star,color: Colors.redAccent),
                  iconSize: 70.0,
                  onPressed: (){
                    Navigator.of(context).pushNamed("/SecondPage");
                  },
                ),
                new Text("Home", style: new TextStyle(fontSize: 25.0))
              ],
            ),
          ),
        ),
    );
  }
}
class SecondPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
        appBar: new AppBar(title: new Text("Second Page"),backgroundColor: Colors.blue),
        body: new Container(
          child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new IconButton(
                  icon : new Icon(Icons.star,color: Colors.blue),
                  iconSize: 70.0,
                  onPressed: null,
                ),
                new Text("Second", style: new TextStyle(fontSize: 25.0))
              ],
            ),
          ),
        ),
    );
  }
}