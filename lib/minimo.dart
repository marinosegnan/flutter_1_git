import 'package:flutter/material.dart';


// questo Widget e' stateless, non ha variabili che cambiano
// ogni volta che lo costruiamo sara' identico alla precedente
// e' un esempio minimale , se si commentano alcuni widget si perdono delle proprieta' fondamentali

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:  Scaffold(
            appBar: AppBar(
              title: Text('titolo'),
            ),
            body:
      //      Center(child:
           Text(
              'You have pushed the button this many times:',
            )));
  }

  // la versione commentata qui sotto mostra qualcosa su schermo
  // ma come si vede eseguendola manca di alcune proprieta' ncessarie

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //       home: Text(
  //     'You have pushed the button this many times:',
  //   ));
  // }
}
