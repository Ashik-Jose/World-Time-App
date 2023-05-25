import 'package:flutter/material.dart';
import 'package:learn/services/world__time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  setupTime() async {
    WorldTime inst = WorldTime(location: 'London', url: 'Europe/London');
    await inst.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': inst.location,
      'time': inst.time,
      'isdaytime': inst.isdaytime,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SpinKitRipple(
        color: Colors.red,
        size: 50.0,
      ),
    )
    );
  }
}
