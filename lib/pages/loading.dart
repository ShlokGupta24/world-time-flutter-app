import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    Response response = await get(
      Uri.parse(
        'https://api.timezonedb.com/v2.1/get-time-zone?key=Z03QNRUFEYOQ&format=json&by=zone&zone=Asia/Kolkata',
      ),
    );
    Map data = jsonDecode(response.body);
    print(data);
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text("Loading Screen"));
  }
}
