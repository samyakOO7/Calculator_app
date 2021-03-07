
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'CalcButton.dart';
import 'package:math_expressions/math_expressions.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget
{
 MyApp({Key key}):super(key: key);
 @override
  Calc createState()=> Calc();
  }


class Calc extends State<MyApp> {
  // This widget is the root of your application.
  String history='';
  String expression='';
  void numClick(String text){
    setState(() {
      expression+=text;
    });
  }
  void allClear(String text){
    setState(() {
      expression='';
      history='';
    });
  }
  void Clear(String text){
    setState(() {

      expression='';

    });
  }
  void evaluate(String text){
    Parser p=Parser();
    Expression exp=p.parse(expression);
    ContextModel cm=ContextModel();
    double eval=exp.evaluate(EvaluationType.REAL, cm);
    setState(() {

      history=expression;
      expression=eval.toString() ;
    });
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
     title: "Calculator",
      home: Scaffold(
        backgroundColor: Color(0xfff1e7b4),

        body:Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(25),
              child: Text(history,style: GoogleFonts.rubik(textStyle:TextStyle(fontSize: 24),color: Color(0xFF545F61) ))
              ,alignment: Alignment(1,1),
            ),
            Container(
              padding: EdgeInsets.all(25),
              child: Text(expression,style: GoogleFonts.rubik(textStyle:TextStyle(fontSize: 48),color: Colors.black ))
              ,alignment: Alignment(1,1),
            ),
            SizedBox(height: 40,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                CalcButton(text: "AC",fillColor: 0xFF6C807F,callback: allClear),
                CalcButton(text: "C",fillColor: 0xFF6C807F,callback: Clear,),
                CalcButton(text: "%",fillColor: 0xFFFFFFFF,textColor:  0xff2F4F4F,callback: numClick),
                CalcButton(text: "/",fillColor: 0xFFFFFFFF,textColor:   0xff2F4F4F,callback: numClick,),


              ],

            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                CalcButton(text: "7",callback: numClick),
                CalcButton(text: "8",callback: numClick),
                CalcButton(text: "9",callback: numClick),
                CalcButton(text: "*",fillColor: 0xFFFFFFFF,textColor:0xff2F4F4F,callback: numClick),


              ],

            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                CalcButton(text: "4",callback: numClick),
                CalcButton(text: "5",callback: numClick),
                CalcButton(text: "6",callback: numClick),
                CalcButton(text: "-",fillColor: 0xFFFFFFFF,textColor:   0xff2F4F4F,callback: numClick),


              ],

            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                CalcButton(text: "1",callback: numClick),
                CalcButton(text: "2",callback: numClick),
                CalcButton(text: "3",callback: numClick),
                CalcButton(text: "+",fillColor: 0xFFFFFFFF,textColor:   0xff2F4F4F,callback: numClick),


              ],

            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                CalcButton(text: ".",callback: numClick),
                CalcButton(text: "0",callback: numClick),
                CalcButton(text: "00",callback: numClick),
                CalcButton(text: "=",fillColor: 0xFFFFFFFF,textColor:   0xff2F4F4F,callback: evaluate),


              ],

            ),
          ],


        ),
        )

    );}}