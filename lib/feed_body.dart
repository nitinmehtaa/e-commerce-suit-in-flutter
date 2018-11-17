import 'package:flutter/material.dart';
import 'package:flutter_app_tablayout/FeedWidgetList.dart';


class feed_body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        new Container(color: Colors.red[400],
            alignment: Alignment.center,
            height: 55.0,
            child: new Container(
                color: Colors.white,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 8.0, right: 8.0, top: 5.0, bottom: 8.0),
                child: new FlatButton
                  (onPressed: () {
                  Navigator.of(context).pushNamed("/notifications");
                },
                  color: Colors.white,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Icon(Icons.search, color: Colors.grey,),
                      new Padding(padding: const EdgeInsets.all(4.0),), 
                     new Text('Search for Products, Brands and More', textAlign: TextAlign.center,
                      style: new TextStyle(color: Colors.grey))
                    ],
                  ),
                )
            )),
        new Flexible(
          child: FeedWidgetList(),
        ),
      ],
    );
  }
}