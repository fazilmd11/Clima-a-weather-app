import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
import 'city_screen.dart';
import 'package:footer/footer.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.WeatherData, this.ForecastData, this.AqiData});
  final WeatherData;
  final ForecastData;
  final AqiData;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();

  // int? condition;
  int temperature = 0;
  String? cityName;
  String? weatherIcon;
  String? weatherText;
  String? weatherDesc;
  double day1min = 0;
  double day1max = 0;
  double day2min = 0;
  double day2max = 0;
  double day3min = 0;
  double day3max = 0;
  String? day1Icon;
  String? day2Icon;
  String? day3Icon;
  String? day1Desc;
  String? day2Desc;
  String? day3Desc;
  double windSpeed = 0;
  int pressure = 0;
  int humidity = 0;
  int aqi = 0;
  double pm10 = 0;
  Color aqiColor = Colors.white24.withOpacity(0.3);
  Color getAqiColor(int aqi, double pm10) {
    if (aqi == 1) {
      aqiColor = Colors.greenAccent.withOpacity(0.3);
    } else if (aqi == 2) {
      aqiColor = Colors.yellowAccent.withOpacity(0.3);
    } else if (aqi == 3) {
      if (pm10 <= 150) {
        aqiColor = Colors.orangeAccent.withOpacity(0.3);
      } else if (pm10 > 150) {
        aqiColor = Colors.redAccent.withOpacity(0.3);
      }
    } else if (aqi == 4) {
      aqiColor = Colors.purpleAccent.withOpacity(0.3);
    } else if (aqi == 5) {
      aqiColor = Color(0xFF800000).withOpacity(0.3);
    }
    return aqiColor;
  }

  var dt = DateTime.now();
  var bgimg;
  void updateUIforecast(dynamic weatherData, dynamic forecastData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherText = 'Unable to get weather data';
        cityName = '';
        weatherDesc = '';
        day1min = 0;
        day1max = 0;
        day2min = 0;
        day2max = 0;
        day3min = 0;
        day3max = 0;
        day1Icon = '';
        day2Icon = '';
        day3Icon = '';
        day1Desc = '';
        day2Desc = '';
        day3Desc = '';
        windSpeed = 0;
        pressure = 0;
        humidity = 0;
        return;
      }
      int condition = weatherData['weather'][0]['id'];
      weatherIcon = weatherData['weather'][0]['icon'];
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      weatherText = weather.getMessage(temperature);
      cityName = weatherData['name'];
      weatherDesc = weatherData['weather'][0]['description'];
      day1min = forecastData['list'][0]['temp']['min'];
      day1max = forecastData['list'][0]['temp']['max'];
      day2min = forecastData['list'][1]['temp']['min'];
      day2max = forecastData['list'][1]['temp']['max'];
      day3min = forecastData['list'][2]['temp']['min'];
      day3max = forecastData['list'][2]['temp']['max'];
      day1Icon = forecastData['list'][0]['weather'][0]['icon'];
      day2Icon = forecastData['list'][1]['weather'][0]['icon'];
      day3Icon = forecastData['list'][2]['weather'][0]['icon'];
      day1Desc = forecastData['list'][0]['weather'][0]['description'];
      day2Desc = forecastData['list'][1]['weather'][0]['description'];
      day3Desc = forecastData['list'][2]['weather'][0]['description'];
      windSpeed = weatherData['wind']['speed'];
      pressure = weatherData['main']['pressure'];
      humidity = weatherData['main']['humidity'];
      print(pressure);
      print(day1Icon);
      print(day3min);
      print(day3Desc);
      if (dt.hour > 6 && dt.hour < 18) {
        bgimg = 'images/wp7680347.jpg';
      } else {
        bgimg = 'images/FOLK.jpg';
      }
    });
  }

  void updateUI(dynamic weatherData, dynamic forecastData, dynamic aqiData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherText = 'Unable to get weather data';
        cityName = '';
        weatherDesc = '';
        day1min = 0;
        day1max = 0;
        day2min = 0;
        day2max = 0;
        day3min = 0;
        day3max = 0;
        day1Icon = '';
        day2Icon = '';
        day3Icon = '';
        day1Desc = '';
        day2Desc = '';
        day3Desc = '';
        windSpeed = 0;
        pressure = 0;
        humidity = 0;
        pm10 = 0;
        aqi = 0;
        return;
      }
      int condition = weatherData['weather'][0]['id'];
      weatherIcon = weatherData['weather'][0]['icon'];
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      weatherText = weather.getMessage(temperature);
      cityName = weatherData['name'];
      weatherDesc = weatherData['weather'][0]['description'];
      day1min = forecastData['daily'][0]['temp']['min'];
      day1max = forecastData['daily'][0]['temp']['max'];
      day2min = forecastData['daily'][1]['temp']['min'];
      day2max = forecastData['daily'][1]['temp']['max'];
      day3min = forecastData['daily'][2]['temp']['min'];
      day3max = forecastData['daily'][2]['temp']['max'];
      day1Icon = forecastData['daily'][0]['weather'][0]['icon'];
      day2Icon = forecastData['daily'][1]['weather'][0]['icon'];
      day3Icon = forecastData['daily'][2]['weather'][0]['icon'];
      day1Desc = forecastData['daily'][0]['weather'][0]['description'];
      day2Desc = forecastData['daily'][1]['weather'][0]['description'];
      day3Desc = forecastData['daily'][2]['weather'][0]['description'];
      windSpeed = weatherData['wind']['speed'];
      pressure = weatherData['main']['pressure'];
      humidity = weatherData['main']['humidity'];
      aqi = aqiData['list'][0]['main']['aqi'];
      pm10 = aqiData['list'][0]['components']['pm10'];
      // aqi = 1;
      // pm10 = 25;
      print(aqi);
      print(day1Icon);
      print(day3min);
      print(day3Desc);
      if (dt.hour > 6 && dt.hour < 18) {
        bgimg = 'images/wp7680347.jpg';
      } else {
        bgimg = 'images/FOLK.jpg';
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.WeatherData, widget.ForecastData, widget.AqiData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(bgimg),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      var forecastData = await weather.getForecastWeather();
                      var aqiData = await weather.getAQI();
                      updateUI(weatherData, forecastData, aqiData);
                    },
                    child: Icon(
                      Icons.my_location,
                      size: 50.0,
                    ),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                    ),
                  ),
                  Text(
                    cityName.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 25,
                      fontFamily: 'Quicksand',
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      String typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CityScreen()),
                      );
                      print(typedName);
                      if (typedName != null) {
                        var weatherData =
                            await weather.getCityWeather(typedName);
                        var forecastData =
                            await weather.getCityForecast(typedName);
                        updateUIforecast(weatherData, forecastData);
                      }
                    },
                    child: Icon(
                      Icons.travel_explore,
                      size: 50.0,
                    ),
                    style: TextButton.styleFrom(
                        primary: Colors.white,
                        textStyle: TextStyle(
                          fontFamily: 'Quicksand',
                        )),
                  ),
                ],
              ),
              Column(
                children: [
                  // Image.network(
                  //   'http://openweathermap.org/img/wn/$weatherIcon@2x.png',
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        temperature.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 100,
                          fontFamily: 'Quicksand',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 45.0),
                        child: Text(
                          '??C',
                          textScaleFactor: 0.4,
                          style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 100,
                            fontFamily: 'Quicksand',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    weatherDesc.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 20,
                      fontFamily: 'Quicksand',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: getAqiColor(aqi, pm10),
                    ),
                    child: Text(
                      'AQI ${pm10.toInt().toString()}',
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'Quicksand',
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 10, 50),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.network(
                              'http://openweathermap.org/img/wn/$day1Icon@2x.png',
                              height: 50,
                            ),
                            Text(
                              'Tomorrow: ',
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                              ),
                            ),
                            Text(
                              day1Desc.toString(),
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '${day1max.toInt()}?? / ${day1min.toInt()}??',
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.network(
                              'http://openweathermap.org/img/wn/$day2Icon@2x.png',
                              height: 50,
                            ),
                            Text(
                              'Overmorrow: ',
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                              ),
                            ),
                            Text(
                              day1Desc.toString(),
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '${day2max.toInt()}?? / ${day2min.toInt()}??',
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.network(
                                'http://openweathermap.org/img/wn/$day3Icon@2x.png',
                                height: 50),
                            Text(
                              'Day 3: ',
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                              ),
                            ),
                            Text(
                              day3Desc.toString(),
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '${day3max.toInt()}?? / ${day3min.toInt()}??',
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.air,
                              size: 35,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${windSpeed.toString()} km/h',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Quicksand',
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset(
                              "images/humidity.png",
                              height: 35,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${humidity.toString()} %',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Quicksand',
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset(
                              "images/barometer.png",
                              height: 35,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${pressure.toString()} mbar',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Quicksand',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
