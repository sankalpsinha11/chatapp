import 'package:flutter/material.dart';
import 'chat_screen.dart';

class homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDE6751),
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        title: new Text("Bobble Demo"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(48.0) , topRight: Radius.circular(48.0))
        ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(48.0) , topLeft: Radius.circular(48.0)
            ),
              child: chatScreen())),
    );
  }
}
