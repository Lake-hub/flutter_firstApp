import 'package:flutter/material.dart';

import 'package:flutter/services.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SkatePage(),
    );
  }
}

/*Clase que dibuja atrás la franja azul para el SkatePage
Esta clase extiende la clase Custompainter para usar el painter(atrás) y child(adelante)*/
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

/*Clase principal que dibuja la pantalla y contiene a los widget*/
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

//WIDGETS que serán definidos y serán usados en el SkatePage
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
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/board1.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 38.0, top: 32.0, bottom: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('descripción de la tabla bla bla bla'),
                  Divider(),
                  Text('SIZE'),
                  Text('8X32'),
                  Text('MATERIAL'),
                  Text('Canadian Maple'),
                  Text('\$240'),
                ],
              ),
            ) 
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
        print('AGREGÓ AL CARRO');
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