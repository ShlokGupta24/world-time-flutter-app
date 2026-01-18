import 'dart:convert';
import 'package:http/http.dart';

class WorldTime{

  String location; //location name for UI
  late String time;
  String flag;
  String url;

  WorldTime({
    required this.location,
    required this.flag,
    required this.url
  });//constructor to receive values

  Future<void> getTime() async {

    try{
      //make the request
      Response response = await get(
        Uri.parse(
          'https://api.timezonedb.com/v2.1/get-time-zone?key=Z03QNRUFEYOQ&format=json&by=zone&zone=$url',
        ),
      );
      Map data = jsonDecode(response.body);
      String datetime=data['formatted'];
      time=datetime.toString();
    }
    catch(e){
      print('caught error: $e');
      time='could not get time data';
    }

  }

}

