import 'package:app_clima/controllers/weather_controller.dart';
import 'package:app_clima/models/weather.dart';
import 'package:app_clima/repository/weather_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = WeatherController(ClimateRepository());

  @override
  void initState() {
    controller.getWeatherData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 183, 213, 246),
        title: const Text("home page"),
        actions: [
          IconButton(
              onPressed: () {
                controller.getWeatherData();
              },
              icon: const Icon(Icons.refresh)),
        ],
      ),
      body: StreamBuilder(
        stream: controller.outputEvent,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Error loading weather information."),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          Weather weather = snapshot.data!;

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(""),
                SvgPicture.network(
                    "https://assets.hgbrasil.com/weather/icons/conditions/${weather.conditionSlug!}"),
                Text(
                  weather.city!,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  '${weather.temp?.toString()}°',
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  weather.description!,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      weather.windSpeedy!,
                      style: const TextStyle(
                        fontFamily: 'iOSfonts',
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      weather.time!,
                      style: const TextStyle(
                        fontFamily: 'iOSfonts',
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
