import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Switch',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'Smart Switch'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;


  final List<Map<String, dynamic>> _items = [
    {
      'id': 0,
      'name': 'Lamp 1',
      'isOn': false,
      'icon': Icons.lightbulb_outlined,
    },
    {
      'id': 1,
      'name': 'Aircond',
      'isOn': false,
      'icon': Icons.ac_unit,
    },
    {
      'id': 2,
      'name': 'Window',
      'isOn': false,
      'icon': Icons.window_outlined,
    },
    {
      'id': 3,
      'name': 'Lamp 2',
      'isOn': false,
      'icon': Icons.lightbulb_outlined,
    },
    {
      'id': 4,
      'name': 'TV',
      'isOn': false,
      'icon': Icons.tv_outlined,
    },
  ];

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _tapContainer(int index){
    setState(() {
      _items[index]['isOn'] = !_items[index]['isOn'];
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: GridView.builder(
          primary: false,
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
          itemCount: _items.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => _tapContainer(index),
              child: Container(
                padding: const EdgeInsets.all(8),
                color: _items[index]['isOn'] ? Colors.green : Colors.transparent,
                child: Column(
                  children: <Widget>[
                    Text(_items[index]['name']),
                    Icon(_items[index]['icon'], color: _items[index]['isOn'] ? Colors.yellow : Colors.grey, size: 50.0),
                    Text(_items[index]['isOn'] ? "On" : "Off"),
                  ],
                ),
              ),
            );
          },
            
            // GestureDetector(
            //   onTap: () => _tapContainer(1),
            //   child: Container(
            //     padding: const EdgeInsets.all(8),
            //     child: Column(
            //       children: <Widget>[
            //         Text("John Room"),
            //         Icon(Icons.lightbulb_outlined, size: 75.0),
            //         Text(isOn[1] ? "On" : "Off"),
            //       ],
            //     ),
            //     color: isOn[1] ? Colors.yellow : Colors.transparent,
            //   ),
            // ),
            // GestureDetector(
            //   onTap: () => _tapContainer(2),
            //   child: Container(
            //     padding: const EdgeInsets.all(8),
            //     child: Column(
            //       children: <Widget>[
            //         Text("Salleh Room"),
            //         Icon(Icons.lightbulb_outlined, size: 75.0),
            //         Text(isOn[2] ? "On" : "Off"),
            //       ],
            //     ),
            //     color: isOn[2] ? Colors.yellow : Colors.transparent,
            //   ),
            // ),
            // GestureDetector(
            //   onTap: () => _tapContainer(3),
            //   child: Container(
            //     padding: const EdgeInsets.all(8),
            //     child: Column(
            //       children: <Widget>[
            //         Icon(Icons.lightbulb_outlined),
            //         Text(isOn[3] ? "On" : "Off"),
            //       ],
            //     ),
            //     color: isOn[3] ? Colors.yellow : Colors.transparent,
            //   ),
            // ),
            // GestureDetector(
            //   onTap: () => _tapContainer(4),
            //   child: Container(
            //     padding: const EdgeInsets.all(8),
            //     child: Column(
            //       children: <Widget>[
            //         Icon(Icons.lightbulb_outlined),
            //         Text(isOn[4] ? "On" : "Off"),
            //       ],
            //     ),
            //     color: isOn[4] ? Colors.yellow : Colors.transparent,
            //   ),
            // ),
        )
        ),
      );
  }
}
