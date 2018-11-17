import 'package:flutter/material.dart';
import 'package:flutter_app_tablayout/CategoriesCollection.dart';
import 'package:flutter_app_tablayout/CarouselDemo.dart';
import 'package:flutter_app_tablayout/Dealsoftheday.dart';
import 'package:flutter_app_tablayout/Single_brand_promotion.dart';

//Feed page with a collection of multiple Widgets
class FeedWidgetList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: 2,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => index == 0
            ? new CategoriesCollection()
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                    new Flexible(
                        child: new Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: new Container(
                            alignment: Alignment.bottomCenter,
                            height: 220.0,
                            child: new Center(child: new CarouselDemo()),
                            color: Colors.white)
                        ),
                            ),
                    new Flexible(
                        child: new Container(
                            height: 300.0,
                            color: Colors.green[500],
                            child: new Dealsoftheday(),
                            margin: new EdgeInsets.only(top: 8.0))),
                    new Flexible(
                        child: new Container(
                            height: 250.0,
                            color: Colors.red[500],
                            child: new Single_brand_promotion(),
                            margin: new EdgeInsets.only(top: 8.0))),
                    new Flexible(
                        child: new Container(
                            height: 300.0,
                            color: Colors.red[500],
                            child: new Dealsoftheday(),
                            margin: new EdgeInsets.only(top: 8.0))),
                    new Flexible(
                        child: new Container(
                            height: 300.0,
                            color: Colors.red[500],
                            child: new Dealsoftheday(),
                            margin: new EdgeInsets.only(top: 8.0))),
                  ]));
  }
}
