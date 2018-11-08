import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://n1.sdlcdn.com/imgs/h/d/x/tvfifaweb-5e299.jpg', //Banner1
  'https://n2.sdlcdn.com/imgs/h/d/x/kitweb-4c932.jpg', //Banner2
  'https://n3.sdlcdn.com/imgs/h/d/x/ShoesWeb-960fc.jpg', //Banner3
  'https://n3.sdlcdn.com/imgs/h/d/x/WomenFashionWeb-92df5.jpg', //Banner4
  'https://n1.sdlcdn.com/imgs/h/d/x/MakeupDestinationWeb-9f85a.jpg' //Banner5
];

class CarouselDemo extends StatelessWidget {
  CarouselSlider instance;

  @override
  Widget build(BuildContext context) {
    instance = new CarouselSlider(
      items: imgList.map((url) {
        return new Container(
          margin: new EdgeInsets.symmetric(horizontal: 4.0),
          decoration: new BoxDecoration (
              borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
              image: new DecorationImage(
                  image: new NetworkImage(url),
                  fit: BoxFit.cover
              )
          ),
        );
      }).toList(),
      viewportFraction: 0.9,
      aspectRatio: 2.0,
      autoPlay: true,
      height: 150.0,
    );
    return new ListView(
      children: <Widget>[
        new Padding(
            padding: new EdgeInsets.symmetric(vertical: 8.0),
            child: instance
        ),
      ],
    );
  }
}