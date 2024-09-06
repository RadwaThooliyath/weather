import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'class.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<Weather> _weather;
  String _location = "India";

  @override
  void initState() {
    super.initState();
    _weather = fetchWeather(_location);
  }

  void _updateWeather(String location) {
    setState(() {
      _location = location;
      _weather = fetchWeather(_location);
    });
  }

  Future<Weather> fetchWeather(String location) async {
    final response = await http.get(Uri.parse(
        'https://api.weatherapi.com/v1/current.json?key=cea3850b52b14c5596192409241607&q=$location'));

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [Icon(Icons.menu)],
      ),
      body: Stack(
          children: [
        Image.asset(
          "assets/w2.jpeg",
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 100,),
                child: Row(
                  children: [
                    Text(
                      "Weather",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ],
                ),
              ),
                   SizedBox(height: 20,),
                   FutureBuilder<Weather>(
                  future: _weather,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      Weather weather = snapshot.data!;
                      return Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 80,
                                width: 180,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15)),
                                  gradient: LinearGradient(
                                      colors: [Colors.black54, Colors.black26],
                                      end: Alignment.topCenter,
                                      begin: Alignment.bottomCenter),
                                  border:
                                  Border.all(color: Colors.white, width: 1),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Column(
                                    children: [
                                      Text(
                                        "${weather.tempC}°C",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "Temperature",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 80,
                                width: 180,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15)),
                                  gradient: LinearGradient(
                                      colors: [Colors.black54, Colors.black26],
                                      end: Alignment.topCenter,
                                      begin: Alignment.bottomCenter),
                                  border:
                                  Border.all(color: Colors.white, width: 1),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Column(
                                    children: [
                                      Text(
                                        "${weather.tempF}°F",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "Fahrenheit",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 80,
                                width: 180,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15)),
                                  gradient: LinearGradient(
                                      colors: [Colors.black54, Colors.black26],
                                      end: Alignment.topCenter,
                                      begin: Alignment.bottomCenter),
                                  border:
                                  Border.all(color: Colors.white, width: 1),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Column(
                                    children: [
                                      Text(
                                        "${weather.humidity}%",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "Humidity",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 80,
                                width: 180,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(15)),
                                  gradient: LinearGradient(
                                      colors: [Colors.black54, Colors.black26],
                                      end: Alignment.topCenter,
                                      begin: Alignment.bottomCenter),
                                  border:
                                  Border.all(color: Colors.white, width: 1),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Column(
                                    children: [
                                      Text(
                                        "${weather.windKph} kph",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "Wind Speed",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    } else {
                      return Text('No data');
                    }
                  },
                ),

              Padding(
                padding: const EdgeInsets.only(top: 20,right: 260),
                child: Text(
                  "Location",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20,),
               Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _updateWeather("India");
                          },
                          child: Container(
                            height: 57,
                            width: 166,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.black54, Colors.black26],
                                  end: Alignment.topCenter,
                                  begin: Alignment.bottomCenter),
                              border: Border.all(color: Colors.white, width: 1),
                            ),
                            child: Center(
                              child: Text(
                                "India",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            _updateWeather("Saudi Arabia");
                          },
                          child: Container(
                            height: 57,
                            width: 166,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.black54, Colors.black26],
                                  end: Alignment.topCenter,
                                  begin: Alignment.bottomCenter),
                              border: Border.all(color: Colors.white, width: 1),
                            ),
                            child: Center(
                              child: Text(
                                "Saudi",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _updateWeather("USA");
                          },
                          child: Container(
                            height: 57,
                            width: 166,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.black54, Colors.black26],
                                  end: Alignment.topCenter,
                                  begin: Alignment.bottomCenter),
                              border: Border.all(color: Colors.white, width: 1),
                            ),
                            child: Center(
                              child: Text(
                                "America",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            _updateWeather("Qatar");
                          },
                          child: Container(
                            height: 57,
                            width: 166,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.black54, Colors.black26],
                                  end: Alignment.topCenter,
                                  begin: Alignment.bottomCenter),
                              border: Border.all(color: Colors.white, width: 1),
                            ),
                            child: Center(
                              child: Text(
                                "Qatar",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              Padding(
                padding: const EdgeInsets.only(top: 20,right: 260),
                child: Text(
                    "Condition",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
              ),
              SizedBox(height: 20,),
              FutureBuilder<Weather>(
                  future: _weather,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      Weather weather = snapshot.data!;
                      return Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 110,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                gradient: LinearGradient(
                                    colors: [Colors.black54, Colors.black26],
                                    end: Alignment.topCenter,
                                    begin: Alignment.bottomCenter),
                                border:
                                Border.all(color: Colors.white, width: 1)),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Column(
                                children: [
                                  Image.asset("assets/sunrise 1.png"),
                                  Text(
                                    weather.condition,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Container(
                            height: 110,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                gradient: LinearGradient(
                                    colors: [Colors.black54, Colors.black26],
                                    end: Alignment.topCenter,
                                    begin: Alignment.bottomCenter),
                                border:
                                Border.all(color: Colors.white, width: 1)),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Column(
                                children: [
                                  Image.asset("assets/2.png"),
                                  Text(
                                    "UV ${weather.uv}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Text('No data');
                    }
                  },
                ),

            ],),
          ),
        ),
        
      ]),
    );
  }
}
