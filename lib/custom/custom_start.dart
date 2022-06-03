import 'package:flutter/material.dart';

// esempio di layout custom. copiato da Web

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
      home:  CustomMultiChildExampleScreen(),
    );
  }
}
class CustomMultiChildExampleScreen extends StatefulWidget {
  @override
  _CustomMultiChildExampleScreenState createState() => _CustomMultiChildExampleScreenState();
}

class _CustomMultiChildExampleScreenState extends State<CustomMultiChildExampleScreen> {
  double width = 300.0;
  double height = 150.0;
  double maxHeight = 50.0;
  double maxWidth = 50.0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('CustomMultiChild example'),
      ),
      body: Center(
        child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              height: height,
              width: width,
              color: Colors.lightBlueAccent,
              child: CustomMultiChildLayout(
                delegate: _customMultiChildLayoutDelegate(maxHeight: maxHeight, maxWidth: maxWidth),
                children: <Widget>[
                  LayoutId(
                    id: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.purpleAccent
                      ),
                      child: Center(child: Text('1')),
                      height: 75.0,
                      width: 75.0,
                    ),
                  ),
                  LayoutId(
                    id: 2,
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.purpleAccent
                      ),
                      child: Center(child: Text('2')),
                      height: 75.0,
                      width: 75.0,
                    ),
                  ),
                  LayoutId(
                    id: 3,
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.purpleAccent
                      ),
                      child: Center(child: Text('3')),
                      height: 75.0,
                      width: 75.0,
                    ),
                  ),
                  LayoutId(
                    id: 4,
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.purpleAccent
                      ),
                      child: Center(child: Text('4')),
                      height: 75.0,
                      width: 75.0,
                    ),
                  ),
                  LayoutId(
                    id: 5,
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.purpleAccent
                      ),
                      child: Center(child: Text('5')),
                      height: 75.0,
                      width: 75.0,
                    ),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}

class _customMultiChildLayoutDelegate extends MultiChildLayoutDelegate {

  final maxHeight;
  final maxWidth;
  _customMultiChildLayoutDelegate({this.maxHeight, this.maxWidth});

  @override
  void performLayout(Size size) {
    if (hasChild(1)) {
      layoutChild(1, BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight));
      // Center of the box
      double dx = ((size.width / 2) - (maxWidth / 2));
      double dy = ((size.height / 2) - (maxHeight / 2));
      positionChild(1, Offset(dx, dy));
    }
    if (hasChild(2)) {
      layoutChild(2, BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight));
      //Top left of the box
      double dx = -(maxWidth/2);
      double dy = -((maxHeight / 2));
      positionChild(2, Offset(dx, dy));
    }
    if (hasChild(3)) {
      layoutChild(3, BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight));
      // Top right of the box
      double dx = ((size.width) - (maxWidth/2));
      double dy = -((maxHeight / 2));
      positionChild(3, Offset(dx, dy));
    }
    if (hasChild(4)) {
      layoutChild(4, BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight));
      // bottom right of the box
      double dx = ((size.width) - (maxWidth/2));
      double dy = ((maxHeight * 2) + (maxHeight / 2));
      positionChild(4, Offset(dx, dy));
    }
    if (hasChild(5)) {
      layoutChild(5, BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight));
      //bottom left of the box
      double dx = -(maxWidth/2);
      double dy = ((maxHeight * 2) + (maxHeight / 2));
      positionChild(5, Offset(dx, dy));
    }
  }

  @override
  bool shouldRelayout(_customMultiChildLayoutDelegate oldDelegate) {
    return (maxHeight != oldDelegate.maxHeight || maxWidth != oldDelegate.maxWidth);
  }

}
