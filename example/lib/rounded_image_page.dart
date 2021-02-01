import 'package:flutter/material.dart';
import 'package:round_corners_image_provider/round_corners_image_provider.dart';

class RoundedImagePage extends StatefulWidget {
  @override
  _RoundedImagePageState createState() => _RoundedImagePageState();
}

class _RoundedImagePageState extends State<RoundedImagePage> {
  int radius = 30;
  Color color = Colors.red;
  double height = 190;
  bool showWidth = true;
  ClipLocation location = ClipLocation.End;

  Widget wrapWidget(bool roundCorner) {
    return Wrap(
      children: [
        for (var i = 0; i < 60; i++)
          Image(
            image: RoundCornersImageProvider.asset(
              'assets/icon_round_corners.png',
              cornerRadius: 30,
              imageShowSize: Size(60, 60),
              cornerColor: Colors.yellow
            ),
            width: 60,
            height: 60,
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: Text('图片生成圆角'),
        actions: [
          FlatButton(
            onPressed: () {
              setState(() {});
            },
            child: Text('刷新'),
          ),
        ],
      ),
      body: wrapWidget(true),
    );
  }
}
