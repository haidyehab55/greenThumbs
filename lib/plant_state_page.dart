import 'package:flutter/material.dart';
import 'package:green_thumbs/app_bar_title.dart';
import 'package:green_thumbs/plant_image.dart';
import 'plant_stats.dart';

class PlantStatePage extends StatelessWidget {

  @override
    Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const AppBarTitle(),
      ),
      body: Center(

      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Your plant state is", style: Theme.of(context).textTheme.headline4,),
        const SizedBox(height: 45.0,),
        const PlantImage(),
        const SizedBox(
        height: 25,
        ),
        const PlantStats(),
        ],
        ),
      ),
      ),

      );
    }
  }
