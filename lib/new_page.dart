import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  final String title;

  NewPage(this.title);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: true,
        appBar: new AppBar(
          title: new Text(title),
          elevation: 0.0,
        ), // Appbar
        body: new SafeArea(child: new GridView(
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 5.0,
              childAspectRatio: 1.0
          ),
          children: <Widget>[
            new Container(
                color: Colors.lightBlue, child: new InkResponse(onTap: null)),
            new Container(color: Colors.black),
            new Container(color: Colors.red),
            new Container(color: Colors.amber),
            new Container(color: Colors.pink),
          ],
        ))
    );
  }
}
