import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


// esempio di cusotm layout con un poaio di opzioni difefrenti
// a seconda di come le settate il layout cambia a volte in modo non ovvvio a prima vista
// c'e'piu' lavoro ma posso stabilire qualunque tipo di comportamento
// qui ssono mosytrati olo un paio di casi elementari

void main() {
  runApp(const MyApp());
}

// serve per accedere allo stato del widget ovunque
final keyEditableText = GlobalKey<_CustomMultiChildExampleScreenState>();

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
      home: CustomMultiChildExampleScreen(key: keyEditableText),
    );
  }
}

class CustomMultiChildExampleScreen extends StatefulWidget {
  const CustomMultiChildExampleScreen({Key? key}) : super(key: key);
  @override
  _CustomMultiChildExampleScreenState createState() =>
      _CustomMultiChildExampleScreenState();
}

class _CustomMultiChildExampleScreenState
    extends State<CustomMultiChildExampleScreen> {
  double width = 300.0;
  double height = 150.0;
  double maxHeight = 600.0;
  double maxWidth = 400.0;
  // il controller per il widget editabile 4
  final TextEditingController _controller4 =
      TextEditingController(text: 'quarto campo editabile');
  TextEditingController get controller => _controller4;
  // controller3 non deve essere nella build, altrimenti quando il widget e' fuori
  // dall'area del padre non riceve il fuoco!!!
  final TextEditingController _controller3 =
      TextEditingController(text: 'terzo campo editabile');

  // controllano quale opzione mostrare
  bool tight = false;
  bool small = false;
  bool redo = false;

  bool isRedo() {
    if (redo) {
      redo = false;
      return true;
    }
    return false;
  }

  void settaTight() {
    setState(() {
      tight = !tight;
      redo = true;
    });
  }

  void settaUno() {
    setState(() {
      small = !small;
      redo = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(),
        () => SystemChannels.textInput.invokeMethod('TextInput.hide'));

    return Scaffold(
        appBar: AppBar(
          title: Text('CustomMultiChild'),
          actions: [
            TextButton(
              child: Text(tight ? ' tight ' : 'loose', style: stile(context)),
              onPressed: () {
                settaTight();
              },
            ),
            TextButton(
              child: Text(small ? ' big ' : 'small', style: stile(context)),
              onPressed: () {
                settaUno();
              },
            ),
          ],
        ),
        body: Container(
            color: Colors.black12,
            height: double.infinity,
            width: double.infinity,
           alignment: Alignment.topCenter,
                child: Container(
              height: height,
              width: width,
              color: Colors.lightBlueAccent,
              child: CustomMultiChildLayout(
                delegate: _customMultiChildLayoutDelegate(
                    maxHeight: maxHeight, maxWidth: maxWidth),
                children: <Widget>[
                  LayoutId(
                      id: 1,
                      child: Text(
                        'abbastanza lungo',
                        style: stile(context),
                      )),
                  LayoutId(
                      id: 2,
                      child: ColoredBox(
                          color: Colors.lime,
                          child: Text(
                            'subito dopo',
                            style: stile(context),
                          ))),
                  LayoutId(
                    id: 3,
                    // aggiungo larghezza intrinseca altrimenti
                    // il testo sottostante diventa grande piu' del necessario
                    // questo si puo' recuperare nel layout, ma si complica inutilmente
                    child: IntrinsicWidth(
                      child: ColoredBox(
                        color: Colors.lightGreenAccent,
                        child: EditableText(
                          autofocus: true,
                          style: stile(context),
                          controller: _controller3,
                          focusNode: FocusNode(),
                          cursorColor: Colors.black,
                          backgroundCursorColor: Colors.yellow,
                        ),
                      ),
                    ),
                  ),
                  LayoutId(
                    id: 4,
                    // senza larghezza intrinseca
                    child: ColoredBox(
                      color: Colors.orangeAccent,
                      child: EditableText(
                        style: stile(context),
                        controller: _controller4,
                        focusNode: FocusNode(),
                        cursorColor: Colors.black,
                        backgroundCursorColor: Colors.yellow,
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}

class _customMultiChildLayoutDelegate extends MultiChildLayoutDelegate {
  final maxHeight;
  final maxWidth;
  _customMultiChildLayoutDelegate({this.maxHeight, this.maxWidth});

  bool start = true; // primo giro
  double fine3 = 0; // coordinata terminale del widget 3
  double dim3starting = 0; // dimensione widget 3 alla partenza
  // partenze dei 3 Widget, il 4 e' fisso
  double x1 = 0;
  double x2 = 0;
  double x3 = 0;

  @override
  void performLayout(Size size) {
    Size size1 = Size.zero;
    Size size2 = Size.zero;
    Size size3 = Size.zero;
    Size size4 = Size.zero;

    if (hasChild(1)) {
      size1 = layoutChild(1, BoxConstraints.loose(size));
    }
    if (hasChild(2)) {
      size2 = layoutChild(2, BoxConstraints.loose(size));
    }
    if (hasChild(3)) {
      // se mettessi tight(size), ingrandirei il Widget!!!
      // questo ha poi effetti a cascata sul posizionamento,
      if (keyEditableText.currentState!.tight)
        size3 = layoutChild(3, BoxConstraints.tight(size));
      else
        // loose lo lascia piccolo alla sua dimensione preferita
        size3 = layoutChild(3, BoxConstraints.loose(size));
    }
    if (hasChild(4)) {
      if (keyEditableText.currentState!.small) {
        size4 = layoutChild(4, BoxConstraints.loose(size));
      } else {
        // esempio di calcolo della dimensione del widget per dimensionarlo
        // in sua funzione, altrimenti di default diventa piu' grande
        // il widget 3 invece dentro un IntrinsicWidth non ha questo comportamento
        TextSpan ts = TextSpan(
            style: stile(keyEditableText.currentContext!),
            text: keyEditableText.currentState?._controller4.text);
        TextPainter tp =
            TextPainter(text: ts, textDirection: TextDirection.ltr);
        tp.layout(); // disegna il widget
        var textWidth = tp.width;
        size4 = layoutChild(
            4,
            BoxConstraints(
                minWidth: textWidth < 100 ? 100 : textWidth,
                maxWidth: textWidth < 100 ? 100 : textWidth,
                maxHeight: maxHeight));
      }
    }
    // size 1,2,3,4 ora contengono le dimensioni
    //  possiamo posizionarli come ci pare
    // il seguente codice serve solo a mostrare che, volendo,
    // si puo' posizonare in modo interdipendente i discendenti
    // a seconda della logica il codice puo' diventare complicato
    // posso  anche posizionarli sovrapposti

    // inizia la fase di posizionamento .
    // a scopo dimostrativo, ho prima calcolato tutte le dimensioni
    // utile nel caso in cui la posizione di un Widget dipens=da dagli altri fratelli
    // se non fosse cosi', si potrebbe in sequenza per ognuno
    // fare layoutchild(1), positionchild(1),fare layoutchild(2), positionchild(2)....,
    if (hasChild(3)) {
      //inizialmente messo a 4 altezze del primo dall'alto
      // centrato sulla meta' delle larghezze dei primi due
      // poi man mano che inserisco caratteri prima lo sposto a sx, quando arriva al bordo sinistro inizia
      // ad allungarsi a destra

      double dy = size3.height * 3; // potenziale errore, dy potrebbe essere troppo grande
      // e metter il widget fuori dall'antenato
      // scommentando le seguenti linee risistemo se uscisse fuori in basso
    //  if (dy > size.height) {
       // dy = size.height - size3.height;
  //    }
      if (start) {
        // ricorda posizione e dimensione iniziale del terzo widget
        x3 = (size1.width + size2.width) / 2;
        dim3starting = size3.width;
        // fine fissa
        fine3 = x3 + dim3starting;
      } else {
        x3 = fine3 - size3.width; // sposta man mano a sinistra
        if (x3 < 0) {
          // siamo al bordo sx, iniziamo a spostare la fine verso dx
          x3 = 0;
        }
      }
      // notate che small dei casi non considerati e' quando inizialmente'
      // il widget e' largo e esce a dx
      // occorrerebbe aggiungere ad esempio:
      // if (x3+size3.width > size.width)
      // x3 = size.width -size3.width;

      positionChild(3, Offset(x3, dy));
    }

    if (hasChild(1)) {
      if (start) {
        x1 = 0;
      } else {
        // sposta a dx quanto il terzo va a sx
        x1 = size3.width - dim3starting;
      }
      positionChild(1, Offset(x1, 0));
    }
    if (hasChild(2)) {
      //in basso a dx del primo
      x2 = size1.width + x1;
      double dy = size1.height;
      if (x2 + size2.width > size.width) {
        // se uscisse a dx, lo fisso nella riga dopo
        x2 = 0;
        dy *= 2;
      }
      positionChild(2, Offset(x2, dy));
    }
    if (hasChild(4)) {
      //in basso, ppoi sale verso dx ed esce dall schermo!
      double dy = size.height - size4.height - (size3.width - dim3starting);
      positionChild(4, Offset(60, dy));
    }
    start = false;
  }

  @override
  bool shouldRelayout(_customMultiChildLayoutDelegate oldDelegate) {
    return keyEditableText.currentState!.isRedo() ||
        (maxHeight != oldDelegate.maxHeight ||
            maxWidth != oldDelegate.maxWidth);
  }
}

TextStyle stile(BuildContext context) {
  return Theme.of(context)
      .textTheme
      .bodyLarge!
      // .headline6!
      .copyWith(color: Colors.black);
}
