import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520588831435-1529e6d7cf5e?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=fd3d7c35892bd8c7c9e757865a764d4c&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1542356805-7ac8780a5349?ixlib=rb-0.3.5&s=b2e0788ba492e32bce9f969eb451b287&dpr=1&auto=format&fit=crop&w=525&q=60',
  'https://images.unsplash.com/photo-1521020773588-3b28297b1e70?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=e0973395dd1655ea3b8fb83fa95c02c2&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1513043069934-38cc6da2ea9f?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=b1bd8ede4d7c4c79fe67abd96f520814&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1513373319109-eb154073eb0b?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c5748b11351ff65472cba9e1c77fb4c&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1520006403909-838d6b92c22e?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=cd5c81517b22ee13e47484cddb56d16c&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1483985988355-763728e1935b?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=828346ed697837ce808cae68d3ddc3cf&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1499951360447-b19be8fe80f5?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=d1046925db0fb1f15417d71ad1676880&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1538411393449-2910995cfa42?ixlib=rb-0.3.5&s=97f82ce7461cb69cf2c0308d4e715d66&dpr=1&auto=format&fit=crop&w=525&q=60',
  'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89e5fd826f8bdc563ab1743608690f39&auto=format&fit=crop&w=500&q=60',


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
                fit: BoxFit.cover,
                  image: new CachedNetworkImageProvider(
                    url,
                  ),
              )
          ),
        );
      }).toList(),
      viewportFraction: 0.9,
      aspectRatio: 2.0,
      autoPlay: false,
      height: 210.0,
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