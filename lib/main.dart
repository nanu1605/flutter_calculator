import 'package:flutter/material.dart';
import 'package:flutter_calculator/buttons.dart';

void main() {
  runApp(const MaterialApp(
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int firstnum;
  late int secondnum;
  late String res = '';
  late String texttodisplay = '';
  late String operation = '';
  late String history = '';
  static const dullyellow = const Color(0xFF827717);

  void buttonclick(String buttonvalue){
    if(buttonvalue=='AC'){
      firstnum=0;
      secondnum=0;
      res='';
      texttodisplay='';
      history='';
    }
    else if(buttonvalue=='back'){
      res=texttodisplay.substring(0,texttodisplay.length-1);
    }
    else if(buttonvalue=='+'|| buttonvalue=='-' || buttonvalue=='*' || buttonvalue=='/'){
      firstnum=int.parse(texttodisplay);
      res='';
      operation=buttonvalue;
      // res=firstnum.toString()+operation.toString();
    }
    else if(buttonvalue=='='){
      secondnum=int.parse(texttodisplay);
      if(operation=='+'){
        res=(firstnum+secondnum).toString();
        history=firstnum.toString()+operation.toString()+secondnum.toString();
      }
      if(operation=='-'){
        res=(firstnum-secondnum).toString();
        history=firstnum.toString()+operation.toString()+secondnum.toString();
      }
      if(operation=='*'){
        res=(firstnum*secondnum).toString();
        history=firstnum.toString()+operation.toString()+secondnum.toString();
      }
      if(operation=='/'){
        res=(firstnum/secondnum).toString();
        history=firstnum.toString()+operation.toString()+secondnum.toString();
      }
    }
    else{
      res=int.parse(texttodisplay+buttonvalue).toString();
    }
    setState(() {
      texttodisplay=res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculator',
          style: TextStyle(fontFamily: 'Raleway', fontSize: 40),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(right: 35),
              alignment: const Alignment(1.0, 1.0),
              child: Text(
                history,
                style: const TextStyle(fontSize: 36, color: Colors.white),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(25),
              alignment: const Alignment(1.0, 1.0),
              child: Text(
                texttodisplay,
                style: const TextStyle(fontSize: 54, color: Colors.white),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    button.buildButton(
                        '7', () => buttonclick('7'), Colors.blueGrey),
                    button.buildButton(
                        '8', () => buttonclick('8'), Colors.blueGrey),
                    button.buildButton(
                        '9', () => buttonclick('9'), Colors.blueGrey),
                    button.buildButton(
                        '÷', () => buttonclick('/'), dullyellow),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    button.buildButton(
                        '4', () => buttonclick('4'), Colors.blueGrey),
                    button.buildButton(
                        '5', () => buttonclick('5'), Colors.blueGrey),
                    button.buildButton(
                        '6', () => buttonclick('6'), Colors.blueGrey),
                    button.buildButton(
                        'x', () => buttonclick('*'), dullyellow),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    button.buildButton(
                        '1', () => buttonclick('1'), Colors.blueGrey),
                    button.buildButton(
                        '2', () => buttonclick('2'), Colors.blueGrey),
                    button.buildButton(
                        '3', () => buttonclick('3'), Colors.blueGrey),
                    button.buildButton(
                        '-', () => buttonclick('-'), dullyellow),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    button.buildButton(
                        'C', () => buttonclick('back'), dullyellow),
                    button.buildButton(
                        '0', () => buttonclick('0'), Colors.blueGrey),
                    button.buildButton(
                        '=', () => buttonclick('='), Colors.blueGrey),
                    button.buildButton(
                        '+', () => buttonclick('+'), dullyellow),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    button.buildButton(
                        'AC', () => buttonclick('AC'), dullyellow),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
