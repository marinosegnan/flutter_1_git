import 'package:flutter/material.dart';

class W1 extends StatelessWidget {
  const W1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: 150,
        height: 150,
        color: Colors.amberAccent,
      ),
      Container(
        width: 100,
        height: 100,
        color: Colors.redAccent,
      ),
      Positioned(
        top: 100,
        left: 50,
        child: Container(
          width: 200,
          height: 200,
          color: Colors.purpleAccent,
        ),
      ),
    ]);
  }
}

class W2 extends StatelessWidget {

  const W2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      //se metto un container sopra lo stack
        color: Colors.green,
        width: 350, // se non metto dimensioni diventa di nuovo piccolo!!!
        height: 350,
        child: Stack(
          children: [
            Positioned(
              top: 100,
              left: 100,
              // Align(
              //   alignment: AlignmentDirectional.topEnd,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.purpleAccent,
              ),
            ),
            Container(
              width: 150,
              height: 150,
              color: Colors.amberAccent,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.redAccent,
            ),
          ],
        ));
  }
}

class W3 extends StatelessWidget {
  const W3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: AlignmentDirectional.topEnd,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.cyanAccent,
          ),
        ),
        Positioned(
          top: 100,
          left: 100,
          child: Container(
            width: 200,
            height: 200,
            color: Colors.deepPurpleAccent,
          ),
        ),
        Container(
          width: 150,
          height: 150,
          color: Colors.amberAccent,
        ),
        Container(
          width: 100,
          height: 100,
          color: Colors.redAccent,
        ),
      ],
    );
  }
}