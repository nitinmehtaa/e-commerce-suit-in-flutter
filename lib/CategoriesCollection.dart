import 'package:flutter/material.dart';

class CategoriesCollection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery
        .of(context)
        .size;
    return new Container(
      alignment: Alignment.center,
      width: deviceSize.width,
      color: Colors.red[400],
      height: deviceSize.height * 0.08,
      child: new ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          new Container(
            alignment: Alignment.bottomCenter,
            height: 90.0,
            color: Colors.red[400],
            child: new FlatButton(onPressed: () {
              Navigator.of(context).pushNamed("/notifications");
            }, child: new Padding(
              padding: const EdgeInsets.all(9.0),
              child: new Column(
              children: <Widget>[
                new Icon(Icons.local_offer, color: Colors.white),
                new Padding(padding: new EdgeInsets.only(bottom: 2.0)),
                new Text("Offers", textAlign: TextAlign.center,
                    style: new TextStyle(color: Colors.white)),
              ],
            ),
            )
            ),
          ),
          new Container(
            alignment: Alignment.center,
            color: Colors.red[400],
            child: new FlatButton(onPressed: () {
              Navigator.of(context).pushNamed("/notifications");
            }, child: new Padding(
              padding: const EdgeInsets.all(9.0),
              child: new Column(
              children: <Widget>[
                new Icon(Icons.phone_iphone, color: Colors.white),
                new Padding(padding: new EdgeInsets.only(bottom: 2.0)),
                new Text("Mobiles", textAlign: TextAlign.center,
                    style: new TextStyle(color: Colors.white)),
              ],
            ),
            ),
            ),
          ),
          new Container(
            alignment: Alignment.center,
            color: Colors.red[400],
            child: new FlatButton(onPressed: () {
              Navigator.of(context).pushNamed("/notifications");
            }, child: new Padding(
              padding: const EdgeInsets.all(9.0),
              child: new Column(
              children: <Widget>[
                new Icon(Icons.laptop_mac, color: Colors.white),
                new Padding(padding: new EdgeInsets.only(bottom: 2.0)),
                new Text("Laptops", textAlign: TextAlign.center,
                    style: new TextStyle(color: Colors.white)),
              ],
            ),
            ),
            ),
          ),
          new Container(
            alignment: Alignment.center,
            color: Colors.red[400],
            child: new FlatButton(onPressed: () {
              Navigator.of(context).pushNamed("/notifications");
            }, child: new Padding(
              padding: const EdgeInsets.all(9.0),
              child: new Column(
              children: <Widget>[
                new Icon(Icons.more, color: Colors.white),
                new Padding(padding: new EdgeInsets.only(bottom: 2.0)),
                new Text("More", textAlign: TextAlign.center,
                    style: new TextStyle(color: Colors.white)),
              ],
            ),
            ),
            ),
          ),
        ],
      ),
    );
  }
}