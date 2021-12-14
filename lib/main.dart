import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String showText = '0';
  String? btnText;
  Color? btnColor;
  Color? txtColor;

  // Holders
  int num1 = 0;
  int num2 = 0;
  String? op;
  String cache = '';
  String result = '';

  void calc(String btnText) {
    // AC
    if (btnText == 'AC') {
      setState(() {
        result = '0';
        num1 = 0;
        num2 = 0;
        op = '';
        cache = '';
      });
    } // +/-
    else if (btnText == '+/-') {
      if (result != '0') {
        int n = int.parse(showText) * -1;
        setState(() {
          result = (n).toString();
        });
      } else {
        setState(() {
          result = 'error';
        });
      }
    } // %
    else if (btnText == '%') {
      num1 = int.parse(showText);
      double n = (num1 / 100);
      result = n.toStringAsFixed(0);
      setState(() {
        showText = result;
        cache = '$num1 %';
      });
    } // ÷
    else if (btnText == '÷') {
      num1 = int.parse(showText);
      op = btnText;
      setState(() {
        result = '';
      });
    } // X
    else if (btnText == 'X') {
      num1 = int.parse(showText);
      op = btnText;
      setState(() {
        result = '';
      });
    } // -
    else if (btnText == '-') {
      num1 = int.parse(showText);
      op = btnText;
      print('- Tıklandı');
      setState(() {
        result = '';
      });
    } // +
    else if (btnText == '+') {
      // add Number 1 and add op later clear result
      num1 = int.parse(showText);
      op = btnText;
      setState(() {
        result = '';
      });
    } // =
    else if (btnText == '=') {
      // +
      if (op == '+') {
        num2 = int.parse(showText);
        result = (num1 + num2).toString();
        print(result);
        setState(() {
          cache = '$num1 $op $num2';
        });
      } // -
      else if (op == '-') {
        num2 = int.parse(showText);
        result = (num1 - num2).toString();
        setState(() {
          cache = '$num1 $op $num2';
        });
      } // ÷
      else if (op == '÷') {
        num2 = int.parse(showText);
        result = (num1 / num2).toString();
        setState(() {
          showText = result;
          cache = '$num1 $op $num2';
        });
      } // X
      else if (op == 'X') {
        num2 = int.parse(showText);
        result = (num1 * num2).toString();
        setState(() {
          showText = result;
          cache = '$num1 $op $num2';
        });
      }
      setState(() {
        showText = result;
      });
    } else {
      print('Showtext : $showText + $result');
      // this code not working
      if (result == ('error') || showText == 'error') {
        result = '';
        setState(() {
          result = int.parse(showText + btnText).toString();
        });
      } else {
        setState(() {
          result = int.parse(showText + btnText).toString();
        });
      }
    }
    showText = result;
  }

  Widget calcButton(btnText, btnColor, txtColor) {
    return Container(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            primary: btnColor,
            onPrimary: Colors.white,
          ),
          onPressed: () => calc(btnText),
          child: Text(
            btnText,
            style: TextStyle(color: txtColor, fontSize: 21),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    final double screenWidht = screenInfo.size.width;
    final double screenHeight = screenInfo.size.width;

    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Text(
                  '$cache',
                  style: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
              ),
              Text(
                '$showText',
                style: TextStyle(fontSize: 80, color: Colors.white),
              ),
              // Row 1
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // AC Button
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: calcButton('AC', Colors.grey, Colors.black),
                    ),
                    // +/- Button
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: calcButton('+/-', Colors.grey, Colors.black),
                    ),
                    // % Button
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: calcButton('%', Colors.grey, Colors.black),
                    ),
                    //  ÷ Button
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: calcButton('÷', Colors.amber, Colors.white),
                    ),
                  ],
                ),
              ),
              //* Row 2 - 7,8,9,X
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // 7 Button
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: calcButton('7', Colors.grey, Colors.black),
                    ),
                    //  8 Button
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: calcButton('8', Colors.grey, Colors.black),
                    ),
                    //  9 Button
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: calcButton('9', Colors.grey, Colors.black),
                    ),
                    //  X Button
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: calcButton('X', Colors.amber, Colors.white),
                    ),
                  ],
                ),
              ),
              // Row 3 - 4,5,6,-
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // 4 Button
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: calcButton('4', Colors.grey, Colors.black),
                    ),
                    //  5 Button
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: calcButton('5', Colors.grey, Colors.black),
                    ),
                    //  6 Button
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: calcButton('6', Colors.grey, Colors.black),
                    ),
                    //  - Button
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: calcButton('-', Colors.amber, Colors.white),
                    ),
                  ],
                ),
              ),
              //Row 4 - 1,2,3,+
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // 1 Button
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: calcButton('1', Colors.grey, Colors.black),
                    ),
                    //  2 Button
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: calcButton('2', Colors.grey, Colors.black),
                    ),
                    //  3 Button
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: calcButton('3', Colors.grey, Colors.black),
                    ),
                    //  + Button
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: calcButton('+', Colors.amber, Colors.white),
                    ),
                  ],
                ),
              ),
              // Row 5 - 0,virgül(,),=
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // 0 Button
                    SizedBox(
                      width: screenWidht / 2.45,
                      height: 60,
                      child: calcButton('0', Colors.grey, Colors.black),
                    ),
                    //  . Button
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: calcButton('.', Colors.amber, Colors.white),
                    ),
                    //  = Button
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: calcButton('=', Colors.amber, Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
