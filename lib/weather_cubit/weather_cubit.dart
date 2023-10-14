import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather/service/dio.dart';

import '../model/w_model.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  WeatherModel? weatherModel;
static WeatherCubit get (context) =>  BlocProvider.of(context);
  void getData(){

    DioHelper.dio.get('https://api.openweathermap.org/data/2.5/weather',
        queryParameters: {
      //q=London&units=metric&appid=ddcdbfe8c6baa50812ec931a2e9e8142
        'q' : 'Cairo',
        'units' : 'metric',
        'appid' :'ddcdbfe8c6baa50812ec931a2e9e8142',
        }).then( (value){
          print(value.statusCode);
      var data =jsonDecode(value.data);
      weatherModel=WeatherModel.fromJson(data);
      

      emit(change());


    }
    ).catchError((onError){
      print(onError);
    });
  }


}
