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
          
          children:  const [
            WeatherForecast(day: DayOfWeek.Mon, image: 'assets/w4-s1-weather/sun.jpg', maxTemp: '15°', minTemp: '-3°'),
            WeatherForecast(day: DayOfWeek.Tue, image: 'assets/w4-s1-weather/cloudy.jpg', maxTemp: '4°', minTemp: '-4°'),
            WeatherForecast(day: DayOfWeek.Wed, image: 'assets/w4-s1-weather/rainy.jpg', maxTemp: '9°', minTemp: '7°'),
            WeatherForecast(day: DayOfWeek.Thu, image: 'assets/w4-s1-weather/rain_storm.jpg', maxTemp: '8°', minTemp: '-1°'),
            WeatherForecast(day: DayOfWeek.Fri, image: 'assets/w4-s1-weather/snowy.jpg', maxTemp: '5°', minTemp: '-2°'),
            WeatherForecast(day: DayOfWeek.Sat, image: 'assets/w4-s1-weather/sun_cloud_rain.jpg', maxTemp: '12°', minTemp: '7°'),
            WeatherForecast(day: DayOfWeek.Sun, image: 'assets/w4-s1-weather/sun.jpg', maxTemp: '3°', minTemp: '-3°'),
          ],
        )
      )
      
    )
  ));
}


enum DayOfWeek {
  Mon, Tue, Wed, Thu, Fri, Sat, Sun;
}
class WeatherForecast extends StatelessWidget {
  const WeatherForecast({required this.maxTemp, required this.minTemp, required this.image, required this.day,  super.key});

  final String image;
  final String minTemp;
  final String maxTemp;
  final DayOfWeek day;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              day.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),
            ),
            Image.asset(
              '$image',
              height: 50, 
              width: 50,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$maxTemp', 
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  )
                ),
                const SizedBox(width: 2),
                Text(
                  '$minTemp', 
                  style: TextStyle(color: Colors.grey[400]),
                )
              ],
            ),
          ],
        ),
        )
      );
  }
}