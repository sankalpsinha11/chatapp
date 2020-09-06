import 'package:flutter/material.dart';


class ChatMessage extends StatelessWidget {
  final String _name = "Sankalp";
  final String text ;
  bool increase ;
  double fontSize;
  ChatMessage({this.text , this.fontSize , this.increase});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
            margin: EdgeInsets.only(right:16.0),
            child: new CircleAvatar(
              backgroundColor: Color(0xFFDE6751),
              child: new Text(_name[0],style: TextStyle(color: Colors.white),),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.5,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(_name , style: TextStyle(
                  fontWeight: FontWeight.w500
                )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 72,
                    child: new Container(
                      margin: EdgeInsets.only(top: 5.0),
                      child:Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFDE6751),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0),bottomRight: Radius.circular(20.0)),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 8.0 , vertical: 10.0),
                          child: new Text(text , style: TextStyle(
                              fontSize: fontSize,
                              color: Colors.white),))

                      ),
                  ),
                ]),
          )
                ]),
          
    );
  }
}
