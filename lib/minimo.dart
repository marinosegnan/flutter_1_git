import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// questo Widget e' stateless,
// non ha variabili che cambiano
// ogni volta che lo costruiamo
// sara' identico alla precedente

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('titolo'),
            ),
            body: Text(
              'You have pushed the button this many times:',
            )));
  }

  // la versione commentata qui sotto mostra qualcosa su schermo
  // ma come si vede manca di alcune proprieta' ncessarie

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //       home: Text(
  //     'You have pushed the button this many times:',
  //   ));
  // }
}
