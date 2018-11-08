import 'package:flutter/material.dart';

class Dealsoftheday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery
        .of(context)
        .size;

    return new Container(
      height: 300.0,
      width: deviceSize.width,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Padding(padding: new EdgeInsets.only(top: 1.0, bottom: 6.0),
              child: new Row(
                children: [
                  new Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        new Container(
                            padding: const EdgeInsets.only(
                                bottom: 8.0, left: 10.0),
                            child: new Text(
                                "New Launches", textAlign: TextAlign.start,
                                style: new TextStyle(color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold))
                        ),
                      ],
                    ),
                  ), //Expanded ends
                  new Padding(
                      padding: new EdgeInsets.only(bottom: 8.0, right: 10.0),
                      child: new RaisedButton(color: Colors.white,
                          onPressed: () {
                            Navigator.of(context).pushNamed("/notifications");
                          },
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(4.0)),
                          textColor: Colors.black,
                          child: new Text("View All"))),
                ],
              )), //row ends (text and button)


          // items white container
          new Container(
            color: Colors.white, width: deviceSize.width, height: 220.0,
            child: new ListView (
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: <Widget>[

                //list item 1
                new Container(width: 130.0,
                  child: new FlatButton(onPressed: () {
                    Navigator.of(context).pushNamed("/notifications");
                  },
                      padding: new EdgeInsets.only(top: 10.0),
                      child: new Column(
                        children: <Widget>[
                          new Image.asset(
                              "lib/assets/honor 10.png", height: 100.0,
                              fit: BoxFit.fitWidth),
                          new Padding(
                              padding: new EdgeInsets.only(bottom: 4.0)),
                          new Text("Honor 10", textAlign: TextAlign.center,
                              style: new TextStyle(
                                  color: Colors.black, fontSize: 13.0)),
                          new Padding(
                              padding: new EdgeInsets.only(bottom: 4.0)),
                          new Text("6 GB RAM", textAlign: TextAlign.center,
                              style: new TextStyle(
                                  color: Colors.green, fontSize: 13.0)),
                        ],
                      )),
                ), //list item 1

                //list item 2
                new Container(width: 130.0, child:
                new FlatButton(onPressed: () {
                  Navigator.of(context).pushNamed("/notifications");
                },
                    padding: new EdgeInsets.only(top: 10.0),
                    child: new Column(
                      children: <Widget>[
                        new Image.asset(
                            "lib/assets/iphone 6s.png", height: 100.0,
                            fit: BoxFit.fitWidth),
                        new Padding(padding: new EdgeInsets.only(bottom: 4.0)),
                        new Text(
                            "iPhone 6s (32 GB)", textAlign: TextAlign.center,
                            style: new TextStyle(
                                color: Colors.black, fontSize: 13.0)),
                        new Padding(padding: new EdgeInsets.only(bottom: 4.0)),
                        new Text(
                            "12 MP | 5 MP Camera", textAlign: TextAlign.center,
                            style: new TextStyle(
                                color: Colors.green, fontSize: 13.0)),
                      ],
                    )),
                ), //list item 2

                //list item 3
                new Container(width: 130.0, child:
                new FlatButton(onPressed: () {
                  Navigator.of(context).pushNamed("/notifications");
                },
                    padding: new EdgeInsets.only(top: 10.0),
                    child: new Column(
                      children: <Widget>[
                        new Image.asset(
                            "lib/assets/iphone 8.png", height: 100.0,
                            fit: BoxFit.fitWidth),
                        new Padding(padding: new EdgeInsets.only(bottom: 4.0)),
                        new Text(
                            "iPhone 8 (256 GB)", textAlign: TextAlign.center,
                            style: new TextStyle(
                                color: Colors.black, fontSize: 13.0)),
                        new Padding(padding: new EdgeInsets.only(bottom: 4.0)),
                        new Text(
                            "12 MP | 7 MP Camera", textAlign: TextAlign.center,
                            style: new TextStyle(
                                color: Colors.green, fontSize: 13.0)),
                      ],
                    )),
                ), //list item 3

                //list item 4
                new Container(width: 130.0, child:
                new FlatButton(onPressed: () {
                  Navigator.of(context).pushNamed("/notifications");
                },
                    padding: new EdgeInsets.only(top: 10.0),
                    child: new Column(
                      children: <Widget>[
                        new Image.asset("lib/assets/oppo f7.png", height: 100.0,
                            fit: BoxFit.fitWidth),
                        new Padding(padding: new EdgeInsets.only(bottom: 4.0)),
                        new Text(
                            "OPPO F7(Red, 64 GB)", textAlign: TextAlign.center,
                            style: new TextStyle(
                                color: Colors.black, fontSize: 13.0)),
                        new Padding(padding: new EdgeInsets.only(bottom: 4.0)),
                        new Text(
                            "16 MP | 25 MP Camera", textAlign: TextAlign.center,
                            style: new TextStyle(
                                color: Colors.green, fontSize: 13.0)),
                      ],
                    )),
                ), //list item 4
              ],
            ),
          )
        ],
      ), //parent column
    );
  }
}