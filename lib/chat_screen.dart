import 'package:chat_app/chat_message.dart';
import 'package:flutter/material.dart';
import 'chat_message.dart';

class chatScreen extends StatefulWidget {
  @override
  _chatScreenState createState() => _chatScreenState();
}

class _chatScreenState extends State<chatScreen> {

  final TextEditingController _textcontroller = new TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];


  void _handleSubmitted(String text){
    _textcontroller.clear();
    ChatMessage message = new ChatMessage(
        text: text
    );
    setState(() {
      _messages.insert(0, message );
    });
  }

  Widget _textComposerWidget(){
    return IconTheme(
      data: new IconThemeData(
        color: Colors.blue
      ),
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          child: new Row(
            children: <Widget>[
              new Flexible(
                  child: new TextField(
                    decoration: new InputDecoration.collapsed(hintText: "Send a message"),
                    onSubmitted: _handleSubmitted,
                    controller: _textcontroller,
                  )
              ),
              new Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                child : IconButton(
                    icon: new Icon(Icons.send) ,
                    onPressed: ()=> _handleSubmitted(_textcontroller.text)
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
          height: 1.0,
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
