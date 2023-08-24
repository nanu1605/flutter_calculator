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
        backgroundColor: Colors.red[900],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(right: 35),
              alignment: const Alignment(1.0, 1.0),
              child: Text(
                history,
                style: const TextStyle(fontSize: 24, color: Colors.black),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(25),
              alignment: const Alignment(1.0, 1.0),
              child: Text(
                texttodisplay,
                style: const TextStyle(fontSize: 48, color: Colors.black),
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
                        '7', () => buttonclick('7'), Colors.blue),
                    button.buildButton(
                        '8', () => buttonclick('8'), Colors.blue),
                    button.buildButton(
                        '9', () => buttonclick('9'), Colors.blue),
                    button.buildButton(
                        '÷', () => buttonclick('/'), Colors.amber),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    button.buildButton(
                        '4', () => buttonclick('4'), Colors.blue),
                    button.buildButton(
                        '5', () => buttonclick('5'), Colors.blue),
                    button.buildButton(
                        '6', () => buttonclick('6'), Colors.blue),
                    button.buildButton(
                        'x', () => buttonclick('*'), Colors.amber),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    button.buildButton(
                        '1', () => buttonclick('1'), Colors.blue),
                    button.buildButton(
                        '2', () => buttonclick('2'), Colors.blue),
                    button.buildButton(
                        '3', () => buttonclick('3'), Colors.blue),
                    button.buildButton(
                        '-', () => buttonclick('-'), Colors.amber),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    button.buildButton(
                        'AC', () => buttonclick('AC'), Colors.blue),
                    button.buildButton(
                        '0', () => buttonclick('0'), Colors.blue),
                    button.buildButton(
                        '=', () => buttonclick('='), Colors.blue),
                    button.buildButton(
                        '+', () => buttonclick('+'), Colors.amber),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    button.buildButton(
                        '<-', () => buttonclick('back'), Colors.blue),
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
