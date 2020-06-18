import 'package:flutter/material.dart';

class CameraIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Icon(
      Icons.camera,
      color: Colors.white,
    );
  }
}

class CameraHome extends StatefulWidget {
  @override
  _CameraHomeState createState() => new _CameraHomeState();
}

class _CameraHomeState extends State<CameraHome> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}

