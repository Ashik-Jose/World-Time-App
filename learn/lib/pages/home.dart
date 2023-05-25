import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

Map data = {};

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    String bgImage = data['isdaytime'] ? 'day.jpg' : 'night.jpg';

    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/$bgImage'),
        fit: BoxFit.cover,
      )),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 110,
            ),
            RaisedButton.icon(
              onPressed: () async {
                dynamic result =
                    await Navigator.pushNamed(context, '/location');
                setState(() {
                  data = {
                    'time': result['time'],
                    'location': result['location'],
                    'isdaytime' : result['isdaytime'],
                  };
                });
              },
              label: Text('Go to location'),
              icon: Icon(Icons.edit_location),
              color: Colors.grey[350],
            ),
            SizedBox(
              height: 50.0,
            ),
            Text(
              data['location'],
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              data['time'],
            )
          ],
        ),
      ),
    ));
  }
}
