import 'package:flutter/material.dart';
import 'package:flutter_1_git/stack_package/funzioni.dart';
// uso di stack_widget  in 3 varianti, che usa tre funzioni diverse per fare le tre varianti.
// usa uno statefeul widget con la setstate per settare funzioni diverse per la build
// piu' bottoni nell'appbar per scegliere l'esempio opportuno  ho provato anche versioni differenti
// creando widget stateless per le 3 varianti etc etc ma le prestazioni seconod flutter performance non cambiano

// esempio  1:
// i widget vengono dipinti e sovrapposti nell'ordine di posizione
// nella lista lo Stack avra' la dimensione in base a tutti quelli che non sono 'Positioned'
// se inserite uno Positioned esso puo' essere invisibile perche' l'area fuori dallo spazio degli altri viene automaticamente
// clippata oppure apparira' solo un pezzetto se e' disegnato sopra gli altri.
// come allargarlo?

// esempio  2:
//  metterlo dentro un container settandone la dimensione. SE NON mettete la dimensione
//     il container non ha effetto e lo Stack rimane piccolo come detto sopra

// esempio  3:
// :inserire un widget 'align' , che lo fa diventare grande quanto l' antenato,
// che puo' essere lo screen in questo esempio, il Container etc etc.
// notate che anche se l'allineamento richiesto nel nostro caso e' solo in larghezza,
// lo Stack viene comunque espanso anche in altezza



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
      home:
          const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late Function _builder = esempio1;

  void settaesempio(Function f) {
    setState(() {
      _builder = f;
    });
  }

  @override
  Widget build(BuildContext context) {

    //  serve per intercettare l'orientamento e fare eventuali modifiche
    // return OrientationBuilder(builder: (context, orientation) {
    //
    //   if (orientation == Orientation.portrait) {
    //     print("The screen is in Portrait mode");
    //   }
    //
    //   if (orientation == Orientation.landscape) {
    //     print("The screen is in Landscape mode.");
    //   }
    //
      return Scaffold(
        appBar: AppBar(
          title: const Text('Stack Widget esempi'),
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
                settaesempio(esempio1);
              },
            ),
            TextButton(
              child: Text(' 2 ', style: stile(context)),
              onPressed: () {
                settaesempio(esempio2);
              },
            ),
            TextButton(
              child: Text(' 3 ', style: stile(context)),
              onPressed: () {
                settaesempio(esempio3);
              },
            ),
          ],
        ),
        body:  _builder(),
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

