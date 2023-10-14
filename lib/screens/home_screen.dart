import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../weather_cubit/weather_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var  cubit = WeatherCubit.get(context);
    if(cubit.weatherModel?.name == null)
    cubit.getData();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/image/beautiful-2297215_1280.jpg',
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [

              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Text('${cubit.weatherModel?.name}',style: TextStyle(
                    fontWeight:FontWeight.bold,
                    fontSize: 40,color: Colors.white),),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline:TextBaseline.alphabetic ,
                children: [
                  Text('${cubit.weatherModel?.main?.temp}',style: TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.bold,color: Colors.white),),
                  Text('f'),
                ],
              )
            ],
          ),

        ],
      ),
      floatingActionButton: Container(

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0x33ffffff),
          border: Border.all(color: Colors.white,width: 3),
        ),
        width: 350,
        height: 100,

        child: Padding(
          padding: const EdgeInsets.only(top: 15,left: 10),
          child: Wrap(
            spacing: 10,
            alignment: WrapAlignment.center,
            children: [
              Column(
                children: [
                  Text('${cubit.weatherModel?.main?.humidity}',style: TextStyle(fontSize: 30,color: Colors.white),),
                  Text('Humidity',style: TextStyle(fontSize: 20,color: Colors.white),),
                ],
              ),
              SizedBox (
                  height: 50,
                  child: VerticalDivider(thickness: 3,color: Color(0xb0ffffff),)),
              Column(
                children: [
                  Text('${cubit.weatherModel?.visibility}',style: TextStyle(fontSize: 30,color: Colors.white),),
                  Text('Visibalty',style: TextStyle(fontSize: 20,color: Colors.white),),
                ],
              ),
              SizedBox (
                  height: 50,
                  child: VerticalDivider(thickness: 3,color: Color(0xb0ffffff),)),
              Column(
                children: [
                  Text('${cubit.weatherModel?.wind?.speed}km',style: TextStyle(fontSize: 28,color: Colors.white),),
                  Text('Speed',style: TextStyle(fontSize: 20,color: Colors.white),),
                ],
              ),

            ],
          ),
        ),


      ),
    );
  },
);

  }
}
