import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:learn/pages/choose_location.dart';

class WorldTime {
  String time;
  String location;
  String url;
  bool isdaytime;

  WorldTime({this.location, this.url});

  Future<void> getTime() async {
    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);
    String dateTime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);
    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(offset)));

    isdaytime = now.hour > 4 && now.hour < 18 ? true : false;

    time = DateFormat.jm().format(now);
  }
}
