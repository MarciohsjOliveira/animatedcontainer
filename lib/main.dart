import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Animated Container',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _rng = Random();
  double _height = 400;
  double _width = 4200;
  double _borderRadius = 50;
  Color _color = Colors.blue;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: BorderRadius.circular(this._borderRadius),
          ),
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          child: Image.asset('images/ferrari.png'),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: RaisedButton.icon(
              icon: const Icon(Icons.update),
              label: const Text('Toque para mudar a animação'),
              onPressed: () => setState(() {
                    _width = _rng.nextInt(100).toDouble() + 200;
                    _height = _rng.nextInt(100).toDouble() + 300;
                    _borderRadius = _rng.nextInt(50).toDouble();
                    _color = Color.fromRGBO(_rng.nextInt(256),
                        _rng.nextInt(256), _rng.nextInt(256), 1);
                  })),
        ),
      ]),
    );
  }
}
