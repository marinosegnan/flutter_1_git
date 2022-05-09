import 'package:flutter/material.dart';

// altro esempio:
// in home1 coloredbox e sizedbox si possono invertire senza problemi.
// in home il widget column non si centra automaticamente, e in certi casi diventa grande, commentate e scommentate
// le proprieta' nel codice.
// l'aslignment= center del container rimpicciolisce il discendente.

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
          constraints: BoxConstraints.expand(
            height:
                Theme.of(context).textTheme.headline4!.fontSize! * 1.1 + 400.0,
          ),
          margin: EdgeInsets.all(30), // del container rispetto antenato
          //      padding: EdgeInsets.all(16.0), // del figl rispetto al container se figl non setta dimensioni
          decoration: BoxDecoration(color: Colors.yellow),
          alignment: Alignment.center, // centra figlio e lo rimpicciolisce
          child: Container(
              color: Colors.cyanAccent,
              padding: EdgeInsets.all(10),
              child: ColoredBox(
                  color: Colors.green,
                  child: SizedBox(
                      width: 200,
                      height: 100,
                      child: Column(
                          //  mainAxisAlignment: MainAxisAlignment.center,
                          //    mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Hello World', style: stile(context))
                          ]))))),
    );
  }

  TextStyle stile(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .headline4!
        .copyWith(color: Colors.white, backgroundColor: Colors.red);
  }
}

class MyHomePage1 extends StatelessWidget {
  const MyHomePage1({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
          constraints: BoxConstraints.expand(
            height:
                Theme.of(context).textTheme.headline4!.fontSize! * 1.1 + 400.0,
          ),
          margin: EdgeInsets.all(30), // del container rispetto antenato
          //      padding: EdgeInsets.all(16.0), // del figl rispetto al container se figl non setta dimensioni
          decoration: BoxDecoration(color: Colors.yellow),
          alignment: Alignment.center, // centra figlio
          child: Container(
              color: Colors.cyanAccent,
              padding: EdgeInsets.all(10),
              child: ColoredBox(
                  color: Colors.green,
                  child: SizedBox(
                      width: 200,
                      height: 100,
                      child: Text('Hello World', style: stile(context)))

                  // SizedBox(
                  //      width: 200,
                  //      height: 100,
                  //      child:
                  //        ColoredBox(
                  //            color: Colors.green,
                  //            child: Text('Hello World', style: stile(context)))
                  //      )
                  ))),
    );
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
