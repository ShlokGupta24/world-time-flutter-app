import 'dart:convert';   // Use to convert json to map using json decode
import 'package:http/http.dart'; //Use to get http link for api calling
import 'package:intl/intl.dart'; //Use to format the time like from 12:20:23 to 12:20 PM

class WorldTime{

  String location; //location name for UI
  late String time; //time in that location use late keyword for working of constructor, as it not take value instead and show error
  String flag; //url to an asset flag icon
  String url; //location url for api endpoint
  late bool isDaytime; // true or false if daytime or not

  WorldTime({
    required this.location,
    required this.flag,
    required this.url
  });//constructor to receive values

  Future<void> getTime() async {
   //Using try and catch to handle error
    try{
      //make the request
      Response response = await get(
        Uri.parse(
          'https://api.timezonedb.com/v2.1/get-time-zone?key=Z03QNRUFEYOQ&format=json&by=zone&zone=$url',
        ),
      ); //Get the response from api
      Map data = jsonDecode(response.body);  //Decode the json data from api to map data type
      String datetime=data['formatted']; //Get the formatted datetime from map data
      DateTime now=DateTime.parse(datetime);  //Convert datetime string to DateTime datatype for further use
      isDaytime=now.hour>6 && now.hour<20 ? true : false; //Check if daytime or not

      time=DateFormat.jm().format(now);  //Set time format using init package
    }
    catch(e){
      print('caught error: $e');
      time='could not get time data';
    }
  }
}

