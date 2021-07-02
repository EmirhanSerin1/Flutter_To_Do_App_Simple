import 'package:flutter/material.dart';
import 'package:flutter_to_do_app_simple/model/model_list.dart';
import 'package:provider/provider.dart';
import 'views/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo Demo',
      theme: ThemeData(primaryColor: Colors.white),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(child: Text("What Should I Do Today")),
        backgroundColor: Colors.blueGrey.withOpacity(0.7),
      ),
      body: Provider(
        create: (_) => ModelList(),
        child: MainPage(),
      ),
    );
  }
}
