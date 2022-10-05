import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var disp = "";

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
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.84,
                height: MediaQuery.of(context).size.width * 0.2,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(.2),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Text(disp,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  btn("7"),
                  SizedBox(
                    width: 5,
                  ),
                  btn("8"),
                  SizedBox(
                    width: 5,
                  ),
                  btn("9"),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.width * 0.2,
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
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  btn("4"),
                  SizedBox(
                    width: 5,
                  ),
                  btn("5"),
                  SizedBox(
                    width: 5,
                  ),
                  btn("6"),
                  SizedBox(
                    width: 5,
                  ),
                  btn("/"),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  btn("1"),
                  SizedBox(
                    width: 5,
                  ),
                  btn("2"),
                  SizedBox(
                    width: 5,
                  ),
                  btn("3"),
                  SizedBox(
                    width: 5,
                  ),
                  btn("*"),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  btn("0"),
                  SizedBox(
                    width: 5,
                  ),
                  btn("."),
                  SizedBox(
                    width: 5,
                  ),
                  btn("+"),
                  SizedBox(
                    width: 5,
                  ),
                  btn("-"),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.width * 0.2,
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
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.width * 0.2,
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
        ),
      ),
    );
  }

  Widget btn(var text) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.width * 0.2,
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
}

