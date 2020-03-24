import 'package:flutter/material.dart';

import 'package:flutter/services.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SkatePage(),
    );
  }
}

class BluePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    paint.color = Colors.blue;

    final Rect rect = Rect.fromLTWH(0,0, size.width * 0.25, size.height);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    
    return true;
  }
}

class SkatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomPaint(
        painter: BluePainter(),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: <Widget>[
              appBar(),
              content(),
              button()
            ],
          ), 
        ),
      )
    );
  }
}
        


Widget appBar() {
  return Container(
    height: 150,
    child: Row(

    ),
  );
}

Widget content(){
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(32.0),
      child: Row(
         children: <Widget>[
          Container(
            height: double.infinity,
            width: 140,
            color: Colors.red,
          )
        ],
      ),
    ),
  );
}

Widget button(){
  return Container(
    width: double.infinity,
    height: 100,
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(50),
        topLeft: Radius.circular(50),
      )
    ),
    child: FlatButton(
      onPressed: () {
        print('AGREGO AL CARRO');
      },
      child: Text('AGREGAR AL CARRO',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          letterSpacing: 10,
        ),
      ),
    ),
  );
}