import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  AppLifecycleState _appLifecycleState;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

/////    save data of states in this method /////////////
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _appLifecycleState=state;
      print("My App State $_appLifecycleState");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: new Scaffold(
      body: OrientationBuilder(
        builder: (context,orientation){
          return new Center(
          child: new Text(
            _appLifecycleState.toString(),
            //////---- Different Color Different Orientaion ---------////////////////////
            style: new TextStyle(fontSize: 20,color: orientation==Orientation.portrait?Colors.blue:Colors.red),
          ),
        );
        },
      ),
    ));
  }
}
