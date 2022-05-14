import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var disp = "";

  Widget btn(var text) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.18,
      height: MediaQuery.of(context).size.height * 0.1,
      child: ElevatedButton(
        style: ButtonStyle(
            // backgroundColor:MaterialStateProperty.all(Colors.red)),

            ),
        onPressed: () {
          setState(() {
            disp += text;
          });
        },
        child: Text(text,
            style: TextStyle(
              fontSize: 20,
            )),
      ),
    );
  }

  clear() {
    setState(() {
      disp = "";
    });
  }

  output() {
    Parser p = Parser();
    Expression exp = p.parse(disp);
    ContextModel cm = ContextModel();
    double ans = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      // if(ans.isFinite){
      disp = ans.toString();
      // }
      // else{
      // disp = "Error Nan";   
      // }
    });
  }

  removeLast() {
    setState(() {
      var len = disp.length;
      if (len > 0) {
        disp = disp.substring(0, len - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Calculator App",
                style: TextStyle(
                  color: Colors.white,
                )),
            Icon(Icons.history),
          ],
        )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(disp,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              btn("7"),
              btn("8"),
              btn("9"),
              Container(
                width: MediaQuery.of(context).size.width * 0.18,
                height: MediaQuery.of(context).size.height * 0.1,
                child: ElevatedButton(
                    style: ButtonStyle(
                        // backgroundColor:MaterialStateProperty.all(Colors.red)),

                        ),
                    onPressed: removeLast,
                    child: Icon(
                      Icons.backspace,
                      size: 25,
                    )),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              btn("4"),
              btn("5"),
              btn("6"),
              btn("/"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              btn("1"),
              btn("2"),
              btn("3"),
              btn("*"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              btn("0"),
              btn("."),
              btn("+"),
              btn("-"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.68,
                height: MediaQuery.of(context).size.height * 0.1,
                child: ElevatedButton(
                  style: ButtonStyle(
                      // backgroundColor:MaterialStateProperty.all(Colors.red)),

                      ),
                  onPressed: clear,
                  child: Text("clear",
                      style: TextStyle(
                        fontSize: 20,
                      )),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.18,
                height: MediaQuery.of(context).size.height * 0.1,
                child: ElevatedButton(
                  style: ButtonStyle(
                      // backgroundColor:MaterialStateProperty.all(Colors.red)),

                      ),
                  onPressed: output,
                  child: Text("=",
                      style: TextStyle(
                        fontSize: 20,
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
