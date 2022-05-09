import 'package:flutter/material.dart';

// un insieme di esempi di proprieta', il padding e' riferito al figlio,
// il margin riferito all'antenato, i constraints danno una dimensione al container
//   DecoratedBox colora lo sfondo, come ColoredBox,
// il Container puo' ruotare il suo contenuto

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container( child:
          Column(children: [
            ColoredBox(child:
              Center( child:
                DecoratedBox(child:
                  Text('Hello World',),
                  decoration: const BoxDecoration(color: Colors.red),)),
              color: Colors.yellow,),
            Container( child: // per ruotare il contenuto
              ColoredBox(child:
                SizedBox( child:
                  Text('Hello World', style: stile(context)),
                  width: 200,),
                color: Colors.cyanAccent,),
              transform: Matrix4.rotationZ(0.1),
            )
          ]),
          color: Colors .purple, // oppure:  decoration: BoxDecoration(color: Colors.yellow),
          constraints: BoxConstraints.expand(  // dimensione
            height: Theme.of(context).textTheme.headline4!.fontSize! * 1.1 + 100.0,
          ),
          margin: EdgeInsets.all(50), // del container rispetto antenato
          padding:
              const EdgeInsets.all(16.0), // del figlio rispetto al container
          //    decoration: BoxDecoration(color: Colors.yellow),
          alignment: Alignment.center,
        ));
  }

  TextStyle stile(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .headline4!
        .copyWith(color: Colors.white, backgroundColor: Colors.red);
  }
}

void main() {
  // debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Padding, Center, Decoration ...'),
    );
  }
}
