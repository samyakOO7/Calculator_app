import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final int textColor;
  final int fillColor;
  final double textSize;
  final Function callback;
  @override
   // ignore: non_constant_identifier_names
   CalcButton({Key key,
    this.text,
    this.fillColor,
    this.textColor=0xff000000,
    this.textSize=24,
  this.callback}) : super(key: key);
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(12),
      child: SizedBox(
        width: 65,
        height: 65,
        child:FlatButton(
          shape:(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50)
          )),
              child:Text(text,style: GoogleFonts.rubik(
            textStyle: TextStyle(fontSize: textSize)
          ),),
        onPressed: (){
            callback(text);
        },
            color:fillColor!=null?Color(fillColor):null,
            textColor:Color(textColor),

        ),

      ),
    );}}

  // This widget is the root of your application.
