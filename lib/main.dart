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

/*Clase que dibuja las puntas en sigzag en la etiqueta de precio*/
class DieCuttingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    paint.color = Colors.white;
    paint.strokeWidth = 20;
    paint.style = PaintingStyle.fill;
    
    var x = size.height/6;

    var path = Path();
    path.relativeLineTo(0, -2*x);

    for (var i = 0; i < 5; i++) {
      path.relativeLineTo(x, x);
      path.relativeLineTo(-x, x);
    }

    path.close();
    canvas.drawPath(path, paint);
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
              appBar(context),
              content(context),
              button()
            ],
          ), 
        ),
      )
    );
  }
}

//WIDGETS que serán definidos y serán usados en el SkatePage
Widget appBar(BuildContext context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      MaterialButton(
        onPressed: (){
        },
        child: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 40.0,
        ),
      ),
      SizedBox(width: 48,),
      Flexible(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SizedBox(height: 8,),
            Text(
              "SLIME MONSTER",
              style: Theme.of(context).textTheme.title.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                letterSpacing: 14,
              ),
            ),
          ],
        )
      ),
    ],
  );
}

Widget content(BuildContext context){
  return Expanded(
    child: Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 32.0, top: 32.0, bottom: 32.0 ),
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
                    Padding(
                      padding: const EdgeInsets.only(right: 60.0),
                      child: Text('Handmade skateboard desk with original painting from México', 
                        style: Theme.of(context).textTheme.title.copyWith(
                          fontSize: 22.0,)),
                    ),
                    Expanded(
                      child: Container()),
                    Divider(),
                    Expanded(
                      child: Container()),
                    Text('S I Z E', 
                      style: Theme.of(context).textTheme.caption.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),),
                    SizedBox(height: 10.0,),
                    Text('8"X32"',
                      style: Theme.of(context).textTheme.title.copyWith(
                        fontSize: 22.0
                      ),),
                    Expanded(
                      child: Container()),
                    Text('M A T E R I A L',
                      style: Theme.of(context).textTheme.caption.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),),
                    SizedBox(height: 10.0,),
                    Text('Canadian Maple',
                      style: Theme.of(context).textTheme.title.copyWith(
                        fontSize: 22.0
                      ),),
                    Expanded(
                      flex: 3,
                      child: Container()),
                    Container(
                      width: double.infinity,
                      height: 48,
                      color: Color(0xFFF1C929) ,
                      alignment: Alignment.centerLeft,
                      child: CustomPaint(
                        painter: DieCuttingPainter(),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child:Text('\$240',
                            style: Theme.of(context).textTheme.headline.copyWith(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 10
                            ),
                          ),
                        ),
                      ), 
                    ),
                  ],
                ),
              ) 
            )
          ],
        ),
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
        print('HIZO CLICK!!');
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