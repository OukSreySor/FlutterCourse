import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('7-days Weather Forecast'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          
          children: [
            WeatherForecast(day: DayOfWeek.Mon, image: 'assets/w4-s1-weather/sun.jpg', temp: '25°C'),
            WeatherForecast(day: DayOfWeek.Tue, image: 'assets/w4-s1-weather/cloudy.jpg', temp: '22°C'),
            WeatherForecast(day: DayOfWeek.Wed, image: 'assets/w4-s1-weather/rainy.jpg', temp: '17°C'),
            WeatherForecast(day: DayOfWeek.Thu, image: 'assets/w4-s1-weather/rain_storm.jpg', temp: '15°C'),
            WeatherForecast(day: DayOfWeek.Fri, image: 'assets/w4-s1-weather/snowy.jpg', temp: '-5°C'),
            WeatherForecast(day: DayOfWeek.Sat, image: 'assets/w4-s1-weather/sun_cloud_rain.jpg', temp: '19°C'),
            WeatherForecast(day: DayOfWeek.Sun, image: 'assets/w4-s1-weather/sun.jpg', temp: '28°C'),
          ],
        )
      )
      
    )
  ));
}

enum WeatherCondition {
  Sunny, Rainy, Cloudy, Snowy;
}
// enum Temperature {
//   min, max;
// }
enum DayOfWeek {
  Mon, Tue, Wed, Thu, Fri, Sat, Sun;
}
class WeatherForecast extends StatelessWidget {
  const WeatherForecast({this.weather, required this.temp, required this.image, required this.day,  super.key});

  final WeatherCondition? weather;
  final String image;
  final String temp;
  final DayOfWeek day;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white,
      
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              day.name,
            ),
            Image.asset(
              '$image',
              height: 50, 
              width: 50,
            ),
            Text('25°C'),
          ],
        )

        )
      );

  }
}