import 'package:flutter/material.dart';

class Single_brand_promotion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery
        .of(context)
        .size;
    return new Container(
      width: deviceSize.width,
      child: new FlatButton(onPressed: () {
        Navigator.of(context).pushNamed("/notifications");},
          child:  new Container(width: deviceSize.width, height: 230.0, color: Colors.white,
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
                                        "Premium Sports Shoes", textAlign: TextAlign.start,
                                        style: new TextStyle(color: Colors.black,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.normal))
                                ),
                                new Container(padding: const EdgeInsets.only(
                                    bottom: 8.0, left: 10.0),
                                    child: new Text(
                                        "Up to 60% Off", textAlign: TextAlign.start,
                                        style: new TextStyle(color: Colors.green,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold))),
                              ],
                            ),
                          ), //Expanded ends
                          new Padding(
                            padding: new EdgeInsets.only(bottom: 8.0, right: 2.0),
                            child: new Image.asset("lib/assets/sports shoes.png", height: 100.0,
                                fit: BoxFit.fitWidth),
                          ),
                        ],
                      )
                  ), //row ends (text and image)
                ],
              ), //Column ends
          ), //white container ends
      ), //flat button ends
    );
  }
}