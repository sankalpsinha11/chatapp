import 'package:chat_app/chat_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'chat_message.dart';
import 'package:flutter/animation.dart';


class chatScreen extends StatefulWidget {
  @override
  _chatScreenState createState() => _chatScreenState();
}

class _chatScreenState extends State<chatScreen> with SingleTickerProviderStateMixin{

  final TextEditingController _textcontroller = new TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];
  Animation<double> animation;
  AnimationController controller;

  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = Tween<double>(begin: 15.0, end: 50.0).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
  }

   increaseFontSize() {
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


   _handleSubmitted(String text){
    _textcontroller.clear();
    ChatMessage message = new ChatMessage(
        text: text,
      fontSize: animation.value,
    );
    setState(() {
      _messages.insert(0, message );
    });
  }

  Widget _textComposerWidget(){
    return IconTheme(
      data: new IconThemeData(
        color: Color(0xFFDE6751),
      ),
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          child: new Row(
            children: <Widget>[
              new Flexible(
                  child: new TextField(
                    decoration: new InputDecoration.collapsed(hintText: "Send a message",hintStyle: TextStyle(
                      fontSize: 17.0
                    )),
                    controller: _textcontroller,
                    style: TextStyle(fontSize: animation.value),
                  )
              ),
              new Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                child : GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: IconButton(
                      icon : Icon(Icons.send , size: 30.0,color: Color(0xFFDE6751),),
                    onPressed: (){
                        (_textcontroller.text == "") ? print("no") : _handleSubmitted(_textcontroller.text);
                    },
                    ),
                  ),
                  onLongPress: (){
                    if(_textcontroller.text.isNotEmpty){
                      increaseFontSize();
                    }
                  },
                  onLongPressEnd: (details){
                    _handleSubmitted(_textcontroller.text);
                    controller.animateTo(0,duration: Duration(milliseconds: 1));
                  },
                ),
              )
            ],
          )
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new Flexible(
          child: new ListView.builder(
            padding: EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (BuildContext, int index)=> _messages[index],
            itemCount: _messages.length,
          ),
        ),
        new Divider(
          height: 10.0,
        ),
        new Container(
          decoration: new BoxDecoration(
            color: Theme.of(context).cardColor
          ),
          child: _textComposerWidget(),

        )
      ],
    );
  }
}
