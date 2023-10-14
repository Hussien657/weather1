import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/screens/home_screen.dart';

import '../weather_cubit/weather_cubit.dart';
class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => WeatherCubit()..getData() )
      ],
      child: MaterialApp(
        home: HomeScreen(
        ),
      ),
    );
  }
}
