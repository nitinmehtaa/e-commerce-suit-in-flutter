import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  final String title;

  const NewPage(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(title),
        elevation: 0.0,
      ), // Appbar
      body: SafeArea(
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 5.0,
            childAspectRatio: 1.0,
          ),
          children: <Widget>[
            Container(
              color: Colors.lightBlue,
              child: InkResponse(onTap: null),
            ),
            Container(color: Colors.black),
            Container(color: Colors.red),
            Container(color: Colors.amber),
            Container(color: Colors.pink),
          ],
        ),
      ),
    );
  }
}
