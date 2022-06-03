import 'package:flutter/material.dart';

// altro esempio:
// in home1 coloredbox e sizedbox si possono invertire senza problemi.
// in home il widget column non si centra automaticamente, e in certi casi diventa grande, commentate e scommentate
// le proprieta' nel codice.
// l'aslignment= center del container rimpicciolisce il discendente.
// se metto un expanded ingrandisce il figlio
// in Home2 a seconda di come inserite expanded e center i widget cambiano posizione dimesnioe allineamento

void main() {
  // debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyApp> {
  Widget esempio = const MyHomePage();
  String titolo = 'MyHomePage';

  void settaesempio(Widget esempio, String titolo) {
    setState(() {
      this.esempio = esempio;
      this.titolo = titolo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text(titolo),
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
                    settaesempio(const MyHomePage(), 'MyHomePage');
                  },
                ),
                TextButton(
                  child: Text(' 2 ', style: stile(context)),
                  onPressed: () {
                    settaesempio(const MyHomePage1(), 'MyHomePage1');
                  },
                ),
                TextButton(
                  child: Text(' 3 ', style: stile(context)),
                  onPressed: () {
                    settaesempio(const MyHomePage2(), 'MyHomePage2');
                  },
                ),
              ],
            ),
            body: esempio));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: Theme.of(context).textTheme.headline4!.fontSize! * 1.1 + 400.0,
      ),
      margin: const EdgeInsets.all(30), // del container rispetto antenato
      //      padding: EdgeInsets.all(16.0), // del figl rispetto al container se figl non setta dimensioni
      decoration: const BoxDecoration(color: Colors.yellow),
      alignment: Alignment.center, // centra figlio e lo rimpicciolisce
      child: Container(
        color: Colors.cyanAccent,
        padding: const EdgeInsets.all(10),
        child: Container(
          color: Colors.green,
          // child: SizedBox(
          //     width: 200,
          //     height: 100,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisSize: MainAxisSize.min,
            children: [
              // ingrandisce figlio al massimo
              Expanded(
                child:
                    //      Container(color: Colors.red,child:
                    Text('Hello World', style: stile(context)),
                //     )
              ),
              Text('Ciao Mondo', style: stile(context)),
            ],
          ),
        ),
        //)
      ),
    );
  }
}

class MyHomePage1 extends StatelessWidget {
  const MyHomePage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: Theme.of(context).textTheme.headline4!.fontSize! * 1.1 + 400.0,
      ),
      margin: const EdgeInsets.all(30), // del container rispetto antenato
      //      padding: EdgeInsets.all(16.0), // del figl rispetto al container se figl non setta dimensioni
      decoration: const BoxDecoration(color: Colors.yellow),
      alignment: Alignment.center, // centra figlio
      child: Container(
        color: Colors.cyanAccent,
        padding: const EdgeInsets.all(10),
        child: ColoredBox(
          color: Colors.green,
          child: SizedBox(
            width: 200,
            height: 100,
            child: Text('Hello World', style: stile(context)),
          ),

          // SizedBox(
          //      width: 200,
          //      height: 100,
          //      child:
          //        ColoredBox(
          //            color: Colors.green,
          //            child: Text('Hello World', style: stile(context)))
          //      )
        ),
      ),
    );
  }
}

class MyHomePage2 extends StatelessWidget {
  const MyHomePage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // constraints: BoxConstraints.expand(
      //   height:
      //       Theme.of(context).textTheme.headline4!.fontSize! * 1.1 + 400.0,
      // ),
      margin: const EdgeInsets.all(30),
      // del container rispetto antenato
      //      padding: EdgeInsets.all(16.0), // del figl rispetto al container se figl non setta dimensioni
      decoration: const BoxDecoration(color: Colors.yellow),
      //     alignment: Alignment.center, // centra figlio e lo rimpicciolisce
      //      child: Container(
      //          color: Colors.cyanAccent,
      //          width : double.infinity,
      //          padding: EdgeInsets.all(10),
      // child: ColoredBox(
      //     color: Colors.green,
      //  child:
      // SizedBox(
      //     width: 200,
      //     height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        // qui sotto abbiamo due etichette che cambiano la loro posizione
        // ed allineamento a seconda di Center, Expaneded, e delle AXIS property della Column che li contiene.
        children: [
          // ingrandisce figlio al massimo
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.green.shade200,
              child: Center(
                child: Text(
                  'Hello World',
                  style: stile(context),
                ),
              ),
            ),
          ),
          //     Expanded(flex: 7,child:
          Text('Ciao Mondo', style: stile(context)),
          //     )
        ],
      ),
      //),
      //  ),
      //  ),
    );
  }
}

TextStyle stile(BuildContext context) {
  return Theme.of(context)
      .textTheme
      .headline4!
      .copyWith(color: Colors.white, backgroundColor: Colors.red);
}
