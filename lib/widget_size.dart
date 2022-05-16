import 'package:flutter/material.dart';

// da SO,  come recupeare dimensioni di un Widget ed orientamento dell schermo
// postframecallback per capire se e' cambiata la geometria
// dello schermo, cioe' ad esempio da portrait a landscape

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
      home: TestPage(),
    );
  }
}

class TestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new TestPageState();
}

class TestPageState extends State<TestPage> with WidgetsBindingObserver {
  Orientation? _currentOrientation;  // Es 2
  final key = new GlobalKey<TestWidgetState>(); // Es 1

  @override
  initState() {
    //calling the getHeight Function after the Layout is Rendered
    WidgetsBinding.instance.addPostFrameCallback((_) => getHeight()); // Es 1
    super.initState();
    WidgetsBinding.instance.addObserver(this); // Es 2
  }
  @override
  void didChangeMetrics() { // Es 2
    _currentOrientation = MediaQuery.of(context).orientation;
    print('Before Orientation Change: $_currentOrientation');
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _currentOrientation = MediaQuery.of(context).orientation;
      });
      print('After Orientation Change: $_currentOrientation');
    });
  }
  void getHeight() { // Es 1
    //returns null:
    final TestWidgetState? state = key.currentState;
    //returns null:
    final BuildContext? context = key.currentContext;

    //Error: The getter 'context' was called on null.
    final RenderBox? box = state?.context.findRenderObject() as RenderBox;

    if (box != null) {
      print('height = ${box.size.height}');
      print('width= ${box.size.width}');
    } else {
      print('box == NULL');
    }
    if (context != null) {
      print('height = ${context.size?.height}');
      print('width= ${context.size?.width}');
    } else {
      print('context == NULL');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new TestWidget(key: key),
    );
  }
}

class TestWidget extends StatefulWidget {
  TestWidget({required Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new TestWidgetState();
}

class TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Text(
        "Test",
        style: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
