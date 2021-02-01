import 'package:flutter/material.dart';

class ClipImagePage extends StatefulWidget {
  @override
  _RoundedImagePageState createState() => _RoundedImagePageState();
}

class _RoundedImagePageState extends State<ClipImagePage> {
  int radius = 30;
  Color color = Colors.red;
  double height = 190;
  bool showWidth = true;

  Widget wrapWidget(bool roundCorner) {
    return Wrap(
      children: [
        for (var i = 0; i < 60; i++)
          ClipRRect(
            borderRadius: BorderRadius.circular(radius.toDouble()),
            child: Image.asset(
              'assets/icon_round_corners.png',
              width: 60,
              height: 60,
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: Text('裁剪圆角'),
        actions: [
          FlatButton(
            onPressed: () {
              setState(() {});
            },
            child: Text('刷新'),
          ),
        ],
      ),
      body: wrapWidget(false),
    );
  }
}
