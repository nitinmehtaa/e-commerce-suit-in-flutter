import 'package:flutter/material.dart';

class Categories_collection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery
        .of(context)
        .size;
    return new Container(
//      margin: new EdgeInsets.only(bottom: 10.0),
      alignment: Alignment.center,
      width: deviceSize.width,
      color: Colors.red[400],
      height: deviceSize.height * 0.08,
      child: new ListView(
        shrinkWrap: true,
//        padding: new EdgeInsets.only(top: 10.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          new Container(
            height: 90.0,
            color: Colors.red[400],
            alignment: Alignment.center,
            child: new FlatButton(onPressed: () {
              Navigator.of(context).pushNamed("/notifications");
            }, child: new Column(
              children: <Widget>[
                new Icon(Icons.local_offer, color: Colors.white),
                new Padding(padding: new EdgeInsets.only(bottom: 2.0)),
                new Text("Offers", textAlign: TextAlign.center,
                    style: new TextStyle(color: Colors.white)),
              ],
            )),
          ),
          new Container(
            alignment: Alignment.center,
            color: Colors.red[400],
            child: new FlatButton(onPressed: () {
              Navigator.of(context).pushNamed("/notifications");
            }, child: new Column(
              children: <Widget>[
                new Icon(Icons.phone_iphone, color: Colors.white),
                new Padding(padding: new EdgeInsets.only(bottom: 2.0)),
                new Text("Mobiles", textAlign: TextAlign.center,
                    style: new TextStyle(color: Colors.white)),
              ],
            )),
          ),
          new Container(
            alignment: Alignment.center,
            color: Colors.red[400],
            child: new FlatButton(onPressed: () {
              Navigator.of(context).pushNamed("/notifications");
            }, child: new Column(
              children: <Widget>[
                new Icon(Icons.laptop_mac, color: Colors.white),
                new Padding(padding: new EdgeInsets.only(bottom: 2.0)),
                new Text("Laptops", textAlign: TextAlign.center,
                    style: new TextStyle(color: Colors.white)),
              ],
            )),
          ),
          new Container(
            alignment: Alignment.center,
            color: Colors.red[400],
            child: new FlatButton(onPressed: () {
              Navigator.of(context).pushNamed("/notifications");
            }, child: new Column(
              children: <Widget>[
                new Icon(Icons.more, color: Colors.white),
                new Padding(padding: new EdgeInsets.only(bottom: 2.0)),
                new Text("More", textAlign: TextAlign.center,
                    style: new TextStyle(color: Colors.white)),
              ],
            )),
          ),
        ],
      ),
    );
  }
}