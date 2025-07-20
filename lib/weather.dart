import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:week12_sec130_weather_project/utility/MyStyle.dart';

class weatherPage extends StatefulWidget {
  const weatherPage({super.key});

  @override
  State<weatherPage> createState() => _weatherPageState();
}

class _weatherPageState extends State<weatherPage> {
  String _cityname = "Pathumthani";
  double _temp = 0.0;
  double _tempMin = 0.0;
  double _tempMax = 0.0;
  double _windSpeed = 0.0;
  double _pressure = 0.0;
  double _humidity = 0.0;
  String _description = "";
  int day = 0;
  String date ="";
  DateTime now = DateTime.now();
  var days = ['Monday', 'Tuesday','Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
  String _iconCode = "10d";

  Future<void> getWeatherDetails() async {
    String _url = "https://api.openweathermap.org/data/2.5/weather?q=$_cityname&appid=47e855f8b922d1c5f82fb2b4742ceff5";
    try {
      Response response = await Dio().get(_url);
      Map<String, dynamic> result = json.decode(response.toString());
      setState(() {
        _temp = result['main']['temp'] - 273.15;
        _tempMin = result['main']['temp_min'] - 273.15;
        _tempMax = result['main']['temp_max'] - 273.15;
        _windSpeed = result['wind']['speed']*3.6;
        _pressure = result['main']['pressure'];
        _humidity = result['main']['humidity'];
        _description = result['weather'][0]['main'];
        _iconCode = result['weather'][0]['icon'];
      });

      //print(response.toString());
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWeatherDetails();
    day = now.weekday;
    date = days[day-1].toString();
    date += ", ${now.day}, ${now.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xb3ffe4e1), Color(0xb38ab9f1)]
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title: MyStyle().showTextHeader("Weather"),
          actions: [
            buildPopupMenuButton(),
          ],
        ),
        body: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _cityname,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              MyStyle().mySpace(),
              Text(
                date,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              MyStyle().mySpace(),
              Stack(
                children: [
                  Container(
                    width: 350,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    //padding: const EdgeInsets.only(left: 10.0),
                    child: Image.network("https://openweathermap.org/img/wn/${_iconCode.toString()}@2x.png"),
                  ),
                  Positioned(
                    left: 30.0,
                    bottom: 20.0,
                    child: Text(
                      _description,
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20.0,
                    top: 20.0,
                    child: Text(
                      "${_temp.toStringAsFixed(2)} \u2103",
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      MyStyle().buildLabel("LOW"),
                      MyStyle().buildIcon("images/low_temp.png"),
                      MyStyle()
                          .buildLabel("${_tempMin.toStringAsFixed(2)} \u2103"),
                    ],
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Column(
                    children: [
                      MyStyle().buildLabel("HIGH"),
                      MyStyle().buildIcon("images/high_temp.png"),
                      MyStyle()
                          .buildLabel("${_tempMax.toStringAsFixed(2)} \u2103"),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      MyStyle().buildLabel("WINDSPEED"),
                      MyStyle().buildIcon("images/wind.png"),
                      MyStyle().buildLabel("${_windSpeed.toStringAsFixed(2)} Km/h"),
                    ],
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Column(
                    children: [
                      MyStyle().buildLabel("PRESSURE"),
                      MyStyle().buildIcon("images/pressure.png"),
                      MyStyle()
                          .buildLabel("${_pressure.toStringAsFixed(2)} hPa"),
                    ],
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Column(
                    children: [
                      MyStyle().buildLabel("HUMIDITY"),
                      MyStyle().buildIcon("images/humidity.png"),
                      MyStyle().buildLabel("${_humidity.toStringAsFixed(2)} %"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  PopupMenuButton<int> buildPopupMenuButton() {
    return PopupMenuButton(
      onSelected: (item) {
        setState(() {
          if (item == 0) {
            _cityname = "Pathumthani";
          } else if (item == 1) {
            _cityname = "Bangkok";
          } else if (item == 2) {
            _cityname = "Phuket";
          } else if (item == 3) {
            _cityname = "London";
          } else if (item == 4) {
            _cityname = "Taipei";
          } else if (item == 5) {
            _cityname = "Beijing";
          }
        });
        getWeatherDetails();
      },
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 0,
          child: Text("Pathumthani"),
        ),
        const PopupMenuItem(
          value: 1,
          child: Text("Bangkok"),
        ),
        const PopupMenuItem(
          value: 2,
          child: Text("Phuket"),
        ),
        const PopupMenuItem(
          value: 3,
          child: Text("London"),
        ),
        const PopupMenuItem(
          value: 4,
          child: Text("Taipei"),
        ),
        const PopupMenuItem(
          value: 5,
          child: Text("Beijing"),
        ),
      ],
      initialValue: 0,
    );
  }
}
