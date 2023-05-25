import 'package:flutter/material.dart';
import 'package:learn/services/world__time.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> locations = [
    WorldTime(location: 'London', url: 'Europe/London'),
    WorldTime(location: 'Cairo', url: 'Africa/Cairo'),
    WorldTime(location: 'Nairobi', url: 'Africa/Nairobi'),
  ];

  void loadingTime(index) async {
    WorldTime inst = WorldTime(
        location: 'locations[index].location', url: 'locations[index].url');
    await inst.getTime();
    Navigator.pop(context, {
      'location': inst.location,
      'time': inst.time,
      'isdaytime': inst.isdaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text('Select Location'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  loadingTime(index);
                },
                title: Text(locations[index].location),
              ),
            );
          },
        ));
  }
}
