import 'package:flutter/material.dart';
import 'firstPage.dart' as first;
import 'secondPage.dart' as second;
import 'thirdPage.dart' as third;
void main(){
  runApp(new MaterialApp(
    home:new MyTabs()
  ));
}
class MyTabs extends StatefulWidget{
 MyTabsState createState() => new MyTabsState();
}
class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {

  TabController controller;
  @override
  void initState(){
    super.initState();
    controller =  new TabController(vsync: this,length: 3);
  }
  @override
  @override
    void dispose() {
      controller.dispose();
      super.dispose();
    }

 @override
 Widget build(BuildContext context){
   return new Scaffold(
     appBar: new AppBar(title: new Text("MyTabs"),backgroundColor: Colors.teal,
     bottom: new TabBar(
       controller: controller,
       tabs: <Tab>[
         new Tab(
           icon: new Icon(Icons.arrow_left),
         ),
         new Tab(
           icon: new Icon(Icons.arrow_downward),
         ),
         new Tab(
           icon: new Icon(Icons.arrow_right),
         )
       ]
     )),
     bottomNavigationBar: new Material(
       color: Colors.teal,
       child : new TabBar(
         controller: controller,
       tabs: <Tab>[
         new Tab(
           icon: new Icon(Icons.arrow_left),
         ),
         new Tab(
           icon: new Icon(Icons.arrow_downward),
         ),
         new Tab(
           icon: new Icon(Icons.arrow_right),
         )
       ]
       )
     ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new first.First(),
          new second.Second(),
          new third.Third()
        ],
      ),
      
   );
 }
}