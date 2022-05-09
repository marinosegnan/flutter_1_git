import 'package:flutter/material.dart';
import 'package:flutter_1_git/stack_package/funzioni.dart';
// refactoring di s stack_widget_state che divide in stateful top che governa il discendente.
// per accedere allo stato del dipendente si usa una global key per reperirlo in futuro
// la costruzione delle varianti avviene tramite funzione (pratica sconsigliata!!!
// ho anche provato a creare 3 classi di Widget ma le prestazioni non cambiavano sostanzialmente

final GlobalKey<_MyHomePageState> chiaveDelDiscendente = GlobalKey();

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
      home: MyApp1(),
    );
  }
}

class MyApp1 extends StatelessWidget {
  const MyApp1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //  title: Text('Stack Widget'),
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
                chiaveDelDiscendente.currentState?.aggiorna(0);
              },
            ),
            TextButton(
              child: Text(' 2 ', style: stile(context)),
              onPressed: () {
                chiaveDelDiscendente.currentState?.aggiorna(1);
              },
            ),
            TextButton(
              child: Text(' 3 ', style: stile(context)),
              onPressed: () {
                chiaveDelDiscendente.currentState?.aggiorna(2);
              },
            ),
          ],
        ),
        body: MyHomePage(key: chiaveDelDiscendente));
  }

  TextStyle stile(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .headline4!
        .copyWith(color: Colors.white, backgroundColor: Colors.red);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var varianti = [esempio1,esempio2,esempio3];
  late Function _builder = esempio1;

  void aggiorna(int index) {
    setState(() {
        _builder = varianti[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return _builder();
  }

}
