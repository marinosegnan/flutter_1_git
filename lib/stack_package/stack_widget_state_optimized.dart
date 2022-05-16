import 'package:flutter/material.dart';
import 'package:flutter_1_git/stack_package/stacks.dart';

// milgior performance di stack_widget_state:
// seguendo le raccomandazioni, ho creato 3 classi Widget con le varianti
// di stack (nel file stack.dart
// e nella build dello StateFul ho messo la creazione diretta dei Widget anziche'
// la funzione intermedia, e i tempi migliorano, stilisticamente preferivo l'altra solzuoine
// Tuto cio' capita perche' in Dart non posso settare una variabile di tipo class!!!
// i dati sono nei file di risorse sotto la cartella android/res/ ovviamente i tempi sono variabili

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int b = 0;
  void aggiorna(int a) {
    setState(() {
      b = a;
    }); // oppure creare gia' qui il Widget???
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack Widget esempi'),
        actions: [
          // IconButton(
          //   icon: const Icon(Icons.shopping_cart),
          //   tooltip: 'Open shopping cart',
          //   onPressed: () {
          //     // handle the press
          //   },
          // ),
          TextButton(
            child: Text(' 1 ', style: stile(context)),
            onPressed: () {
              aggiorna(0);
            },
          ),
          TextButton(
            child: Text(' 2 ', style: stile(context)),
            onPressed: () {
              aggiorna(1);
            },
          ),
          TextButton(
            child: Text(' 3 ', style: stile(context)),
            onPressed: () {
              aggiorna(2);
            },
          ),
        ],
      ),
      body: b == 0
          ? const W1()
          : b == 1
              ? const W2()
              : const W3(),
    );

    // });
  }

  TextStyle stile(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .headline4!
        .copyWith(color: Colors.white, backgroundColor: Colors.red);
  }
}
