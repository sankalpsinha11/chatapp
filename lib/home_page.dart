import 'package:flutter/material.dart';
import 'chat_screen.dart';

class homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Lets Chat"),
      ),
      body: chatScreen(),
    );
  }
}
