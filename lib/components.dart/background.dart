import 'package:flutter/material.dart';

class BackGround extends StatelessWidget {
  //const BackGround({Key? key}) : super(key: key);
  var image;
  double opacity;
  BackGround(this.image,this.opacity, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return Container(
      constraints: BoxConstraints.expand(
        width: width,
        height: height,
      ),
      decoration: BoxDecoration(
          //color: Colors.white,
          image: DecorationImage(
              image: AssetImage('$image'), fit: BoxFit.fill, opacity:opacity)),
    );
  }
}
